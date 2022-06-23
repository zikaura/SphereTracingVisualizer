tool
extends Node2D
class_name DynamicBox

export var color: Color
export var box_size: Vector2

func calculate_box(bsize: Vector2, origin: Vector2) -> PoolVector2Array:
	var tl = origin + (bsize * Vector2(-0.5,  0.5))
	var tr = origin + (bsize * Vector2( 0.5,  0.5))
	var bl = origin + (bsize * Vector2(-0.5, -0.5))
	var br = origin + (bsize * Vector2( 0.5, -0.5))
	
	return PoolVector2Array( [tl,  tr,  br,  bl] )

func _draw():
	draw_colored_polygon(calculate_box(box_size, Vector2.ZERO), color)
