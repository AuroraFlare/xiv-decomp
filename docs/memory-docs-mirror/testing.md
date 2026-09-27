# Testing

FF14-memory keeps its focused regression checks close to the code they exercise.
The registered inventory is in [`tests/suites.json`](../tests/suites.json), and
[`tests/run.py`](../tests/run.py) provides one entry point for the C# harnesses,
Python checks, and PowerShell validators.

The prerequisites are Python 3.10+, the .NET SDK selected by [`global.json`](../global.json)
(currently 10.0.301 with latest-feature roll-forward), and PowerShell 7 (`pwsh`)
for the static Dzemael suite. Restore the relevant .NET projects before a run
when package assets are not already present.

Run commands from any directory; the runner resolves the repository root from
its own location. The no-argument command runs the complete reviewed offline
profile, builds selected .NET projects into a fresh `.test-results` directory,
runs each suite in its own process, and writes logs, `summary.json`, and
`summary.junit.xml` there.

```powershell
python -B tests/run.py
python -B tests/run.py --audit
python -B tests/run.py --profile smoke
python -B tests/run.py --profile offline --keep-going
python -B tests/run.py --list
```

Use focused selectors when working on one subsystem:

```powershell
python -B tests/run.py --suite dzemael-encounter
python -B tests/run.py --tag coordinates --keep-going
python -B tests/run.py --profile offline --tag quests --keep-going
python -B tests/run.py --profile regression --exclude-tag lua
python -B tests/run.py --suite fishing-combat --no-build --results .test-results/fishing-combat-validation
```

`--dry-run` prints each run and build argument array as JSON without starting a
process. The runner never invokes a shell, so paths containing spaces remain
single arguments. Dotnet suites are built before they run; a failed build
records `build-failed` and never falls back to an older assembly. Garuda's cast
suite also builds the production Map Server dependency into the same isolated
run and passes that exact DLL to the harness.

`--no-build` executes the DLLs in the selected results directory's
`build/<suite>` folder and fails if they are absent. Use it with the
`--results` directory from an earlier successful run; it never falls back to a
project's normal `bin` output.

Before and after implementation work, run `--audit` and the narrowest relevant
tag or suite selection. If a change has no matching registered suite, add a
meaningful harness and manifest entry, or record why the existing specialized
asset remains explicit-only. The catalog audit currently accounts for 64 C#
test projects, 99 Python test files, and 41 PowerShell validators; 32 unique
test assets are registered across 33 suite contracts, and the remaining assets
have explicit external dependency or adapter exclusions. The `integration`
profile contains a registered check that needs an asset moved to the separate
decompilation repository, so it stays out of the offline default until that
dependency is available.

Normal suite runs perform the same catalog audit automatically before starting
the first test process; `--audit` is the read-only form for reviewing coverage
without executing suites.

The runner does not retry a failed suite. Retrying can hide nondeterminism and
is better handled by fixing the failing harness or rerunning the selected
command deliberately. `--keep-going` controls whether later suites run after a
failure; the process exits nonzero if any selected suite fails.

When `--suite` is supplied it is the explicit suite selection and takes
precedence over `--profile`; tags and exclusions then filter that selection.
Tag-only selections search the complete registered catalog, so `--tag combat`
does not silently stop at the smoke profile. Exclusion-only selections begin
with the default offline profile. Unknown tags and empty selections fail before
any process starts.

The smoke profile is intentionally small and has no database or live service
dependency. The offline profile is the default and includes every reviewed
repository-local suite, including the deterministic quest/story harnesses
`gc-campaign-runtime`, `gc-opening-rule`, `moonfire-quest`,
`gc-opening-npcs`, `gc-field-encounters`, and `etc1-quest-mobs`, plus the
existing `quest-counter-slots` and `treasures-of-main` checks. Database,
live-service, native-client,
and other adapter-dependent checks remain explicit-only until their command
contract is registered; the audit prevents new test assets from disappearing
silently.

The promoted quest/story harnesses exercise repository-local Grand Company and
Moonfire behavior with deterministic Lua/C# test doubles and frozen data
assertions. They are safe for the offline and regression profiles, but they do
not replace live-client or database validation. Harnesses that currently fail,
depend on recovered or external assets, or rely on unresolved evidence remain
explicit-only; do not promote them until their contracts are deterministic and
passing.

Validate the runner itself with:

```powershell
python -B -m unittest discover -s tests -p test_runner.py
```
