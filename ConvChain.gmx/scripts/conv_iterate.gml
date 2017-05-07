///conv_iterate( conv map, iterations )

var _conv_map   = argument0;
var _iterations = argument1;

var _field_grid   = _conv_map[? "field"        ];
var _output_size  = _conv_map[? "output size"  ];
var _pattern_size = _conv_map[? "pattern size" ];
var _weights_grid = _conv_map[? "weights"      ];
var _inv_variance = _conv_map[? "inv variance" ];

repeat( _iterations ) {
    
    var _x = irandom( _output_size-1 );
    var _y = irandom( _output_size-1 );
    
    var _energy_a = conv_energy( _field_grid, _pattern_size, _weights_grid, _x, _y );
    _field_grid[# _x, _y ] = !_field_grid[# _x, _y ];
    var _energy_b = conv_energy( _field_grid, _pattern_size, _weights_grid, _x, _y );
    
    if ( power( _energy_b/_energy_a, _inv_variance ) < random( 1 ) ) _field_grid[# _x, _y ] = !_field_grid[# _x, _y ];
    
}
