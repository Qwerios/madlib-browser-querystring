( ( factory ) ->
    if typeof exports is "object"
        module.exports = factory(
        )
    else if typeof define is "function" and define.amd
        define( [
        ], factory )

)( () ->
    # Adopted from: http://stackoverflow.com/questions/979975/how-to-get-the-value-from-url-parameter
    #
    get = () ->
        queryString = {}

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