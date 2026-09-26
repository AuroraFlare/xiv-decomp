# Native Xref Decomp - 2026-06-17

Read-only native correlation pass over `ffxivgame.exe`. This is not a source-code implementation pass.

## What This Adds

The prior `native_boundary_scan_20260617` pack proved that focused ItemSearch/Retainer/Bazaar strings and Lua bridge names exist. This pack goes one layer deeper by mapping those strings through the PE image:

- PE section map and image base.
- Absolute/RVA/raw xrefs to focused native strings.
- MSVC RTTI TypeDescriptor candidates for focused class symbols.
- CompleteObjectLocator candidates derived from TypeDescriptor xrefs.
- Vtable candidates derived from CompleteObjectLocator refs.
- Code/data xrefs to those vtables.
- Triage rankings and entity correlation across native strings, Lua bridge/method surfaces, and server packet classes.

## Key Files

- `pe_sections.csv` - PE section headers for address translation.
- `focus_native_strings_xref_summary.csv` - one row per focused native string with ref counts.
- `focus_native_string_xrefs.csv` - concrete refs to focused strings, with rough instruction/prologue guesses.
- `focus_rtti_type_descriptors.csv` - class symbol -> TypeDescriptor analysis.
- `focus_rtti_col_candidates.csv` - TypeDescriptor -> CompleteObjectLocator candidates.
- `focus_rtti_vtable_candidates.csv` - likely vtables and first function-pointer prefixes.
- `focus_vtable_xrefs.csv` - refs to vtable candidates.
- `focus_code_xref_windows.csv` - compact byte/ascii windows around focused code refs.
- `native_decomp_target_rankings.csv` - ranked native targets for further reverse-engineering.
- `native_lua_packet_entity_correlation.csv` - native/Lua/packet evidence by named entity.
- `ghidra_focus_bookmarks.csv` - address/comment rows useful for importing/bookmarking in a GUI reverser.
- `summary.json` - counts.

## Summary

- Image base: `0x400000`
- Sections: 6
- Focus native strings: 289
- Focus string xref rows: 310
- Focus class symbols: 42
- RTTI TypeDescriptor rows: 42
- Valid CompleteObjectLocator candidates: 54
- RTTI vtable candidates: 54
- Vtable xref rows: 123
- Vtable code xrefs: 123
- Entity correlation rows: 11


## Retainer/Market-Only Slices

The raw focused scan intentionally preserves all prior native focus terms. Because `materia` can also catch unrelated `Material` class names, the following cleaned slices are the better handoff for retainer/market work:

- `retainer_market_decomp_target_rankings.csv` - clean ranked targets without Material noise.
- `retainer_market_rtti_type_descriptors.csv` - ItemSearch/Retainer/Bazaar/Market TypeDescriptors.
- `retainer_market_rtti_vtable_candidates.csv` - cleaned vtable candidates.
- `retainer_market_vtable_xrefs.csv` - cleaned vtable refs.
- `retainer_market_native_string_xrefs.csv` - cleaned string xrefs.
- `retainer_market_code_xref_windows.csv` - cleaned code-ref byte windows.
- `retainer_market_ghidra_bookmarks.csv` - cleaned GUI bookmark import rows.


## Vtable Function Expansion

These files expand cleaned vtable candidates into native function seeds:

- `retainer_market_vtable_functions.csv` - each virtual function pointer with byte-window bounds and first bytes.
- `retainer_market_vfunction_focus_string_refs.csv` - focused string refs found inside each virtual function window.
- `retainer_market_vfunction_call_seeds.csv` - raw near `E8 rel32` call targets inside each virtual function window; heuristic and noisy.
- `retainer_market_vfunction_call_seeds_prologue_filtered.csv` - stricter call seeds whose target lands on a `55 8B EC` prologue guess.
- `retainer_market_vfunction_rankings.csv` - function-level triage score, biased toward history/price/direct-purchase classes.

## Retainer / Market Search Takeaway

This pass provides stronger native anchors for the UI side: ItemSearch list/history/price/direct-purchase widgets, Retainer list/menu symbols, Bazaar edit widgets, and the Lua wait bridge. It still does not prove the retainer detail/history receive packet layout. The best next native targets are the classes with valid RTTI/vtable candidates plus strong ItemSearch/Retainer terms, especially `ItemSearchHistoryViewWidget`, `ItemSearchPriceViewWidget`, and `ItemSearchDirectPurchaseWidget`.

## Confidence Notes

- RTTI reconstruction is structural and stronger than plain string evidence when TypeDescriptor -> CompleteObjectLocator -> vtable links validate.
- Function starts are approximate guesses based on nearby `55 8B EC` prologues; optimized functions can evade this.
- Instruction guesses are lightweight byte-pattern labels, not full disassembly.
