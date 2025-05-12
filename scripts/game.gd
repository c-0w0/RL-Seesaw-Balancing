extends Node
class_name Game

@onready var passenger_scene: PackedScene = preload("res://scenes/passenger.tscn")
@export var passenger_count: int = 5

@onready var line: Line2D = get_node("Line2D")
@onready var seat: Seat = get_node("Seesaw/Seat")

func _ready() -> void:
	spawn_passengers_along_line()

func spawn_passengers_along_line() -> void:	
	for i: int in range(passenger_count):
		var passenger: Passenger = passenger_scene.instantiate()
		passenger.reset(line)
		add_child(passenger)

func reset() -> void:
	reset_passengers()
	reset_seesaw_rotation()

func reset_passengers():
	for child: Node2D in get_children():
		if child.is_in_group("Passengers"):
			var passenger: Passenger = child
			passenger.reset(line)

func reset_seesaw_rotation():
	seat.reset_rotation()
