class_name Fog
extends Sprite2D

signal cleared

func _ready() -> void:
	flip_h = randi_range(0,1)
	self_modulate.a += randf_range(-0.05,0.20)

func dissipate() -> void:
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 1.75)
	await tween.finished
	cleared.emit() 
