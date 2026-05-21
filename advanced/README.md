# Advanced Percy + Selenium-Ruby example

This directory exercises the full applicable Percy SDK feature surface for `percy-selenium` (Ruby gem). See the basic example at the repo root for the minimum integration.

## What this example covers

An RSpec suite (`spec/todomvc_advanced_spec.rb`) where each `it` exercises one row of the [Percy SDK Advanced Feature Matrix](../../../docs/advanced-example-feature-matrix.md). Global SDK config — readiness preset, default widths, percyCSS, discovery — lives in `.percy.yml`.

Note: `scope`, `domTransformation`, `discovery` are marked `N/A` — not exposed in `percy-selenium` Ruby 1.1.2 options hash.

## Run locally

```bash
cd advanced
make install                       # bundle install + npm install of @percy/cli
export PERCY_TOKEN="<your token>"  # do NOT commit this
make test
```

To run without a real token (CI assertion mode):

```bash
make test-advanced-ci   # uses --testing + PERCY_TOKEN=fake_token + captures /test/requests
```

The CI variant asserts every matrix row appears in the captured POST bodies at the local `/test/requests` endpoint. No real Percy build is created.

## Coverage matrix

States: `Covered` / `N/A — <reason>` / `Planned` / `Deprecated`. Source of truth is [`matrix.yml`](./matrix.yml).

| Feature | State | Test |
|---|---|---|
| widths | Covered | `exercises widths` |
| minHeight | Covered | `exercises minHeight` |
| enableJavaScript | Covered | `exercises enableJavaScript` |
| responsiveSnapshotCapture | Covered | `exercises responsive_snapshot_capture` |
| readiness preset | Covered | `exercises readiness preset` |
| labels | Covered | `exercises labels` |
| testCase | Covered | `exercises testCase` |
| devicePixelRatio | Covered | `exercises devicePixelRatio` |
| browsers override | Covered | `exercises browsers override` |
| regions | Covered | `exercises regions` |
| sync mode | Covered | `exercises sync option` |
| snake_case + camelCase dual naming | Covered | `snake_case + camelCase dual naming` |
| percyCSS | Covered | global via `.percy.yml` |
| cross-origin iframe handling | Covered | automatic via `percy-selenium >= 1.1.2` |
| `.percy.yml` global config | Covered | `.percy.yml` consumed at build start |
| environment info reporting | Covered | automatic via `percy-selenium` client info |
| PERCY_SERVER_ADDRESS via env | Covered | CI advanced job picks up `PERCY_SERVER_ADDRESS` |
| `Percy.create_region` helper | Planned | — |
| `scope` | N/A | Not exposed in Ruby SDK 1.1.2 |
| `domTransformation` | N/A | Not exposed in Ruby SDK 1.1.2 |
| `discovery` per-snapshot | N/A | discovery is per-build only |
