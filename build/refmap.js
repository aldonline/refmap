// Generated by CoffeeScript 1.6.3
/*
Map[Any,Any]
*/


(function() {
  var refmap;

  module.exports = refmap = function() {
    var arr, clear, del, entry, exists, f, get, get_or_else, keys, set, size, values;
    arr = [];
    entry = function(k) {
      var x, _i, _len;
      for (_i = 0, _len = arr.length; _i < _len; _i++) {
        x = arr[_i];
        if (x[0] === k) {
          return x;
        }
      }
      return void 0;
    };
    get = function(k) {
      var _ref;
      return (_ref = entry(k)) != null ? _ref[1] : void 0;
    };
    exists = function(k) {
      return entry(k) instanceof Array;
    };
    del = function(k) {
      var kv;
      if (exists(k)) {
        arr = (function() {
          var _i, _len, _results;
          _results = [];
          for (_i = 0, _len = arr.length; _i < _len; _i++) {
            kv = arr[_i];
            if (kv[0] !== k) {
              _results.push(kv);
            }
          }
          return _results;
        })();
        return true;
      } else {
        return false;
      }
    };
    set = function(k, v) {
      var e;
      if ((e = entry(k)) != null) {
        if (e[1] === v) {
          return false;
        }
        e[1] = v;
      } else {
        arr.push([k, v]);
      }
      return true;
    };
    keys = function() {
      var kv, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = arr.length; _i < _len; _i++) {
        kv = arr[_i];
        _results.push(kv[0]);
      }
      return _results;
    };
    values = function() {
      var kv, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = arr.length; _i < _len; _i++) {
        kv = arr[_i];
        _results.push(kv[1]);
      }
      return _results;
    };
    clear = function() {
      return arr = [];
    };
    size = function() {
      return arr.length;
    };
    get_or_else = function(k, block) {
      var e, v;
      if ((e = entry(k)) != null) {
        return e[1];
      } else {
        arr.push([k, (v = block())]);
        return v;
      }
    };
    f = function() {
      var a;
      a = arguments;
      switch (a.length) {
        case 1:
          return get(a[0]);
        case 2:
          return set(a[0], a[1]);
        default:
          throw new Error('refmap takes 1 or 2 parameters');
      }
    };
    f.get = get;
    f.set = set;
    f.exists = exists;
    f.del = del;
    f.get_or_else = get_or_else;
    f.keys = keys;
    f.values = values;
    f.clear = clear;
    f.size = size;
    return f;
  };

}).call(this);
