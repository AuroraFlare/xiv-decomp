from pathlib import Path
import re

client_root = Path(r"C:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV")
act_dir = client_root / "client/chara/pc/c001/act"

all_files = list(act_dir.glob("**/*"))
print(f"Total files in pc/c001/act: {len(all_files)}")

# Search for strings relating to death, dead, raise, revive, getup, wake, stand, etc.
keywords = [b"dead", b"ded", b"reviv", b"raise", b"getup", b"wake", b"stand", b"rise", b"down", b"die"]

hits = {}
for p in all_files:
    if not p.is_file():
        continue
    try:
        data = p.read_bytes()
    except:
        continue
    for kw in keywords:
        matches = [m.start() for m in re.finditer(kw, data, re.IGNORECASE)]
        if matches:
            # extract string context around hit
            for m in matches:
                start = max(0, m - 16)
                end = min(len(data), m + 32)
                snippet = data[start:end]
                printable = "".join(chr(b) if 32 <= b <= 126 else "." for b in snippet)
                rel = str(p.relative_to(act_dir))
                hits.setdefault(rel, []).append((kw.decode(), printable))

print(f"Found {len(hits)} files with death/revive/raise related tokens:")
for rel, items in list(hits.items())[:30]:
    print(f"\n--- {rel} ---")
    for kw, snip in items[:5]:
        print(f"  [{kw}] {snip}")
