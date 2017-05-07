///conv_energy( field, pattern size, weights, x, y )

var _field        = argument0;
var _pattern_size = argument1;
var _weights_grid = argument2;
var _x_start      = argument3;
var _y_start      = argument4;

var _value = 1;

for( var _y = _y_start - _pattern_size + 1; _y < _y_start + _pattern_size; _y++ ) {
    for( var _x = _x_start - _pattern_size + 1; _x < _x_start + _pattern_size; _x++ ) {
        
        var _grid = conv_pattern_create( _field, _x, _y, _pattern_size );
        _value *= _weights_grid[# conv_pattern_index( _grid ), 0 ];
        ds_grid_destroy( _grid );
        
    }
}

return _value;
