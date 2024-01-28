extends Area2D
const song2 = preload("res://Assets/Sounds/theme2.wav")
@onready var music_player1 = get_node("/root/GlobalTheme/theme")
@onready var music_player2 = get_node("/root/GlobalTheme/battle_theme")
@onready var animation_player = $"../../../UI/TransitionRect/AnimationPlayer"

func _on_body_entered(body):
	if body.name == "CharacterBody2D" && !GlobalVars.turn_battle_complete:
		music_player1.stop()
		music_player2.play()
		GlobalVars.disable_movement = true
		animation_player.play("flicker")
		$Timer.start(1.5)
		await $Timer.timeout
		GlobalVars.disable_movement = false
		get_tree().change_scene_to_file("res://Scenes/turn_based_battle2.tscn")
		GlobalVars.player_return_position = $"../../CharacterBody2D".position
