extends Control

signal itemPickedUp(itemName: String, itemIcon: Texture2D)
@export var item_name: String  # Name of the item
@export var item_icon: Texture2D  # Icon to represent the item in the inventory

func _ready():
	if item_name != null:
		return
	if item_icon != null:
		return
	# Add this PickupItem to the "pickup_items" group
	add_to_group("pickup_items")


func _on_button_pressed():
	print("Pickup")
	emit_signal("itemPickedUp", item_name, item_icon)  # Emit the signal locally
	queue_free()  # Remove the pickup item from the scene after it's picked up
