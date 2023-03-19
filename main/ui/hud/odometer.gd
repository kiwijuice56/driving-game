class_name Odometer 
extends TextureRect

@export var car: Car

func _process(delta: float) -> void:
	if is_instance_valid(car):
		var angle = (PI / 2) + PI * (abs(car.linear_velocity.length()) / 74)
		%Needle.rotation = lerpf(%Needle.rotation, angle, delta * 8)
