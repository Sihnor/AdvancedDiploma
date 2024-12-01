extends Node3D

signal itemPickedUp(itemName: String, itemIcon: Texture2D)

@onready var area = $Area3D
@export var main_camera: Camera3D  # Exported variable to assign the main camera

@export var item_name: String  # Name of the item
@export var item_icon: Texture2D  # Icon to represent the item in the inventory

func _ready():
	if main_camera == null:
		print("Main camera not assigned!")
		return

	area.input_event.connect(_on_area_3d_input_event)
	
	# Add this PickupItem to the "pickup_items" group
	add_to_group("pickup_items")

func _on_area_3d_input_event(viewport, event, event_position, normal, shape_idx):
	if Input.is_action_pressed("uiClick"):
		emit_signal("itemPickedUp", item_name, item_icon)  # Emit the signal locally
		queue_free()  # Remove the pickup item from the scene after it's picked up


func _on_button_button_down():
	print("i got pressed")
	emit_signal("itemPickedUp", item_name, item_icon)  # Emit the signal locally
	queue_free()  # Remove the pickup item from the scene after it's picked up
