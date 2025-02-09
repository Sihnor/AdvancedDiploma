extends Control

class_name PauseMenu

@onready var resumeButton = $CanvasLayer/Panel/PauseContainer/Resume
@onready var optionsButton = $CanvasLayer/Panel/PauseContainer/Options
@onready var returnButton = $CanvasLayer/Panel/PauseContainer/ReturnMenu
@onready var optionMenu:OptionMenu = $CanvasLayer/OptionMenu
@onready var pauseContainer = $CanvasLayer/Panel
@onready var pauseMenu = $CanvasLayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pauseMenu.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("PauseGame"):
		togglePauseMenu()

func togglePauseMenu():
	pauseMenu.visible = not pauseMenu.visible
	get_tree().paused = pauseMenu.visible
	if pauseMenu.visible:
		optionMenu.playOptionMusic()

func _on_resume_pressed() -> void:
	togglePauseMenu()
	optionMenu.stopOptionMusic()

func _on_options_pressed() -> void:
	pauseContainer.visible = false
	optionMenu.visible = true

func _on_return_menu_pressed() -> void:
	optionMenu.stopOptionMusic()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Menus/MainMenu.tscn")

func onResetSetup() :
	if get_tree().paused:
		pauseContainer.visible = true
		optionMenu.visible = false
		get_tree().paused = false
		optionMenu.stopOptionMusic()
