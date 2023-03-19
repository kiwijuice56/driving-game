class_name Odometer 
extends TextureRect

@export var main: Main

func _process(delta: float) -> void:
	if is_instance_valid(main.car):
		var angle = (0.3611 * PI) + (1.2776 * PI * (abs(main.car.get_mph() / 120)))
		%Needle.rotation = lerpf(%Needle.rotation, angle, delta * 8)
