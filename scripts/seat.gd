extends RigidBody2D
class_name Seat

@export var balance_deg: float = 0.174533 # rad = 10 degree

@onready var seesaw: Node2D = get_parent()
@onready var game: Node2D = seesaw.get_parent()

@onready var progress_timer: Timer = seesaw.get_node("ProgressTimer")
@onready var progress_bar: ProgressBar = seesaw.get_node("ProgressBar")
@onready var anim: AnimatedSprite2D = get_node("AnimatedSprite2D")

@onready var score: Label = seesaw.get_node("Score")
@onready var current_score: int = 0

func _physics_process(_delta):
	anim.animation = "white" if (abs(rotation) < balance_deg) else "red"
	progress_bar.value = (progress_timer.wait_time - progress_timer.time_left) / progress_timer.wait_time * 100
	# apply random torque after stabalized ???

func reset_rotation() -> void:
	progress_timer.start() # reset the timer
	var pos: Vector2 = seesaw.get_node("PinJoint2D").global_position
	pos.y -= 65 # avoid jiggling
	PhysicsServer2D.body_set_state(
		get_rid(),
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D(0, pos)
	)
	PhysicsServer2D.body_set_state(
		self.get_rid(),
		PhysicsServer2D.BODY_STATE_ANGULAR_VELOCITY,
		0.0
	)

func _on_progress_timer_timeout() -> void:
	# Critical RL training reset: 
	# 1. Ends current episode 
	# 2. Randomizes passenger masses/positions
	# 3. Preserves training metrics
	current_score += 1
	score.text = "Score: " + str(current_score)
	game.reset() 
	for child: Node2D in game.get_children():
		if child.is_in_group("Passengers"):
			var ai: PassengerAI = child.get_node("AIController2D")
			ai.reward += 10
