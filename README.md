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
      
      - name: Define env variables to path
        run: | 
             CSS_PATH=path/to/css
             HTML_PATH=path/to/html
             
             
      - name: Minify with node-minify Action
        uses: eduardo92005-debug/purge-css-action@v1
        with:
          css-path: ${{ env.CSS_PATH }}
          html-path: ${{ env.HTML_PATH }}
        run: |
          echo " teste ${{ env.CSS_PATH }} "
          echo " teste 2 ${{ env.HTML_PATH }} "

      # Auto-commit to repository
      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: Minified
          branch: ${{ github.ref }}
```
