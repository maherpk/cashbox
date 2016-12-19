Package.describe({
  name: 'local:escpos',
  version: '0.0.1',
  documentation: null
});

Npm.depends({
  escpos: '2.1.0'
});

Package.onUse(function(api) {
  api.addFiles('escpos.js', 'server');

  api.export(['Escpos']);
});

Package.onTest(function(api) {
  
});
