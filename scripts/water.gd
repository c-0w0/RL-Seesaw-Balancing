extends Area2D

@onready var game: Game = get_parent().get_parent()

func _on_body_entered(body: Node2D) -> void:
	if body.name == 'Seat' || body.is_in_group('Passengers'):
		game.reset()
