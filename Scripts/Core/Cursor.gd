extends Node2D
class_name Cursor;

var movable : MovableOnGrid = MovableOnGrid.new()


func _init() -> void:
	movable.onUpdatePos.connect(_on_movable_moved)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	movable.update_renderer_pos()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(Input.is_action_just_released("down")):
		movable.move(movable.pos + Vector2i(0, 1))
	if(Input.is_action_just_released("up")):
		movable.move(movable.pos + Vector2i(0, -1))
	if(Input.is_action_just_released("left")):
		movable.move(movable.pos + Vector2i(-1, 0))
	if(Input.is_action_just_released("right")):
		movable.move(movable.pos + Vector2i(1, 0))
	pass

func _on_movable_moved(pos : Vector2i) -> void:
	global_position = Vector2(pos)
	pass
