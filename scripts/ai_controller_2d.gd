extends AIController2D
class_name PassengerAI

var move: Vector2 = Vector2.ZERO
var penalty: float = 0

@export var balance_deg: float = 0.174533 # rad = 10 degree
@export var center_turnback_zone_size: float = 30 # pixel; avoid the passengers from standing just at the very center

@onready var passenger: RigidBody2D = get_parent()
@onready var seat: RigidBody2D = get_parent().get_parent().get_node("Seesaw/Seat")
@onready var pin: PinJoint2D = get_parent().get_parent().get_node("Seesaw/PinJoint2D")

var offset: Vector2

func get_obs() -> Dictionary:
	offset = passenger.position - pin.position 
	var obs: Array[float] = [
		passenger.mass,
		offset.x,
		offset.y,
		seat.rotation,
		seat.angular_velocity*100
	]
	
	for child: Node2D in get_parent().get_parent().get_children():
		if child.is_in_group("Passengers"):
			if child != owner:
				var _offset = child.position - pin.position
				obs.append(child.mass)
				obs.append(_offset.x)
				obs.append(_offset.y)
	
	return {"obs": obs}

func get_reward() -> float:	
	return reward

func get_action_space() -> Dictionary:
	return {
		"move" : {
			"size": 1,
			"action_type": "continuous"
		},
	}

func set_action(action) -> void:	
	move.x = action["move"][0]

func _on_timer_timeout() -> void:
	if abs(seat.rotation) < balance_deg: # balanced
		reward += 1
	else:
		reward -= 2
		
	if abs(offset.x) < center_turnback_zone_size:
		if penalty <= 3:
			penalty += 0.3
		reward -= penalty
	else:
		penalty = 0

func reset_sequence() -> void:
	reward -= 10
	penalty = 0
	#reset()
	
