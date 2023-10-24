extends RigidBody3D

var input = Vector2.ZERO
@export var maxSpeed = 10.0
@export var accFac = 50.0
@export var turnFac = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	InputConctroller()
	
func _physics_process(delta):
	ApplySteering()
	KillOrthogonalVelocity()
	ApplyEngineForce(delta)
	
func InputConctroller():
	input.x =  int(Input.is_action_pressed("MovementLeft")) - int(Input.is_action_pressed("MovementRight"))
	input.y = int(Input.is_action_pressed("MovementFwd")) - int(Input.is_action_pressed("MovementBwd"))

func ApplySteering():
	var minSpeedTurn = linear_velocity.length() / 100
	minSpeedTurn = clamp(minSpeedTurn, 0.0, 1.0)	
	if input.y < 0.0:
		input.x *= -1 
	var rotAngle = input.x * turnFac * minSpeedTurn 
	rotate_y(rotAngle)
	
func KillOrthogonalVelocity():
	#var fwdVel = -transform.y * linear_velocity.dot(-transform.y)
	#var rightVel = transform.x * linear_velocity.dot(transform.x)	
	#linear_velocity = fwdVel + rightVel * driftFac
	return
	
func ApplyEngineForce(delta):
	var velVsUp = transform.basis.z.dot(linear_velocity)
	var overspeed = false
	
	if velVsUp > maxSpeed && input.y > 0:
		overspeed = true
		
	if velVsUp < -maxSpeed * 0.5 && input.y > 0:
		overspeed = true
	
	if (!overspeed):
		var engineForce = transform.basis.z  * input.y * accFac
		#applied_force = engineForce
		apply_force(engineForce)
