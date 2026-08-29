extends Node2D

@export var manager : GridManager
@export var tilemapCollision : TileMapLayer
@export var cursor_start_position : Vector2i

func _ready() -> void:
	manager.OnStartGame.connect(start_game)
	pass
	
func _exit_tree() -> void:
	manager.OnStartGame.disconnect(start_game)

func start_game() -> void:
	if(tilemapCollision == null):
		print("")
		push_error("tile map collision field is empty!")
		return
	
	# Get map max size, apply it to grid manager
	var bounds = tilemapCollision.get_used_rect().size
	manager.map_bounds = bounds
	
	# Clear gridmanager, populate a new one
	manager.tiles.clear()
	for tileCoords in tilemapCollision.get_used_cells():
		var lCoordinate : Vector2i = Vector2i(tileCoords.x, tileCoords.y)
		var lTile : Tile = Tile.new()
		
		lTile.type = GridSettings.get_terrain_type(tilemapCollision.get_cell_tile_data(lCoordinate))
		
		manager.tiles.get_or_add(lCoordinate, lTile)
	
	# Apply bounds to a newly created player cursor
	var cursor = preload("res://Scenes/visual_cursor.tscn")
	var cursor_instance := cursor.instantiate() as Cursor
	
	# Assign value before adding child in order to avoid null ref
	cursor_instance.grid_manager_ref = manager
	get_tree().current_scene.add_child(cursor_instance)
	
