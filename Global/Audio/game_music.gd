extends AudioStreamPlayer

var base_volume : float = -11.0


func _ready() -> void:
	fade_in(1.0)


func fade_out(duration : float = 2.0) -> void:
	var tween = create_tween()
	tween.tween_property(self, "volume_db", -80, duration)
	await tween.finished
	playing = false


func fade_in(duration : float = 2.0) -> void:
	volume_db = -80
	playing = true
	var tween = create_tween()
	tween.tween_property(self, "volume_db", base_volume, duration)
