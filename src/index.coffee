( ( factory ) ->
    if typeof exports is "object"
        module.exports = factory(
        )
    else if typeof define is "function" and define.amd
        define( [
        ], factory )

)( () ->
    ###*
    #   Extracts the browsers querystring (url) and returns it as an object
    #   Adopted from: http://stackoverflow.com/questions/979975/how-to-get-the-value-from-url-parameter
    #
    #   @author     mdoeswijk
    #   @module     getQueryString
    #   @static
    #   @version    0.1
    #
    #   @returns {Object}   The query string parameters as an object
    ###
    #
    getQueryString = () ->
        queryString = {}

        if document? and document.location?
            # Extract the search part of the url omitting the leading '?'
            #
            query       = document.location.search.substring( 1 )
            variables   = query.split( "&" )

            # Build the variables
            #
            for variable in variables
                pair     = variable.split( "=" )
                name     = pair[ 0 ]
                value    = pair[ 1 ]
                existing = queryString[ name ]

                if existing?
                    if typeof existing is "string"
                        # Upgrade to array
                        #
                        queryString[ name ] = [ existing, value ]

                    else
                        queryString[ name ].push( value )
                else
                    queryString[ name ] = value

        return queryString
)