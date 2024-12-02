extends Node3D
@onready var area = $Area3D

@export var item_name: String  # Name of the item
@export var item_icon: Texture2D  # Icon to represent the item in the inventory
@export var inventorySystem: InventorySystem

func _ready():
	area.input_event.connect(_on_area_3d_input_event)
	# Add this PickupItem to the "pickup_items" group
	add_to_group("pickup_items")

func _on_area_3d_input_event(viewport, event, event_position, normal, shape_idx):
	if Input.is_action_pressed("uiClick"):
		inventorySystem._on_item_picked_up(item_name, item_icon)
		queue_free()  # Remove the pickup item from the scene after it's picked up
