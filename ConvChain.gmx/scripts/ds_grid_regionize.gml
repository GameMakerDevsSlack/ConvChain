///ds_grid_regionize( grid )

var _grid = argument0;

var _width  = ds_grid_width(  _grid );
var _height = ds_grid_height( _grid );

var _visited_grid = ds_grid_create( _width, _height );
var _region_grid  = ds_grid_create( _width, _height );
var _queue_x      = ds_queue_create();
var _queue_y      = ds_queue_create();



var _region_id = 0;

for( var _y = 0; _y < _height; _y++ ) {
    for( var _x = 0; _x < _width; _x++ ) {
        
        if ( _visited_grid[# _x, _y ] ) continue;
        if ( !_grid[# _x, _y ] ) continue;
        
        _region_id++;
        ds_queue_clear( _queue_x );
        ds_queue_clear( _queue_y );
        
        _visited_grid[# _x, _y ] = true;
         _region_grid[# _x, _y ] = _region_id;
        ds_queue_enqueue( _queue_x, _x );
        ds_queue_enqueue( _queue_y, _y );
        
        while( !ds_queue_empty( _queue_x ) ) {
            
            var _old_x = ds_queue_dequeue( _queue_x );
            var _old_y = ds_queue_dequeue( _queue_y );
            
            var _new_x = _old_x - 1;
            var _new_y = _old_y;
            if ( _new_x >= 0 ) and ( !_visited_grid[# _new_x, _new_y ] ) and ( _grid[# _new_x, _new_y ] ) {
                ds_queue_enqueue( _queue_x, _new_x );
                ds_queue_enqueue( _queue_y, _new_y );
                _visited_grid[# _new_x, _new_y ] = true;
                 _region_grid[# _new_x, _new_y ] = _region_id;
            }
            
            var _new_x = _old_x + 1;
            var _new_y = _old_y;
            if ( _new_x < _width ) and ( !_visited_grid[# _new_x, _new_y ] ) and ( _grid[# _new_x, _new_y ] ) {
                ds_queue_enqueue( _queue_x, _new_x );
                ds_queue_enqueue( _queue_y, _new_y );
                _visited_grid[# _new_x, _new_y ] = true;
                 _region_grid[# _new_x, _new_y ] = _region_id;
            }
            
            var _new_x = _old_x;
            var _new_y = _old_y - 1;
            if ( _new_y >= 0 ) and ( !_visited_grid[# _new_x, _new_y ] ) and ( _grid[# _new_x, _new_y ] ) {
                ds_queue_enqueue( _queue_x, _new_x );
                ds_queue_enqueue( _queue_y, _new_y );
                _visited_grid[# _new_x, _new_y ] = true;
                 _region_grid[# _new_x, _new_y ] = _region_id;
            }
            
            var _new_x = _old_x;
            var _new_y = _old_y + 1;
            if ( _new_y < _height ) and ( !_visited_grid[# _new_x, _new_y ] ) and ( _grid[# _new_x, _new_y ] ) {
                ds_queue_enqueue( _queue_x, _new_x );
                ds_queue_enqueue( _queue_y, _new_y );
                _visited_grid[# _new_x, _new_y ] = true;
                 _region_grid[# _new_x, _new_y ] = _region_id;
            }
            
        }
        
    }
}

ds_queue_destroy( _queue_x );
ds_queue_destroy( _queue_y );
ds_grid_destroy( _visited_grid );

global.ds_grid_regionize_regions = _region_id;
return _region_grid;
