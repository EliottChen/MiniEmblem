extends Node2D
class_name Cursor;

var movable : MovableOnGrid = MovableOnGrid.new()

var gridPosition: Vector2i:
	get:
		return movable.gridPosition

func _init() -> void:
	movable.onUpdatePos.connect(OnRendererUpdate)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_released("down")):
		movable.move(gridPosition + Vector2i(0, 1))
	if(Input.is_action_just_released("up")):
		movable.move(gridPosition + Vector2i(0, -1))
	if(Input.is_action_just_released("left")):
		movable.move(gridPosition + Vector2i(-1, 0))
	if(Input.is_action_just_released("right")):
		movable.move(gridPosition + Vector2i(1, 0))
	pass

func OnRendererUpdate(pos : Vector2i) -> void:
	global_position = Vector2(pos) * movable.cellSize
	pass
