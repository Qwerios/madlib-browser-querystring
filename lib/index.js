(function() {
  (function(factory) {
    if (typeof exports === "object") {
      return module.exports = factory();
    } else if (typeof define === "function" && define.amd) {
      return define([], factory);
    }
  })(function() {
    var get;
    return get = function() {
      var existing, name, pair, query, queryString, value, variable, variables, _i, _len;
      queryString = {};
      query = document.location.search.substring(1);
      variables = query.split("&");
      for (_i = 0, _len = variables.length; _i < _len; _i++) {
        variable = variables[_i];
        pair = variable.split("=");
        name = pair[0];
        value = pair[1];
        existing = queryString[name];
        if (existing != null) {
          if (typeof existing === "string") {
            queryString[name] = [existing, value];
          } else {
            queryString[name].push(value);
          }
        } else {
          queryString[name] = value;
        }
      }
      return queryString;
    };
  });

}).call(this);
