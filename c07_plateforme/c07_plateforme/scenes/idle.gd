class_name PlayerIdle
extends BaseState

@onready var player: Player = owner
@onready var sprite: AnimatedSprite2D = owner.get_node("AnimatedSprite2D")

func enter() -> void:
	sprite.play("idle")

func physics_update(_delta: float) -> void:
	player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)

	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		Transitioned.emit(self, "jump")
	elif Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "attack")
	elif Input.get_axis("left", "right") != 0:
		Transitioned.emit(self, "run")

func handle_inputs(_input_event: InputEvent) -> void:
	pass

func update(_delta: float) -> void:
	pass

func exit() -> void:
	pass
