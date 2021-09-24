extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		var grassEffect = load("res://Effects/GrassEffect.tscn").instance()
		grassEffect.global_position = global_position
		get_tree().current_scene.add_child(grassEffect)
		queue_free()
