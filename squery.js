/*! squery | (c) silverwind | BSD license */

(function() {
  "use strict";
  window.$ = function $(selector) {
    var nodes = document.querySelectorAll(selector);
    return nodes.length === 1 ? nodes[0] : nodes;
  };

  /* Node.prototype */
  var eventListeners = [];
  Node.prototype.on = window.on = function(names, fn) {
    var self = this;
    names.split(" ").forEach(function(name) {
      self.addEventListener(name, fn);
      eventListeners.push({node: self, name: name, fn: fn});
    });
    return this;
  };
  Node.prototype.off = window.off = function(names, fn) {
    var self = this;
    names.split(" ").forEach(function(name) {
      eventListeners = eventListeners.filter(function(l) {
        if (l.node === self && l.name === name && (fn ? l.fn === fn : true)) {
          self.removeEventListener(name, l.fn);
          return false;
        } else return true;
      });
    });
    return this;
  };
  Node.prototype.find = function(selector) {
    var nodes = this.querySelectorAll(selector);
    return nodes.length === 1 ? nodes[0] : nodes;
  };

  /* NodeList.prototype */
  NodeList.prototype.__proto__ = Array.prototype; // eslint-disable-line
  NodeList.prototype.on = function(events, fn) {
    this.forEach(function(elem) {
      elem.on(events, fn);
    });
    return this;
  };
  NodeList.prototype.off = function(events, fn) {
    this.forEach(function(elem) {
      elem.off(events, fn);
    });
    return this;
  };
})();
