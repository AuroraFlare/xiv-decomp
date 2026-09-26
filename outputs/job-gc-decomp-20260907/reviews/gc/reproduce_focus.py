"""Reproduce the independently reviewed GC branch/director slices.

This only parses recorded Lua bytecode. It neither runs the client nor changes
server state. The shared complete evidence builder owns the bulk extraction.
"""
from pathlib import Path
import csv
import hashlib
import json
import re
import sys

ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT / 'tools'))
from disassemble_lua51 import OPNAMES, Reader, direct_method_map, format_instruction
from build_gc_mission_decomp import trace

BASE = ROOT / 'tools/outputs/lpb/decomp_more_20260617/luac'
OUT = Path(__file__).parent
FOCUS = {
    'com0l5': ['processEvent_010', 'processEvent_015', 'processEvent_elevator_nq1', 'processEvent_elevator_nq2'],
    'com0g5': ['followEvent005', 'processEvent005', 'processEvent010', 'processEvent011', 'processEvent012', 'processEvent020', 'processEvent030'],
    'com0u5': ['processEvent025', 'processEvent030'],
    'com0l6': ['processEvent_010', 'processEvent_015', 'processEvent_elevator_nq1', 'processEvent_elevator_nq2'],
    'com0g6': ['processEventLewin', 'processEventPesi', 'processEventClear', 'processEventNq'],
    'com0u6': ['processEvent_005_03', 'processEvent_010', 'processEvent_elevator_nq1F', 'processEvent_elevator_nq2F', 'processEvent_elevator_nq3F'],
    'com0l7': ['processEventGuincamStart', 'processEventGuincamEnd'],
    'com0g7': ['processEventFulkeStart', 'processEventFulkeEnd'],
    'com0u7': ['processEventAubreyStart', 'processEventAubreyEnd'],
    'gcl101': ['processEventGuincumStart', 'processEventFulkeStart', 'processEventAubreyStart', 'processEvent_000', 'processEvent_050', 'processEvent_050_1', 'processEvent_050_2', 'processEvent_050_3', 'processEvent_050_6', 'processEvent_060_NQ1', 'processEvent_060_NQ2', 'processEvent_070'],
    'gcg101': ['initText'], 'gcu101': ['initText'],
    'gcl102': ['processEventRashaht', 'processEventNQ'],
    'gcg102': ['processEventQuinquerol', 'processEventPfrymloefNQF', 'processEventPfrymloefNQ', 'processEventQuinquerolFragC'],
    'gcu102': ['processEvent005', 'processEvent010', 'processEvent015', 'processEvent_elevator_nq1F', 'processEvent_elevator_nq2F'],
    'gcl301': ['processEventCLIFTONStart'],
    'gcg301': ['processEventDYRSTBRODStart'],
    'gcu301': ['processEventCLIFTONStart'],
    'gcl302': ['processEventStart'],
    'gcg302': ['processEventStart', 'processEventChallinie'],
    'gcu302': ['processEventGALERENStart'],
    'gcl304': ['processEvent_005', 'processEvent_010', 'processEvent_010_01'],
    'gcg304': ['processEvent_005', 'processEvent_010', 'processEvent_010_01'],
    'gcu304': ['processEvent_005', 'processEvent_010', 'processEvent_010_01', 'processEvent_015'],
    'gcl701': ['processEventOK', 'processEventExit', 'processEventClear'],
    'gcg701': ['processEventVORSAILEok', 'processEventVORSAILEstop', 'processEventFULKEend'],
    'gcu701': ['processEvent005', 'processEvent010', 'processEvent025'],
}

def read(path):
    reader = Reader(path.read_bytes())
    reader.header()
    root = reader.proto('root')
    assert reader.pos == len(reader.data)
    return root

def ident(path):
    raw = path.read_bytes()
    return dict(source=path.relative_to(ROOT).as_posix(), bytes=len(raw), sha256=hashlib.sha256(raw).hexdigest())

def main():
    slices = []
    inventory = []
    methods = {}
    for code, names in FOCUS.items():
        path = BASE / 'quest/scenario' / ('com' if code.startswith('com') else code[:3]) / (code + '.luac')
        root = read(path)
        mapping = direct_method_map(root)
        methods[code] = mapping
        if code in ('gcg101', 'gcu101'):
            slices.append(f'\n## {code} ROOT\n')
            slices.extend(format_instruction(root, pc, ins) + '\n' for pc, ins in enumerate(root.instructions))
        for name in names:
            p = mapping[name]
            slices.append(f'\n## {code}.{name} params={p.numparams}\n')
            slices.extend(format_instruction(p, pc, ins) + '\n' for pc, ins in enumerate(p.instructions))
        inventory.append(dict(code=code, **ident(path), selected_methods=names, locally_defined_methods=list(mapping)))
    (OUT / 'focused-bytecode.txt').write_text(''.join(slices), encoding='utf-8')
    (OUT / 'focused-source-hashes.json').write_text(json.dumps(inventory, indent=2)+'\n', encoding='utf-8')

    directors=[]
    director_slices=[]
    for path in sorted((BASE/'director').rglob('*.luac')):
        if not re.fullmatch(r'questdirector(?:com0[lgu][1456]01|gc[lgu](?:101|102|301|302|304|701)01)',path.stem):
            continue
        root=read(path)
        directors.append(dict(**ident(path), children=len(root.children), methods=list(direct_method_map(root)), constants=root.constants,
                              instructions=[format_instruction(root,pc,ins) for pc,ins in enumerate(root.instructions)]))
        for name, proto in direct_method_map(root).items():
            director_slices.append(f'\n## {path.relative_to(BASE).as_posix()} :: {name} params={proto.numparams}\n')
            director_slices.extend(format_instruction(proto,pc,ins)+'\n' for pc,ins in enumerate(proto.instructions))
    (OUT/'director-registrations.json').write_text(json.dumps(directors,indent=2)+'\n',encoding='utf-8')
    (OUT/'director-method-bytecode.txt').write_text(''.join(director_slices),encoding='utf-8')

    # Reuse the established inert evaluator only for straight-line/ordinary EQ
    # review slices. Enrollment's actual multiple results/loop are raw-bytecode
    # reviews, not fed into this restricted evaluator.
    traces=[]
    for code,name,values in [
        ('com0l6','processEvent_015',[None,False,True,0,1,2,3,4,5]),
        ('com0g6','processEventClear',[None,False,True,0,1,2,3,4,5]),
        ('com0u6','processEvent_010',[None,False,True,0,1,2,3,4,5]),
        ('com0g5','processEvent020',[None,False,True,0,1,2]),
        ('com0g5','processEvent030',[None,False,True,0,1,2]),
    ]:
        for value in values:
            result=trace(methods[code][name],[value])
            result.update(code=code,method=name)
            traces.append(result)
    (OUT/'campaign-branch-traces.json').write_text(json.dumps(traces,indent=2)+'\n',encoding='utf-8')
    journal_rows=[]
    for table, ids in {
        'xtx_journalxtxSea': [268,269,270,272,273,316,317,318,319,320],
        'xtx_journalxtxFst': [344,345,347,348,374,383,384,385,386,387,388,389],
        'xtx_journalxtxWil': [398,399,401,402,403,408,447,448,449,450,451,452],
    }.items():
        path=ROOT/'docs/Dat Mining'/(table+'.csv')
        with path.open(encoding='utf-8-sig',newline='') as stream:
            texts={int(row[0]):row for row in csv.reader(stream) if row and row[0].isdigit()}
        for number in ids:
            journal_rows.append(dict(**ident(path),row=number,japanese=texts[number][1],english=texts[number][2]))
    (OUT/'special-interaction-journals.json').write_text(json.dumps(journal_rows,indent=2,ensure_ascii=False)+'\n',encoding='utf-8')
    print(json.dumps({'focused_methods':sum(map(len,FOCUS.values())), 'director_chunks':len(directors), 'campaign_traces':len(traces)}))

if __name__=='__main__':
    main()
