///conv_pattern_create( field, x, y, size )

var _field_grid  = argument0;
var _x_start     = argument1;
var _y_start     = argument2;
var _output_size = argument3;

var _output_grid = ds_grid_create( _output_size, _output_size );

var _field_width = ds_grid_width( _field_grid );
var _field_height = ds_grid_height( _field_grid );

for( var _y = 0; _y < _output_size; _y++ ) {
    for( var _x = 0; _x < _output_size; _x++ ) {
        
        var _x_real = ( _x + _x_start + _field_width  ) mod _field_width;
        var _y_real = ( _y + _y_start + _field_height ) mod _field_height;
        
        _output_grid[# _x, _y ] = _field_grid[# _x_real, _y_real ];
        
    }
}

return _output_grid;
