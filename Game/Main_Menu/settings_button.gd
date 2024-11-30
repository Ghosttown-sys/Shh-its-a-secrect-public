extends Button


const SETTINGS_MENU = preload("res://Game/Main_Menu/Settings_Menu/settings_menu.tscn")

@onready var main_menu: CanvasLayer = $".."


func _on_button_up() -> void:
	main_menu.add_child(SETTINGS_MENU.instantiate())
