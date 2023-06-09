class_name Car
extends VehicleBody3D
# From truck town demo

const STEER_SPEED = 1.0
const STEER_LIMIT = 0.3

@export var engine_force_value = 128

var steer_target = 0

func _physics_process(delta):
	var fwd_mps = linear_velocity * transform.basis.x
	steer_target = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	steer_target *= STEER_LIMIT
	if Input.is_action_pressed("ui_up"):
		# Increase engine force at low speeds to make the initial acceleration faster.
		var speed = linear_velocity.length()
		if speed < 5 and speed != 0:
			engine_force = clamp(engine_force_value * 5 / speed, 0, 100)
		else:
			engine_force = engine_force_value
	else:
		engine_force = 0
	if Input.is_action_pressed("ui_down"):
		# Increase engine force at low speeds to make the initial acceleration faster.
		if fwd_mps.length() >= -1:
			var speed = linear_velocity.length()
			if speed < 5 and speed != 0:
				engine_force = -clamp(engine_force_value * 5 / speed, 0, 100)
			else:
				engine_force = -engine_force_value
		else:
			brake = 1
	else:
		brake = 0.0
	steering = move_toward(steering, steer_target, STEER_SPEED * delta)

func get_mph() -> float:
	var rpm: float = $Wheel.get_rpm()
	var circum: float = $Wheel.wheel_radius * 2 * PI
	return (circum * rpm * 60) / 1609.34
