///conv_surface( conv map )

var _conv_map = argument0;

var _field_grid = _conv_map[? "field" ];
var _width  = ds_grid_width(  _field_grid );
var _height = ds_grid_height( _field_grid );

var _surface = surface_create( _width, _height );

surface_set_target( _surface );
draw_clear( background_colour );

draw_set_colour( c_white );
for( var _y = 0; _y < _height; _y++ ) {
    for( var _x = 0; _x < _width; _x++ ) {
        if ( _field_grid[# _x, _y ] ) draw_point( _x, _y );
    }
}

draw_set_colour( c_black );
surface_reset_target();

return _surface;
