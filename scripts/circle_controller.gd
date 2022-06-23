extends KinematicBody2D

onready var tracer = $TracingCircle
onready var scene = get_parent().get_node("RMScene")
const speed = 140.0

func  _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "fwd", "bkd")
	var velocity  = direction * speed
	velocity = move_and_slide(velocity, Vector2.UP)
	
	var dts = RayMarcher.signedDstToScene(position, scene)
	tracer.radius = dts
