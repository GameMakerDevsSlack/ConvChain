///ds_grid_regions_to_surface( grid, max value )

var _grid      = argument0;
var _max_value = argument1;

var _width  = ds_grid_width(  _grid );
var _height = ds_grid_height( _grid );

var _surface = surface_create( _width, _height );

surface_set_target( _surface );
draw_clear( background_colour );

for( var _y = 0; _y < _height; _y++ ) {
    for( var _x = 0; _x < _width; _x++ ) {
        
        var _value = _grid[# _x, _y ] - 1;
        if ( _value >= 0 ) {
            
            var _hue = 255*_value/_max_value;
            var _saturation = 120 + 135*( _value mod 2 );
            
            draw_set_colour( make_colour_hsv( _hue, _saturation, 255 ) );
            draw_point( _x, _y );
        }
        
    }
}

draw_set_colour( c_black );
surface_reset_target();

return _surface;
