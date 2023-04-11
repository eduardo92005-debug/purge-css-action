#!/bin/sh -l
init() {
    npm i @node-minify/cli -g
}

uglify_compress_js() {
    npm i @node-minify/uglify-js -g
    find . -type f -iname \*.js | while read fname
    do
        node-minify --compressor uglify-js --input ${fname} --output ${fname}
    done
    echo "Javascript compress DONE!"
}

clean_compress_css(){
    npm i @node-minify/clean-css -g
    find . -type f -iname \*.css | while read fname
    do
        node-minify --compressor clean-css --input ${fname} --output ${fname}
    done
    echo "CSS compress DONE!"
}

html_compress(){
    npm i @node-minify/html-minifier -g
    find . -type f -iname \*.html | while read fname
    do
        node-minify --compressor html-minifier --input ${fname} --output ${fname}
    done
    echo "HTML compress DONE!"
}


init
uglify_compress_js
clean_compress_css
html_compress