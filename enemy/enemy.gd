extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@export var speed = 200

func _physics_process(delta):
	var direction = position.direction_to(player.position)
	velocity = direction * speed
	move_and_collide(velocity * delta)
