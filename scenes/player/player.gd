extends CharacterBody2D

@export var speed = 400
@onready var crosshair: Sprite2D = %Crosshair
@onready var bullet_spawn = $BulletSpawn
@onready var bullets = $Bullets

const bullet: PackedScene = preload("res://scenes/bullet/bullet.tscn")

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

func _process(delta: float) -> void:
	var vec = crosshair.position- position
	rotation = vec.angle()
	
	# TODO: need to implement some kind of fire rate
	if Input.is_mouse_button_pressed( 1 ):
		var instance = bullet.instantiate()
		instance.global_position = bullet_spawn.global_position
		bullets.add_child(instance)
