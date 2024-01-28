extends Area2D
const DialogBox = preload("res://Scripts/Dialog Box.gd")
var dialog_manager_scene = preload("res://Scenes/dialog_manager.tscn")
var dialog_manager_instance = null

func _on_body_entered(body):
	if body.name == "CharacterBody2D" and dialog_manager_instance == null and !GlobalVars.turn_battle_complete:
		dialog_manager_instance = dialog_manager_scene.instantiate()
		GlobalVars.scenario = "1-1"
		add_child(dialog_manager_instance)
