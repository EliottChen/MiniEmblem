extends MovableOnGrid
class_name Cursor;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_released("down")):
		move(gridPosition + Vector2i(0, 1))
	if(Input.is_action_just_released("up")):
		move(gridPosition + Vector2i(0, -1))
	if(Input.is_action_just_released("left")):
		move(gridPosition + Vector2i(-1, 0))
	if(Input.is_action_just_released("right")):
		move(gridPosition + Vector2i(1, 0))
	pass
