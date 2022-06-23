tool
extends Node2D
class_name DynamicCircle

export var fill_color: Color = Color.whitesmoke
export var stroke_color: Color = Color.white
export var resolution: int = 20
export var radius: float = 20.0

func _draw():
	draw_polyline(calculate_circle(), stroke_color, 1.5, true)
	draw_circle(Vector2.ZERO, radius - 0.5, fill_color)
	draw_colored_polygon(calculate_circle(3.0, 20), stroke_color,
							PoolVector2Array(), null, null, true)

func calculate_circle(ra = radius, re = resolution):
	var circle = []
	var pv = Vector2(0.0, ra)
	for i in range(re + 1):
		circle.append(pv.rotated(deg2rad((i / float(re)) * 360.0)))
	return circle

func _physics_process(_delta): update()
