extends CharacterBody2D

@onready var crosshair: Sprite2D = %Crosshair

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var vec = crosshair.position- position
	rotation = vec.angle()
