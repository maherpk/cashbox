Package.describe({
  name: 'simple:bookshelf',
  version: '0.0.1',
  documentation: null
});

Npm.depends({
  bookshelf: '0.8.1',
  knex: '0.8.6',
  exposify: '0.4.3',
  bluebird: '2.9.34'
});

Package.onUse(function(api) {
  api.versionsFrom('1.4.2');
  api.use('modules');
  api.use('ecmascript');
  api.use('underscore');

  api.use('cosmos:browserify@0.9.2');
  // api.addFiles(, 'client');
  api.addFiles([
    'sync-promise.browserify.js',
    'bookshelf.browserify.js',
    'bookshelf.browserify.options.json'
  ], 'client');
  // api.addFiles(, 'client');

  api.addFiles('knex.js');
  api.addFiles('bookshelf.js');

  api.export(['Bookshelf', 'Knex']);
});

Package.onTest(function(api) {
  api.use('ecmascript');
  api.use('tinytest');
  api.use('simple:bookshelf');
  api.addFiles('knex_tests.js', 'client');
});
