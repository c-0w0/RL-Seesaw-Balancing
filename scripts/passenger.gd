extends RigidBody2D  # Keep as RigidBody for physics interactions
class_name Passenger

@export var ai: PassengerAI
@export var anim: AnimatedSprite2D

@onready var init: bool = false

func _physics_process(_delta):
	linear_velocity.x = ai.move.x * 150

func reset(line: Line2D) -> void:
	rng_mass()
	rng_teleport(line)
	ai.reset_sequence()

func rng_mass() -> void:
	var random_weight: int = randi_range(2, 4)
	anim.play(str(random_weight))
	
	match random_weight:
		1: mass = 0.1
		2: mass = 0.2
		3: mass = 0.3
		4: mass = 0.4
		5: mass = 0.5

func rng_teleport(line: Line2D) -> void:
	if !init:
		init = true
		var rng_x: float = randf_range(line.points[0].x, line.points[1].x)
		var rng_pos: Vector2 = Vector2(rng_x, line.position.y)
		position = rng_pos
	else:
		var rng_global_x: float = randf_range(line.to_global(line.points[0]).x, line.to_global(line.points[1]).x)
		var rng_global_pos: Vector2 = Vector2(rng_global_x, line.global_position.y)

		PhysicsServer2D.body_set_state(
			self.get_rid(),
			PhysicsServer2D.BODY_STATE_TRANSFORM,
			Transform2D(0, rng_global_pos)
		)
		PhysicsServer2D.body_set_state(
			self.get_rid(),
			PhysicsServer2D.BODY_STATE_LINEAR_VELOCITY,
			Vector2.ZERO
		)
		PhysicsServer2D.body_set_state(
			self.get_rid(),
			PhysicsServer2D.BODY_STATE_ANGULAR_VELOCITY,
			0.0
		)
