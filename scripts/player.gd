extends CharacterBody2D


const SPEED = 450.0
const JUMP_VELOCITY = -800.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
@onready var feet_loc = $feet_loc
@onready var score_label = $"../ui/score"
var score = 0

#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 1240
@onready var ray = $RayCast2D
var collider
#collider.get_child(2).disabled

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
		score += 1
		score_label.text = "Score: {}".format([score], "{}")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
