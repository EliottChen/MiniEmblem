extends Node2D
class_name Cursor;

var movable : MovableOnGrid = MovableOnGrid.new()
var bounds : Vector2i
var grid_manager_ref : GridManager

var grid_pos : Vector2i:
	get:
		return movable.pos if movable != null else Vector2i(0,0)

func _init() -> void:
	movable.onUpdatePos.connect(_on_movable_moved)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	movable.grid = grid_manager_ref
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
	var lTile := grid_manager_ref.get_tile(grid_pos)
	print(GridSettings.TileType.find_key(lTile.type))
	pass
