extends Node
class_name SettingsManager


const DEFAULT_SETTINGS = {
	"volume": [1.0, 1.0, 1.0],
	"has_player_played_before": false,
}

var config_file: ConfigFile = ConfigFile.new()

var was_last_score_high_score = false


func _ready() -> void:
	if !FileAccess.file_exists("user://settings.cfg"):
		default_settings()
	config_file.load("user://settings.cfg")
	for bus in range(0, 2):
		AudioServer.set_bus_volume_db(bus, linear_to_db(get_volume(bus)))
		AudioServer.set_bus_mute(bus, get_volume(bus) == 0.0)


func default_settings():
	var file = ConfigFile.new()
	
	for setting_key in DEFAULT_SETTINGS.keys():
		file.set_value("main", setting_key, DEFAULT_SETTINGS[setting_key])
	
	file.save("user://settings.cfg")


func save_settings():
	config_file.save("user://settings.cfg")


func set_volume(bus: int, value: float):
	AudioServer.set_bus_volume_db(bus, linear_to_db(value))
	AudioServer.set_bus_mute(bus, value == 0.0)
	var array = config_file.get_value("main", "volume")
	array[bus] = value
	config_file.set_value("main", "volume", array)


func get_volume(bus: int) -> float:
	return config_file.get_value("main", "volume")[bus]


func set_player_played():
	config_file.set_value("main", "has_player_played_before", true)
