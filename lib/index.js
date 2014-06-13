(function() {
  (function(factory) {
    if (typeof exports === "object") {
      return module.exports = factory();
    } else if (typeof define === "function" && define.amd) {
      return define([], factory);
    }
  })(function() {

    /**
     *   Extracts the browsers querystring (url) and returns it as an object
     *   Adopted from: http://stackoverflow.com/questions/979975/how-to-get-the-value-from-url-parameter
     *
     *   @author     mdoeswijk
     *   @module     getQueryString
     *   @static
     *   @version    0.1
     *
     *   @returns {Object}   The query string parameters as an object
     */
    var getQueryString;
    return getQueryString = function() {
      var existing, name, pair, query, queryString, value, variable, variables, _i, _len;
      queryString = {};
      if ((typeof document !== "undefined" && document !== null) && (document.location != null)) {
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
      }
      return queryString;
    };
  });

}).call(this);
