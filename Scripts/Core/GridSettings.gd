## Class to store datas in the game such as the cell size
class_name GridSettings

static var cell_size : Vector2 :
	get:
		return Vector2(128, 128)


enum TileType{
	none,
	ground,
	empty

}

## Functions used to determine the tile type of each tiles converting string data to an enum
static func get_terrain_type(tile : TileData) -> TileType:
	if not tile:
		push_error("GridSettings: Tile data passed as parameter is null!")
		return TileType.none
	
	var rawValue : Variant = tile.get_custom_data("TerrainType")
	
	var typeName : String = str(tile.get_custom_data("TerrainType")).to_lower()
	
	match typeName:
		"ground":
			print("returned ground")
			return TileType.ground
		"empty":
			print("returned empty")
			return TileType.empty
	push_error("GridSettings: data exist but wasn't recognized")
	return TileType.none
