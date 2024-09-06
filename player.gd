extends CharacterBody2D

@onready var crosshair: Sprite2D = %Crosshair

@export var speed = 400

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

func _process(delta: float) -> void:
	var vec = crosshair.position- position
	rotation = vec.angle()
