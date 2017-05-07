///conv_pattern_index( grid )

var _pattern_grid = argument0;
var _pattern_width  = ds_grid_width(  _pattern_grid );
var _pattern_height = ds_grid_height( _pattern_grid );

var _result = 0;

for( var _y = 0; _y < _pattern_width; _y++ ) {
    for( var _x = 0; _x < _pattern_height; _x++ ) {
        if ( _pattern_grid[# _x, _y ] ) {
            _result += 1 << ( _y*_pattern_width + _x );
        }
    }
}

return _result;
