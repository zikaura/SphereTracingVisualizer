tool
extends Node

const maxDstToScene =  3000.0

func signedDstToCircle(p: Vector2, centre: Vector2, radius: float):
	return MathUtils.vlength(centre - p) - radius

func signedDstToBox(p: Vector2, centre: Vector2, size: Vector2):
	var offset = (p - centre).abs() - (size * 0.5)
	var unsignedDst = (MathUtils.cmax(offset, 0)).length()
	var dstInsideBox = MathUtils.cmax(MathUtils.cmin(offset, 0)).length()
	return unsignedDst + dstInsideBox

func signedDstToScene(p: Vector2, scene: Node):
	var dstToScene = maxDstToScene
	var objects = scene.get_children()
	
	for object in objects:
		if object is DynamicBox:
			var dstToBox = signedDstToBox(p, object.position, object.box_size)
			dstToScene = min(dstToBox, dstToScene)
		elif object is DynamicCircle:
			var dstToCircle = signedDstToCircle(p, object.position, object.radius)
			dstToScene = min(dstToCircle, dstToScene)
			
	return dstToScene
