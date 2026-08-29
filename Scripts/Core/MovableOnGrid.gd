
class_name MovableOnGrid

var gridPosition : Vector2i = Vector2i(0, 0)
var cellSize: Vector2 = Vector2(128, 128)

signal onUpdatePos


func _check_coordinate(pos : Vector2i) -> bool:
	return true

func move(pos : Vector2i) -> void:
	if(_check_coordinate(pos)):
		gridPosition = pos
		update_renderer_pos()

func update_renderer_pos() -> void:
	onUpdatePos.emit(gridPosition)
	pass
