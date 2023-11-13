extends CharacterBody2D


const SPEED = 450.0
const JUMP_VELOCITY = -800.0

@onready var sprite = $sprite
@onready var feet_loc = $feet_loc
@onready var score_label = $"../ui/score"
@onready var jump_sound = $jump_sound
@onready var ray = $RayCast2D
@onready var tree_particle = $tree_particle
@onready var launcher_particle = $launcher_particle

var collider
var gravity = 1240

func _ready():
	sprite.self_modulate = Color(
		randf_range(0,1),
		randf_range(0,1),
		randf_range(0,1),
		1
	)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_floor():
		velocity.y = JUMP_VELOCITY
		global.score += 1
		launcher_particle.emitting = false
		tree_particle.emitting = false
		
		jump_sound.pitch_scale = randf_range(0.9,1.2)
		jump_sound.play()
		
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
