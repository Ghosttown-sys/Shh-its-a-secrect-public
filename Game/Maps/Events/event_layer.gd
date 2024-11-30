class_name EventLayer
extends SceneTileMapLayer

var events : Dictionary = { 
	Vector2i(-1, 0): "Chief", 
	Vector2i(-1, 8): "Thimble", 
	Vector2i(-5, 5): "Thimble", 
	Vector2i(5, 2): "Thimble", 
	Vector2i(9, -6): "Thimble", 
	Vector2i(0, -5): "Thimble", 
	Vector2i(-7, -1): "Thimble"
	}


func assign_resource(cell: Vector2i, resource) -> void:
	var event_tile = scene_coords.get(cell,false)
	if event_tile:
		event_tile.event_resource = resource
	else:
		print("No tile at ", cell)
