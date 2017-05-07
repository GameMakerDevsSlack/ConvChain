///conv_create( pattern size, variance, output size, all directions )

var _sample_grid    = argument0;
var _pattern_size   = argument1;
var _variance       = argument2;
var _output_size    = argument3;
var _all_directions = argument4;

var _sample_width  = ds_grid_width(  _sample_grid );
var _sample_height = ds_grid_height( _sample_grid );

var _weight_count = 1 << ( _pattern_size*_pattern_size );
var _conv_map = ds_map_create();

_conv_map[? "sample grid"   ] = _sample_grid;
_conv_map[? "sample width"  ] = _sample_width;
_conv_map[? "sample height" ] = _sample_height;
_conv_map[? "field"         ] = ds_grid_create( _output_size, _output_size );
_conv_map[? "output size"   ] = _output_size;
_conv_map[? "weight count"  ] = _weight_count;
_conv_map[? "weights"       ] = ds_grid_create( _weight_count, 1 );
_conv_map[? "pattern size"  ] = _pattern_size;
_conv_map[? "inv variance"  ] = 1/_variance;

var _field_grid   = _conv_map[? "field"   ];
var _weights_grid = _conv_map[? "weights" ];

if ( _all_directions ) {
    for( var _y = 0; _y < _sample_height; _y++ ) {
        for( var _x = 0; _x < _sample_width; _x++ ) {
            
            var _pattern_array;
            _pattern_array[0] = conv_pattern_create( _sample_grid, _x, _y, _pattern_size );
            _pattern_array[1] = conv_pattern_copy_rotate(  _pattern_array[0] );
            _pattern_array[2] = conv_pattern_copy_rotate(  _pattern_array[1] );
            _pattern_array[3] = conv_pattern_copy_rotate(  _pattern_array[2] );
            _pattern_array[4] = conv_pattern_copy_reflect( _pattern_array[0] );
            _pattern_array[5] = conv_pattern_copy_reflect( _pattern_array[1] );
            _pattern_array[6] = conv_pattern_copy_reflect( _pattern_array[2] );
            _pattern_array[7] = conv_pattern_copy_reflect( _pattern_array[3] );
                    
            for( var _i = 0; _i < 8; _i++ ) {
                _weights_grid[# conv_pattern_index( _pattern_array[_i] ), 0 ]++;
                ds_grid_destroy( _pattern_array[_i] );
            }
            
        }
    }
} else {
    
    for( var _y = 0; _y < _sample_height; _y++ ) {
        for( var _x = 0; _x < _sample_width; _x++ ) {
            var _pattern = conv_pattern_create( _sample_grid, _x, _y, _pattern_size );
            _weights_grid[# conv_pattern_index( _pattern ), 0 ]++;
            ds_grid_destroy( _pattern );
        }
    }
    
}

for( var _i = 0; _i < _weight_count; _i++ ) {
    if ( _weights_grid[# _i, 0 ] <= 0 ) _weights_grid[# _i, 0 ] = 0.1;
}

return _conv_map;
