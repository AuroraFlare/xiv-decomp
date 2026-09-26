#!/usr/bin/env python3
"""Recover camp-crystal embedded animation, VFX, and appearance evidence.

Read-only against the installed 1.x client. Writes only an evidence directory.
Texture decoding follows the PWIB shared pixel buffer / GTEX mip descriptors,
also implemented in FF14 Workshop's LegacyTextureLoader.ReadGtexBitmap.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import io
import json
import struct
from pathlib import Path

from PIL import Image, ImageDraw, ImageStat

from build_bgobj_embedded_animation_atlas import repair_declared_pwib_trailer
from build_bgobj_embedded_scheduler_contract import parse_scheduler
from build_garuda_tornado_decomp import ascii_strings, parse_pwib, payload_tag, walk_pwib_resources
from build_monster_action_scheduler_contract import parse_mcb, parse_mtb

ROOT = Path(__file__).resolve().parents[1]
MODELS = (('b902', 'e001'), ('b902', 'e002'), ('b903', 'e001'), ('b904', 'e001'))


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def write_json(path: Path, value: object) -> None:
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + '\n', encoding='utf-8')


def write_csv(path: Path, rows: list[dict]) -> None:
    fields = list(dict.fromkeys(key for row in rows for key in row))
    with path.open('w', newline='', encoding='utf-8') as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, lineterminator='\n')
        writer.writeheader()
        writer.writerows(rows)


def texture_image(container: bytes, payload: bytes) -> tuple[Image.Image, dict]:
    gtex = payload.index(b'GTEX')
    fmt, mip_count = payload[gtex + 6:gtex + 8]
    width, height = struct.unpack_from('>HH', payload, gtex + 10)
    local_offset, mip_offset, mip_size = struct.unpack_from('>III', payload, gtex + 20)
    assert local_offset == 0, 'This extractor requires PWIB shared texture pixels'
    shared_offset = struct.unpack_from('>I', container, 12)[0]
    start = shared_offset + mip_offset
    pixels = container[start:start + mip_size]
    assert len(pixels) == mip_size and width and height and mip_count
    if fmt in (3, 4):
        assert mip_size == width * height * 4
        decoded = Image.frombytes('RGBA' if fmt == 4 else 'RGB', (width, height), pixels,
                                  'raw', 'BGRA' if fmt == 4 else 'BGRX')
    else:
        fourcc = {24: b'DXT1', 25: b'DXT3', 26: b'DXT5'}[fmt]
        expected = ((width + 3) // 4) * ((height + 3) // 4) * (8 if fmt == 24 else 16)
        assert mip_size == expected
        header_words = [124, 0x81007, height, width, mip_size, 0, 1] + [0] * 11
        header_words += [32, 4, int.from_bytes(fourcc, 'little'), 0, 0, 0, 0, 0]
        header_words += [0x1000, 0, 0, 0, 0]
        header = b'DDS ' + struct.pack('<31I', *header_words)
        decoded = Image.open(io.BytesIO(header + pixels)).convert('RGBA')
    return decoded, dict(format=fmt, width=width, height=height, mip_count=mip_count,
                         shared_pixel_offset=shared_offset, mip0_relative_offset=mip_offset,
                         mip0_absolute_offset=start, mip0_bytes=mip_size, mip0_sha256=digest(pixels))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--client-root', type=Path,
                        default=Path(r'C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV'))
    parser.add_argument('--output-dir', type=Path,
                        default=ROOT / 'outputs/atomos-deepvoid-decomp-20260907/aetheryte-effects')
    args = parser.parse_args()
    out = args.output_dir.resolve()
    out.mkdir(parents=True, exist_ok=True)
    (out / 'resources').mkdir(exist_ok=True)
    (out / 'textures').mkdir(exist_ok=True)
    sources, inventory, schedulers, motions, edges, textures, attachments = [], [], [], [], [], [], []
    visual_textures = {}
    resources_by_model = {}

    def source(path: Path) -> bytes:
        data = path.read_bytes()
        sources.append(dict(path=str(path.resolve()), bytes=len(data), sha256=digest(data)))
        return data

    for model, variant in MODELS:
        model_key = f'{model}_{variant}'
        path = args.client_root / f'client/chara/bgobj/{model}/equ/{variant}/top_mdl/0001'
        physical = source(path)
        parsed, padded = repair_declared_pwib_trailer(physical)
        nodes = list(walk_pwib_resources(parsed))
        resources_by_model[model_key] = nodes
        for index, (layer, resource) in enumerate(nodes):
            tag = payload_tag(resource.payload)
            filename = f'{model_key}_{index:03d}_{resource.resource_id or tag}.bin'
            (out / 'resources' / filename).write_bytes(resource.payload)
            common = dict(model=model, variant=variant, layer=layer, resource_id=resource.resource_id,
                          resource_path=resource.resource_path, tag=tag, bytes=len(resource.payload),
                          sha256=digest(resource.payload), extracted_path=f'resources/{filename}')
            strings = ascii_strings(resource.payload)
            inventory.append(dict(**common, strings=';'.join(strings), padded_source_bytes=padded))
            if tag == 'SEDBvins':
                attachments.append(dict(**common, actor_bind_class_present=any(s.endswith('/ActorBind') for s in strings),
                                        instance_names=';'.join(s for s in strings if s.startswith('__LeafInstance_Id__')),
                                        bone_name_strings=';'.join(s for s in strings if s.startswith('n_')),
                                        interpretation='Authored binding vocabulary; instance-to-bone numeric mapping not decoded'))
            if tag == 'SEDBSCB':
                actor, blocks, clips, ridt = parse_scheduler(resource.payload)
                # The imported general census divides raw ticks by 1e6. This
                # is not established for these motion-related scheduler units.
                for row in blocks + clips:
                    for key in list(row):
                        if key.endswith('_seconds'):
                            row.pop(key)
                schedulers.append(dict(**common, actor=actor, blocks=blocks, clips=clips, resource_table=ridt))
            elif tag == 'SEDBmtb':
                motions.append(dict(**common, **parse_mtb(resource.payload)))
            elif tag == 'SEDBMCB':
                summary, clips = parse_mcb(resource.payload, resource.resource_id)
                motions.append(dict(**common, **summary, clips=clips))
            if tag in ('SEDBACB', 'SEDBvins', 'SEDBleaf'):
                target_tag = {'SEDBACB': 'SEDBvins', 'SEDBvins': 'SEDBleaf', 'SEDBleaf': 'SEDBveff'}[tag]
                for target_layer, target in nodes:
                    if payload_tag(target.payload) != target_tag or not target.resource_id:
                        continue
                    token = target.resource_id.encode() + b'\0'
                    count = resource.payload.count(token)
                    if count:
                        edges.append(dict(model=model, variant=variant, source_id=resource.resource_id,
                                          source_tag=tag, target_id=target.resource_id, target_tag=target_tag,
                                          occurrences=count, source_sha256=common['sha256'],
                                          target_sha256=digest(target.payload)))

        for slot in ('top_tex1', 'top_tex2'):
            texture_path = path.parent.parent / slot / '0000'
            if not texture_path.is_file():
                continue
            container = source(texture_path)
            for resource in parse_pwib(container):
                if payload_tag(resource.payload) != 'SEDBtxb':
                    continue
                decoded, metadata = texture_image(container, resource.payload)
                filename = f'{model_key}_{slot}_{resource.resource_id}.png'
                decoded.save(out / 'textures' / filename)
                rgb = decoded.convert('RGB')
                mean = ImageStat.Stat(rgb).mean
                textures.append(dict(model=model, variant=variant, slot=slot, resource_id=resource.resource_id,
                                     descriptor_sha256=digest(resource.payload), **metadata,
                                     mean_rgb=json.dumps(mean), image=f'textures/{filename}'))
                if model == 'b902' and slot == 'top_tex1' and resource.resource_id.endswith(('_fz', 'aetl2_ch')):
                    visual_textures[(variant, resource.resource_id[-2:])] = decoded

    # Render raw decoded texture previews. This is not a recreated in-game effect.
    sheet = Image.new('RGB', (780, 390), '#17202a')
    draw = ImageDraw.Draw(sheet)
    draw.text((16, 12), 'b902 raw crystal textures: e001 / e002 (not a game render)', fill='white')
    for column, variant in enumerate(('e001', 'e002')):
        x = 16 + column * 390
        draw.text((x, 42), variant, fill='white')
        for suffix, y, size in (('fz', 72, (352, 42)), ('ch', 140, (240, 240))):
            texture = visual_textures[(variant, suffix)]
            sheet.paste(texture.convert('RGB').resize(size, Image.Resampling.NEAREST), (x, y))
    sheet.save(out / 'b902_texture_comparison.png')

    # Hash exact native evidence inputs rather than claiming a new native binding.
    native_inputs = [
        ROOT / 'outputs/bgobj-model-load-invocation-contract-20260810/README.md',
        ROOT / 'outputs/bgobj-embedded-lifecycle-contract-20260810/README.md',
        ROOT / 'Data/sql/gamedata_actor_appearance.sql',
        ROOT / 'Data/sql/gamedata_actor_class.sql',
        ROOT / 'Data/sql/server_eventnpc_spawn_locations.sql',
        ROOT / 'Data/scripts/commands/gm/spawnbgmodel.lua',
        ROOT / 'tools/build_garuda_tornado_decomp.py',
        ROOT / 'tools/build_bgobj_embedded_animation_atlas.py',
        ROOT / 'tools/build_bgobj_embedded_scheduler_contract.py',
        ROOT / 'tools/build_monster_action_scheduler_contract.py',
        ROOT / 'tools/build_bgobj_model_load_invocation_contract.py',
        Path(__file__),
    ]
    for path in native_inputs:
        source(path)
    exe = source(args.client_root / 'ffxivgame.exe')
    assert digest(exe) == '9341f2b4567440b310a4d494f5cc5599ca334ba51c8042247317ff466492f2e9', 'Native evidence executable hash differs'
    a = {(r.resource_id, payload_tag(r.payload)): digest(r.payload)
         for _, r in resources_by_model['b902_e001'] if r.resource_id}
    b = {(r.resource_id, payload_tag(r.payload)): digest(r.payload)
         for _, r in resources_by_model['b902_e002'] if r.resource_id}
    common_resources = [dict(resource_id=key[0], tag=key[1], identical=a[key] == b[key],
                             e001_sha256=a[key], e002_sha256=b[key]) for key in sorted(a.keys() & b.keys())]
    assert all(row['identical'] for row in common_resources if row['tag'] in
               ('SEDBmtb', 'SEDBMCB', 'SEDBveff', 'SEDBvins', 'SEDBleaf', 'SEDBACB'))
    summary = dict(models=len(MODELS), resources=len(inventory), schedulers=len(schedulers),
                   motion_resources=len(motions), effect_edges=len(edges), textures=len(textures),
                   scheduler_names=sorted({row['resource_id'] for row in schedulers}),
                   b902_vfx_and_motion_byte_identical_between_variants=True,
                   scope='Embedded crystal resources and textures; no runtime modification or visual bank identification')
    write_json(out / 'source_manifest.json', sources)
    write_csv(out / 'resources.csv', inventory)
    write_json(out / 'schedulers.json', schedulers)
    write_json(out / 'motions.json', motions)
    write_csv(out / 'effect_edges.csv', edges)
    write_csv(out / 'effect_attachments.csv', attachments)
    write_csv(out / 'textures.csv', textures)
    write_csv(out / 'b902_shared_resource_comparison.csv', common_resources)
    write_json(out / 'summary.json', summary)
    print(json.dumps(summary, indent=2))


if __name__ == '__main__':
    main()
