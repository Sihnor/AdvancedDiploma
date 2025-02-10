extends Control

class_name OptionMenu

@onready var masterSlider= $Panel/MarginContainer/VBoxContainer/MasterContainer/MasterSlider
@onready var bgmSlider= $Panel/MarginContainer/VBoxContainer/BGMContainer/BGMSlider
@onready var sfxSlider= $Panel/MarginContainer/VBoxContainer/SFXContainer/SFXSlider
@onready var voiceSlider= $Panel/MarginContainer/VBoxContainer/VoiceContainer/VoiceSlider
@onready var resolutionButton=$Panel/MarginContainer/VBoxContainer/ResolutionContainer/OptionButton
@onready var fullscreenCheckbox=$Panel/MarginContainer/VBoxContainer/FullscreenContainer/CheckBox
@onready var skipSlidePuzzle = $Panel/MarginContainer/VBoxContainer/SkipSlidePuzzle/Skip
@onready var backButton = $Panel/MarginContainer/VBoxContainer/Button
@onready var sfxAudioStream: AudioStreamPlayer = $SFX
@onready var voiceAudioStream: AudioStreamPlayer = $Voice
@onready var bgmAudioStream : AudioStreamPlayer = $BGM
@export var isPauseMenu = false
@export var pausePanel: Panel = null

# Called when the node enters the scene tree for the first time.
func _ready():
	masterSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	bgmSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("BGM"))
	sfxSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX"))
	voiceSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Voice"))
	voiceAudioStream.stop()
	if isPauseMenu:
		stopOptionMusic()
	else:
		playOptionMusic()
		#bgmAudioStream.autoplay = false
	
	# Initialize sliders and settings
	loadSettings()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_master_slider_value_changed(value):
	if value <= -69:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)


func _on_bgm_slider_value_changed(value):
	if value <= -69:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), false)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("BGM"),value)


func _on_sfx_slider_value_changed(value):
	if value <= -69:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), false)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),value)
	sfxAudioStream.play()


func _on_voice_slider_value_changed(value):
	print(value)
	if value <= -69:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Voice"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Voice"), false)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Voice"),value)
	voiceAudioStream.play()


func _on_option_button_item_selected(index):
	var resolution = resolutionButton.get_item_text(index)
	var dimensions = resolution.split("x")
	var newSize = Vector2(int(dimensions[0]), int(dimensions[1]))
	DisplayServer.window_set_size(newSize)


func _on_check_box_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_WINDOWED)

func _on_skip_toggled(toggled_on):
	if toggled_on:
		GameManager.skipSlidePuzzle = true
	else:
		GameManager.skipSlidePuzzle = false


func _on_button_pressed():
	sfxAudioStream.play()
	if isPauseMenu:
		if pausePanel != null:
			self.visible = false
			pausePanel.visible = true
	else:
		get_tree().change_scene_to_file("res://scenes/Menus/MainMenu.tscn")

func playOptionMusic():
	bgmAudioStream.play()
	
func stopOptionMusic():
	bgmAudioStream.stop()

func loadSettings():
	# Set default master volume to (-12 dB) if not already set
	if AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")) == 0:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -12)
	
	# Load current settings
	masterSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	bgmSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("BGM"))
	sfxSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX"))
	voiceSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Voice"))
	
	# Get the current window mode
	skipSlidePuzzle.button_pressed = GameManager.skipSlidePuzzle
	fullscreenCheckbox.button_pressed= DisplayServer.window_get_mode() == DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN
	# Populate resolution dropdown
	var resolutions = ["1920x1080", "1920x1009", "1918x1078", "1600x900", "1280x720", "1152x648"]
	for resolution in resolutions:
		resolutionButton.add_item(resolution)
	
	# Get the current resolution and select the appropriate item in the dropdown
	var currentResolution = str(DisplayServer.window_get_size().x) + "x" + str(DisplayServer.window_get_size().y)
	resolutionButton.select(resolutions.find(currentResolution))
