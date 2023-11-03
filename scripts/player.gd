extends CharacterBody2D


const SPEED = 450.0
const JUMP_VELOCITY = -800.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
@onready var feet_loc = $feet_loc

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
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

#	if ray.is_colliding():
#		collider = ray.get_collider()
#
#		collider.get_child(1).disabled = true
#		$"../ui/test".text = "Colliding"
#	elif !ray.is_colliding():
#		if collider and is_on_floor() == true:
#			if collider.get_child(1).position.y < feet_loc.global_position.y:
#				collider.get_child(1).disabled = false
#				$"../ui/test".text = "Not Colliding"
	
	ray.add_exception(self)
	
	if ray.is_colliding():
		collider = ray.get_collider()
		collider.get_child(1).disabled = true
		$"../ui/test".text = "Colliding"
	elif ray.is_colliding() == false and collider:
		collider.get_child(1).disabled = false
		$"../ui/test".text = "Not Colliding"
