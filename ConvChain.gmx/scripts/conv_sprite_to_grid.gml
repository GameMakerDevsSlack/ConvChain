///conv_sprite_to_grid( sprite )

var _sample_sprite = argument0;

var _sample_width  = sprite_get_width( _sample_sprite );
var _sample_height = sprite_get_height( _sample_sprite );

var _surface = surface_create( _sample_width, _sample_height );
var _grid = ds_grid_create( _sample_width, _sample_height );

surface_set_target( _surface );
draw_clear( c_black );
draw_sprite( spr_sample, 0, sprite_get_xoffset( _sample_sprite ),  sprite_get_yoffset( _sample_sprite ) );
surface_reset_target();

for( var _y = 0; _y < _sample_height; _y++ ) {
    for( var _x = 0; _x < _sample_width; _x++ ) {
        var _pixel = surface_getpixel( _surface, _x, _y );
        _grid[# _x, _y ] = ( _pixel > 0 );
    }
}

surface_free( _surface );

return _grid;
