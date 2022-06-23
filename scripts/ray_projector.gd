tool
extends Node2D

export var stroke_color: Color
export var stroke_width: float
export var ray_active: bool = true
export var ray_length = 2000.0
export var origin_size = 1.0
export var max_steps = 50
# Minimum intersection distance
export var epsilon =  1.0

var ray_origin: Vector2
var ray_dir: Vector2
var scene: Node2D

func _ready():
	ray_origin = global_position
	scene = get_parent().get_node("RMScene")
	ray_dir = Vector2.RIGHT.rotated(rotation_degrees)

func _physics_process(_delta): update()

func set_ray_active(value: bool): ray_active = value

func _draw():
	if ray_active:
		update_ray_info()
		draw_line(Vector2.ZERO, ray_dir * ray_length, stroke_color, stroke_width)
		trace()

func update_ray_info():
	ray_origin = global_position
	ray_dir = Vector2.RIGHT.rotated(rotation_degrees)

func trace():
	var march_steps = 0
	while (march_steps < max_steps):
		var dst = RayMarcher.signedDstToScene(ray_origin, scene)
		if (dst <= epsilon): break
		var relative_ray_origin = ray_origin - global_position
		draw_bordered_circle(relative_ray_origin, dst,
				stroke_color, Color.transparent, stroke_width)
		draw_circle(relative_ray_origin, origin_size, Color.white)

		ray_origin += (ray_dir * dst)
		march_steps += 1

	ray_origin = global_position

func calculate_circle(origin: Vector2, radius: float, res: int = 50):
	var circle = PoolVector2Array()
	var pv = Vector2(radius, 0.0)
	for i in range(res + 1): circle.append(
		origin + pv.rotated(deg2rad((i / float(res)) * 360.0)))
	return circle

func draw_bordered_circle(
		centre: Vector2,
		radius: float,
		stroke: Color,
		fill: Color,
		thickness: float):
	draw_polyline(calculate_circle(centre, radius, 50), stroke, thickness, true)
	draw_circle(centre, radius, fill)
