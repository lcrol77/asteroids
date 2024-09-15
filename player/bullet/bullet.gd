extends Area2D
class_name Bullet

@export var speed = 1200

var angle: Vector2
var target: Vector2
var variance: Vector2

func _ready() -> void:
	angle = global_position.direction_to(target)
	print(angle)
	angle += Vector2(randf_range(-0.15,0.15),0)
	print(angle)

	
func _on_body_entered(body):
	print("hit", body.name)
	
func _physics_process(delta: float) -> void:
	position += angle * speed * delta 

func _on_queue_free_timer_timeout() -> void:
	queue_free()
