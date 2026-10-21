class_name PlayerRun
extends BaseState

@onready var player: Player = owner
@onready var sprite: AnimatedSprite2D = owner.get_node("AnimatedSprite2D")

func enter() -> void:
	sprite.play("run")

func physics_update(_delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	player.velocity.x = direction * player.SPEED
	if direction != 0:
		sprite.flip_h = direction < 0

	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		Transitioned.emit(self, "jump")
	elif Input.is_action_just_pressed("roll"):
		Transitioned.emit(self, "roll")
	elif direction == 0:
		Transitioned.emit(self, "idle")

func handle_inputs(_input_event: InputEvent) -> void:
	pass

func update(_delta: float) -> void:
	pass

func exit() -> void:
	pass
