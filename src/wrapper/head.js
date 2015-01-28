/*global define*/
!(function (name, definition) {
  // Check define
  var hasDefine = typeof define === 'function',
    // Check exports
    hasExports = typeof module !== 'undefined' && module.exports;

  if (hasDefine) {
    // AMD Module or CMD Module
    define(definition);
  } else if (hasExports) {
    // Node.js Module
    module.exports = definition(require('Caret'));
  } else {
    // Assign to common namespaces or simply the global object (window)
    this[name] = definition();
  }
})('Caret', function () {
