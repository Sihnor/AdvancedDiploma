extends Control

@onready var backButton = $Panel/Panel/Back
@onready var sfxAudioStream: AudioStreamPlayer = $SFX
@onready var voiceAudioStream: AudioStreamPlayer = $Voice


func _on_back_pressed():
	sfxAudioStream.play()
	get_tree().change_scene_to_file("res://scenes/Menus/MainMenu.tscn")
