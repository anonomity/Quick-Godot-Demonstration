extends Node2D




func _on_death_area_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
