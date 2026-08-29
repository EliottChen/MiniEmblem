extends MovableOnGrid
class_name Entity


static var instances : Array[Entity] = []

func _init() -> void:
	instances.append(self)

func _exit_tree() -> void:
	instances.erase(self)

func _check_coordinate(pos : Vector2i) -> bool:
	print("TODO : Implement checking conditions")
	return false
