## Provides tools to make cell sized movements 
class_name MovableOnGrid

var _grid_position : Vector2i = Vector2i(1, 0)

var pos : Vector2i : 
	get:
		return _grid_position

signal onUpdatePos

func _check_coordinate(pos : Vector2i) -> bool:
	return true

func move(pos : Vector2i) -> void:
	if(_check_coordinate(pos)):
		_grid_position = pos
		update_renderer_pos()

## Invoke onUpdatePos with the supposed global position passed as parameters
func update_renderer_pos() -> void:
	onUpdatePos.emit(Vector2(_grid_position) * GridSettings.cell_size)
	pass
