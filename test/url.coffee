# Fake a global window object with a url
#
GLOBAL.document =
    location:
        search: "?test=yes&arr=1&arr=2"

chai        = require "chai"
QueryString = require "../lib/index.js"
objectUtils = require "madlib-object-utils"


describe( "queryString", () ->
    describe( "#get()", () ->
        queryString = QueryString()

        console.log( queryString )

        it( "Attribute should be set", () ->
            chai.expect( objectUtils.getValue( "test", queryString ) ).to.eql( "yes" )
        )

        it( "Array should have 2 items", () ->
            chai.expect( objectUtils.getValue( "arr", queryString ).length ).to.eql( 2 )
        )
    )
)