extends Node2D

func create_grass_effect():
	var grassEffect = load("res://Effects/GrassEffect.tscn").instance()
	grassEffect.global_position = global_position
	get_tree().current_scene.add_child(grassEffect)

func _on_Hurtbox_area_entered(area):
	create_grass_effect()
	queue_free()
