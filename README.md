# Jsonnet Updater

This Github action automatically opens PRs to update jsonnet libraries vendored with [jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler).

To use setup a github action workflow as such:

```yaml
name: Jsonnet Updater
on:
  schedule:
  - cron:  '*/15 * * * *'

jobs:
  Jsonnet-Updater:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2

    - name: Run Jsonnet Updater
      uses: grafana/jsonnet-updater@v0.4
      with:
        git-user-name: Tom Wilkie
        git-user-email: tom@grafana.com
      env:
        GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}
```
