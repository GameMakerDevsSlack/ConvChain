///conv_pattern_copy_rotate( pattern grid )

var _input_grid = argument0;

var _size = ds_grid_width( _input_grid );

var _output_grid = ds_grid_create( _size, _size );
for( var _y = 0; _y < _size; _y++ ) {
    for( var _x = 0; _x < _size; _x++ ) {
        _output_grid[# _x, _y ] = _input_grid[# _size - 1 - _y, _x ];
    }
}

return _output_grid;
