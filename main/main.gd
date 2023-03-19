class_name Main
extends Node3D

@onready var car: Car = $SportsCar

func  _input(event: InputEvent) -> void:
	if event.is_action_pressed("reset", false):
		car.queue_free()
		car = load("res://main/car/sports/sports_car.tscn").instantiate()
		add_child(car)
