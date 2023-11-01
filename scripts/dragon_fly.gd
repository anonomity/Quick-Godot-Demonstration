extends CharacterBody2D

@export var path_follow : PathFollow2D 

@export var speed : float

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var splat = $splat
@onready var animation_player = $AnimationPlayer

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var past_x = null
var is_alive = true

func _physics_process(delta):
	
#	print(animated_sprite_2d.animation)
	if past_x != null:
		if global_position.x <= past_x:
			animated_sprite_2d.flip_h = false
		else:
			animated_sprite_2d.flip_h = true

	past_x = global_position.x
	
	if path_follow and is_alive:
		path_follow.progress_ratio +=  speed * delta
	
	if !is_alive:
		velocity.y += delta * gravity


func die():
	if is_alive:
		print("dying")
		dead_dragonfly()
		animation_player.play("die")
		animated_sprite_2d.play("dead")
	


func dead_dragonfly():
	is_alive = false
	
