extends Area2D

@export var seesaw_seat_anim: AnimatedSprite2D

@onready var threshold_passed: bool = false

#func _on_body_entered(body: Node2D) -> void:
	##seesaw_seat_anim.animation = "red"
	##threshold_passed = true
	#pass
#
#func _on_threshold_body_exited(body: Node2D) -> void:
	##seesaw_seat_anim.animation = "white"
	##threshold_passed = false
	#pass
