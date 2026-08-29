## Class to store datas in the game such as the cell size
class_name GridSettings

static var cell_size : Vector2 :
	get:
		return Vector2(128, 128)


enum TileType{
	ground,
	empty

}

## Functions used to determine the tile type of each tiles converting string data to an enum
func get_type(typeName : String) -> TileType:
	match typeName:
		"ground", "Ground":
			return TileType.ground
		"empty", "Empty":
			return TileType.empty
	return TileType.ground
