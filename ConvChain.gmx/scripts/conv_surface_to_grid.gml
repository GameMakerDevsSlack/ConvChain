///conv_surface_to_grid( sprite )

var _surface = argument0;

var _surface_width  = surface_get_width( _surface );
var _surface_height = surface_get_height( _surface );

var _grid = ds_grid_create( _surface_width, _surface_height );

for( var _y = 0; _y < _surface_height; _y++ ) {
    for( var _x = 0; _x < _surface_width; _x++ ) {
        var _pixel = surface_getpixel( _surface, _x, _y );
        _grid[# _x, _y ] = ( _pixel > 0 );
    }
}

return _grid;
