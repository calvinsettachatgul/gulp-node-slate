<p align=center>
   <img src=https://raw.githubusercontent.com/lord/img/master/logo-slate.png width=200 alt=logo><br>
   Slate helps you create beautiful, intelligent, responsive API documentation.<br>
   <img src=https://raw.githubusercontent.com/lord/img/master/screenshot-slate.png width=700 alt=screenshot>
</p>

# gulp-node-slate
*[node-slate](https://github.com/center-key/node-slate) as a gulp task*

[![License:MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/center-key/gulp-node-slate/blob/master/LICENSE.txt)
[![npm](https://img.shields.io/npm/v/gulp-node-slate.svg)](https://www.npmjs.com/package/gulp-node-slate)
[![Dependencies](https://david-dm.org/center-key/gulp-node-slate/status.svg)](https://david-dm.org/center-key/gulp-node-slate)
[![Vulnerabilities](https://snyk.io/test/github/center-key/gulp-node-slate/badge.svg)](https://snyk.io/test/github/center-key/gulp-node-slate)
[![Build](https://travis-ci.org/center-key/gulp-node-slate.svg)](https://travis-ci.org/center-key/gulp-node-slate)

## A) Lightning quick demo
Don't have an existing gulp project?  Just want to experiment with no commitment?
#### Blindly enter these 9 commands in your terminal:
```shell
$ mkdir my-api-docs
$ cd my-api-docs
$ npm init --yes
$ npm install --save-dev gulp gulp-node-slate
$ f=https://raw.githubusercontent.com/center-key/gulp-node-slate/master/gulpfile.js
$ curl --remote-name $f
$ cat gulpfile.js
$ node node_modules/gulp/bin/gulp.js slate
$ open build/index.html
```
<!--
mkdir my-api-docs
cd my-api-docs
npm init --yes
npm install --save-dev gulp gulp-node-slate
f=https://raw.githubusercontent.com/center-key/gulp-node-slate/master/gulpfile.js
curl --remote-name $f
cat gulpfile.js
node node_modules/gulp/bin/gulp.js slate
open build/index.html
-->
Otherwise, follow the steps below.

## B) Instructions
#### 1. Install into your project:
```shell
$ npm install --save-dev gulp gulp-node-slate
```
#### 2. Add a task to your **gulpfile.js**:
```javascript
// Imports
const slate = require('gulp-node-slate');

// Tasks
const generateApiDocs = () => gulp.src([]).pipe(slate());

// Gulp
gulp.task('slate', generateApiDocs);
```
#### 3. Build and view the API documentation:
```shell
$ gulp slate
$ ls source
$ open build/index.html
```
The structure of the generated `source` folder is:
```
source/
   images/
      logo.png
   includes/
      *.md
   custom.scss
   index.yml
```
#### 4. Get to work
Customize the files in the `source` folder to create your API documentation
and then rerun `gulp slate`.

## C) Configuration
Example of passing in options:
```javascript
.pipe(slate({ source: 'api-docs/input', build: 'api-docs/output' }))
```
**Options:**
* `source` &ndash; Relative path to the Slate API documentation input folder (default: `'source'`).
* `build` &ndash; Relative path to the Slate API documentation output folder (default: `'build'`).

## E) Notes
1. If you want to contribute to the project, fork it and then run the `spec-runner.sh.command`
script and examine the contents of the `api-docs` folder.  Pull requests are welcome.
1. If you have a question, suggestion, or bug to report, open an
[issue](https://github.com/center-key/gulp-node-slate/issues).

---
[MIT License](LICENSE.txt)
