extends Area2D


var speed = 200

func _process(delta):
	position += transform.x * speed * delta
