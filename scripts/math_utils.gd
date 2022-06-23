tool
extends Node

func vlength(v: Vector2):
	return sqrt(v.x*v.x + v.y*v.y)

func cmax(x, y = 0.0):
	var xt = typeof(x)
	var yt = typeof(y)

	if ((xt == TYPE_REAL) or (xt == TYPE_INT)) and ((yt == TYPE_REAL) or (yt == TYPE_INT)):
		return max(x, y)
	elif xt == TYPE_VECTOR2 and yt == TYPE_VECTOR2:
		return vvmax(x, y)
	else:
		return vimax(x, y)

func vvmax(x, y):
	return Vector2(
			max(x[0], y[0]),
			max(x[1], y[1]))

func vimax(x, y):
	var xt = typeof(x)
	var yt = typeof(y)

	if ((xt == TYPE_REAL) or (xt == TYPE_INT)) and (yt == TYPE_VECTOR2):
		return vvmax(Vector2(x, x), y)
	elif (xt == TYPE_VECTOR2) and ((yt == TYPE_REAL) or (yt == TYPE_INT)):
		return vvmax(x, Vector2(y, y))

func cmin(x, y = 0.0):
	var xt = typeof(x)
	var yt = typeof(y)

	if ((xt == TYPE_REAL) or (xt == TYPE_INT)) and ((yt == TYPE_REAL) or (yt == TYPE_INT)):
		return min(x, y)
	elif xt == TYPE_VECTOR2 and yt == TYPE_VECTOR2:
		return vvmin(x, y)
	else:
		return vimin(x, y)

func vvmin(x, y):
	return Vector2(
			min(x[0], y[0]),
			min(x[1], y[1]))

func vimin(x, y):
	var xt = typeof(x)
	var yt = typeof(y)

	if ((xt == TYPE_REAL) or (xt == TYPE_INT)) and (yt == TYPE_VECTOR2):
		return vvmin(Vector2(x, x), y)
	elif (xt == TYPE_VECTOR2) and ((yt == TYPE_REAL) or (yt == TYPE_INT)):
		return vvmin(x, Vector2(y, y))
