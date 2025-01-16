extends Node3D
class_name PickupItem3D

@onready var area = $Area3D
@onready var timer = $Timer
@export var item_name: String  
@export var item_icon: Texture2D 
@export var inventorySystem: InventorySystem
@export var nodeDependedSubpath : String
@export var audioStreamPlayer:AudioStreamPlayer
@export var sound:AudioStream

var nodeDepended : Control

func _ready():
	if sound != null:
		audioStreamPlayer.stream = sound
	area.input_event.connect(_on_area_3d_input_event)
	inventorySystem = get_tree().root.get_node("MainScene/SubViewportContainer2/SubViewport/InventorySystem")
	add_to_group("pickup_items")

func _on_area_3d_input_event(viewport, event, event_position, normal, shape_idx):
	if Input.is_action_pressed("uiClick"):
		if sound != null:
			audioStreamPlayer.play()
		nodeDepended = get_tree().root.get_node(nodeDependedSubpath)
		inventorySystem._on_item_picked_up(item_name, item_icon)
		self.visible = false
		timer.start()
		


func _on_timer_timeout():
	if nodeDepended != null:
			nodeDepended.queue_free()
	queue_free()
