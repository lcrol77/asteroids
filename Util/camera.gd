extends Camera2D

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
@onready var crosshair: Sprite2D = %Crosshair

const smooth_lean := 10.0
const scale_lean  := 0.2

func lean_camera_towards_mouse_(delta:float) -> void:
	var mouse_position := crosshair.global_position
	
	var direction_to_mouse := (mouse_position - position).normalized()
	var distance_to_mouse :=  mouse_position.distance_to(position)
	var lean := (mouse_position - position) * scale_lean
	offset = lerp(offset, lean, delta * smooth_lean)

func match_player_position_() -> void:
	position = player.position

func _physics_process(delta) -> void:
	lean_camera_towards_mouse_(delta)
	match_player_position_()
