///conv_randomise( conv map )

var _conv_map  = argument0;

var _field_grid  = _conv_map[? "field"       ];
var _output_size = _conv_map[? "output size" ];

for( var _y = 0; _y < _output_size; _y++ ) {
    for( var _x = 0; _x < _output_size; _x++ ) {
        _field_grid[# _x, _y ] = irandom( 1 );
    }
}
