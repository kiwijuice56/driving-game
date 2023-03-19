class_name CarCamera
extends Camera3D

@export var look_offset: Vector3 = Vector3(0, 1.5, 0)
@export var follow_speed: float = 5.0

func _physics_process(delta: float) -> void:
	global_position = lerp(global_position, %CameraPivot.global_position, delta * follow_speed)
	look_at(get_parent().get_parent().global_position + look_offset)
