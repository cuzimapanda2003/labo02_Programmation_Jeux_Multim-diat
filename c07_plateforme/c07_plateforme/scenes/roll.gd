class_name PlayerAttack
extends BaseState

@onready var player: Player = owner
@onready var sprite: AnimatedSprite2D = owner.get_node("AnimatedSprite2D")

func enter() -> void:
	sprite.play("attack")

func physics_update(_delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	player.velocity.x = direction * player.SPEED

	# Quand l'animation est finie, on revient à Idle
	if not sprite.is_playing():
		Transitioned.emit(self, "idle")

func handle_inputs(_input_event: InputEvent) -> void:
	pass

func update(_delta: float) -> void:
	pass

func exit() -> void:
	pass
