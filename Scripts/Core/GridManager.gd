extends Node

## Class responsible to hold an array of tile, knows where are each entities etc
class_name GridManager

var tiles : Dictionary[Vector2i, Tile] = {}
var entities : Array[Entity] = []

func get_tile(pos : Vector2i) -> Tile:
	return tiles.get(pos)

func get_entity(pos : Vector2i) -> Entity:
	return get_tile(pos).entity

func try_move(entity : Entity, pos : Vector2i) -> bool:
	if(get_tile(pos).entity == null):
		entity.move(pos)
		return true
	else:
		return false
