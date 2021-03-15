const browserSync = require('browser-sync');
const del = require('del');
const util = require('util');
const { decodePackageJsonTask } = require('./gulp/ourutil.js');
const { src, dest, series, parallel, watch } = require('gulp');
//
const execFile = util.promisify(require('child_process').execFile);

function startServerTask(done) {
  'use strict';
  // https://browsersync.io/docs/options
  browserSync.init({
    port: 3001,
    ui: {
      port: 3002
    },
    server: {
      baseDir: 'Documentation-GENERATED-temp/Result/project/0.0.0/',
      directory: false,
      index: 'Index.html',
    }
  });
  done();
}

function reloadBrowser(done) {
  'use strict';
  browserSync.reload();
  done();
}

function cleanTask(done) {
  'use strict';
  del.sync(['Documentation-GENERATED-temp']);
  done();
}

function watchSourceTask(done) {
  'use strict';
  watch(['*.rst', '*.md', './Documentation'], series(makehtmlTask, reloadBrowser));
  done();
}

function child_console_log(promise) {
  'use strict';

  const child = promise.child;

  child.stdout.on('data', function (data) {
    console.log('stdout: ' + data);
  });
  child.stderr.on('data', function (data) {
    console.log('stderr: ' + data);
  });
  child.on('close', function (code) {
    console.log('closing code: ' + code);
  });
  return promise;
}

function makehtmlTask(done) {
  'use strict';
  const promise = execFile('gulp/run_dockrun_t3rd.sh', ['makehtml']);
  return child_console_log(promise);
}

function makehtmlNoCacheTask(done) {
  'use strict';
  const promise = execFile('gulp/run_dockrun_t3rd.sh', ['makehtml-no-cache']);
  return child_console_log(promise);
}

exports.default = function(done) { 'use strict'; console.log('run: gulp --tasks-simple'); done(); };
exports.decodePackageJson = util.decodePackageJsonTask;
exports.watch = series(startServerTask, watchSourceTask);
exports.clean = cleanTask;
exports.decodePackageJson = decodePackageJsonTask;
exports.makehtml = makehtmlTask;
exports.makehtmlNoCache = makehtmlNoCacheTask;
exports.startServer = startServerTask
exports.watch = series(cleanTask, makehtmlTask, startServerTask, watchSourceTask)
