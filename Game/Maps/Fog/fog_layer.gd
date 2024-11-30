class_name FogLayer
extends SceneTileMapLayer

#var fogged : int = 0


func clear_fog(coords : Vector2i) -> void:
	var fog = get_cell_scene(coords)
	if fog is Fog:
		_unregister_child(fog)
		fog.dissipate()
		await fog.cleared
		erase_cell(coords)
		#fogged += 1
		#print(fogged , " fog removed")
