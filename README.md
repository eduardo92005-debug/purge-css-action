### Usage
Change the branch to your production branch
```yaml
name: Minify with node-minify
on:
  push:
    branches: [ production ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      # Checks-out your repository
      - uses: actions/checkout@v2
        with:
          ref: ${{ github.ref }}

      - name: Minify with node-minify Action
        uses: eduardo92005-debug/minify-all@v1

      # Auto-commit to repository
      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: Minified
          branch: ${{ github.ref }}
```
