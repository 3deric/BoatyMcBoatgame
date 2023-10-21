extends RigidBody3D

var accInput = 0 #input value for fwd and bwd acceleration
var steerInput = 0 #input value for left and right


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	InputConctroller()
	print("acc: " + str(accInput))
	print("steer: " + str(steerInput))
	
func InputConctroller():
	accInput = int(Input.is_action_pressed("MovementFwd")) - int(Input.is_action_pressed("MovementBwd"))
	steerInput = int(Input.is_action_pressed("MovementLeft")) - int(Input.is_action_pressed("MovementRight"))
