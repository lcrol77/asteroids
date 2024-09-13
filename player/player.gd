extends CharacterBody2D

@export var speed = 600
@onready var crosshair: Sprite2D = %Crosshair
@onready var bullet_spawn = $BulletSpawn
@onready var bullet_timer: Timer = $BulletTimer

var can_shoot = true

const bullet: PackedScene = preload("res://player/bullet/bullet.tscn")

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

func _process(_delta: float) -> void:
	look_at(crosshair.position)
	
	# TODO: need to implement some kind of fire rate
	if Input.is_mouse_button_pressed( 1 ):
		if can_shoot:
			var instance: Bullet = bullet.instantiate()
			instance.global_position = bullet_spawn.global_position
			instance.rotation = rotation
			instance.target = crosshair.global_position
			add_child(instance)
			bullet_timer.start()
			can_shoot = false


func _on_bullet_timer_timeout() -> void:
	can_shoot = true
