extends Area2D


var speed = 200

func _process(delta):
	position += transform.x * speed * delta


func _on_body_entered(body):
	body.die()
	queue_free()


func _on_timer_timeout():
	queue_free()
