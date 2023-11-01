extends CharacterBody2D

@export var path_follow : PathFollow2D 

@export var speed : float

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var splat = $splat
@onready var animation_player = $AnimationPlayer
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dead = false

var past_x = null

func _physics_process(delta):
	if past_x != null:
		if global_position.x <= past_x:
			animated_sprite_2d.flip_h = false
		else:
			animated_sprite_2d.flip_h = true

	past_x = global_position.x
	
	if path_follow and !is_dead:
		path_follow.progress_ratio +=  speed * delta
	
	if is_dead:
		velocity.y += gravity * delta
	move_and_slide()
func die():
	animation_player.play("die")
	is_dead = true
	
	

