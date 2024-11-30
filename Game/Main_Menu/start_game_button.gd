extends Button


const MAIN_SCENE = preload("res://Game/Main_scene/Main_Scene.tscn")

@onready var main_menu: CanvasLayer = $".."


func _on_button_up() -> void:
	GameMusic.fade_out(3.0)
	main_menu.add_sibling(MAIN_SCENE.instantiate())
	main_menu.queue_free()
