extends RigidBody3D

var input = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	InputConctroller()
	print("acc: " + str(input.y))
	print("steer: " + str(input.x))
	
func _physics_process(delta):
	ApplyRotation(delta)
	ApplyEngineForce(delta)
	
func InputConctroller():
	input.x =  int(Input.is_action_pressed("MovementLeft")) - int(Input.is_action_pressed("MovementRight"))
	input.y = int(Input.is_action_pressed("MovementFwd")) - int(Input.is_action_pressed("MovementBwd"))

func ApplyRotation(delta):
	apply_torque(Vector3(0,1,0) * input.x)
	
func ApplyEngineForce(delta):
	apply_force(Vector3(0,0,1) * input.y)
