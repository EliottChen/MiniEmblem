extends Node2D
class_name MovableOnGrid

var gridPosition : Vector2i = Vector2i(0, 0)
var cellSize: Vector2 = Vector2(128, 128)

static var instances : Array[MovableOnGrid] = []

func _init() -> void:
	instances.append(self)

func _exit_tree() -> void:
	instances.erase(self)

func check_coordinate(pos : Vector2i) -> bool:
	for i in instances:
		if(i.gridPosition == pos):
			return false
		else:
			continue
	return true

func move(pos : Vector2i) -> void:
	if(check_coordinate(pos)):
		gridPosition = pos
		update_renderer_pos()

func update_renderer_pos() -> void:
	global_position = Vector2(gridPosition) * cellSize
	pass
