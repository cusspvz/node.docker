/* jshint asi:true */

require( 'http' )
.createServer(function ( req, res ) {
    res.write( 'hello world' )
    res.end()
})
.listen( 3000, function () {
    console.log( 'server listening at container port 3000')
})
