extends Node

@onready var pauseMenu: PauseMenu = $".."
@onready var optionMenu: OptionMenu = $"../CanvasLayer/OptionMenu"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("PauseGame"):
		get_viewport().set_input_as_handled()
		pauseMenu.onResetSetup()
		#if get_tree().paused:
		#	get_tree().paused = false
