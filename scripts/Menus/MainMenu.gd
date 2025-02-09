extends Control

@onready var sfxAudioStream = $SFX
@onready var videoPlayer = $VideoStreamPlayer
@onready var menu = $Panel
@export var introCutscene: VideoStreamTheora

# Called when the node enters the scene tree for the first time.
func _ready():
	menu.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_game_pressed():
	sfxAudioStream.play()
	menu.visible = false
	videoPlayer.loop = false
	videoPlayer.stream = introCutscene
	videoPlayer.play()
	pass # Replace with function body.


func _on_options_pressed():
	sfxAudioStream.play()
	#TODO: Load the game scene, include game path
	get_tree().change_scene_to_file("res://scenes/Menus/OptionMenu.tscn") 
	pass # Replace with function body.


func _on_quit_pressed():
	sfxAudioStream.play()
	#TODO: Load the game scene, include game path
	get_tree().quit()
	pass # Replace with function body.


func _on_credits_pressed():
	sfxAudioStream.play()
	get_tree().change_scene_to_file("res://scenes/Menus/EndMenu.tscn") 


func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://scenes/Main.tscn") 
	GameManager.loadGameManager()
	SceneManager.loadSceneManager()
	pass # Replace with function body.
