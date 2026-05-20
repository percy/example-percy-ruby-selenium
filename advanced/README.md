# Advanced Percy + Selenium-Ruby example — STUB

**Status:** Phase 1 stub. `matrix.yml` is populated based on `percy-selenium` (Ruby gem) research. Test code in `tests/advanced.rb` is **not yet written**.

See the basic example at the repo root. See [`matrix.yml`](./matrix.yml) for the planned matrix-row coverage.

## What this example will cover

Each test will exercise one row of the matrix (widths, minHeight, enableJavaScript, responsive_snapshot_capture, readiness preset, percyCSS, regions via `Percy.create_region`, dual snake_case/camelCase naming).

Note: `scope`, `dom_transformation`, `discovery` are marked `N/A` — not exposed in `percy-selenium` ruby 1.1.2 options hash.

## Run locally (once tests are written)

```bash
cd advanced
bundle install
npm install -g @percy/cli
export PERCY_TOKEN="<your project token>"      # do NOT commit
npx percy exec -- ruby tests/advanced.rb
```

## Coverage matrix

Source of truth: [`matrix.yml`](./matrix.yml).

> Phase 1 stub: most rows are currently `Planned`. Basic example has three bare `Percy.snapshot` calls. `tests/readiness.rb` already exercises readiness preset variants.
