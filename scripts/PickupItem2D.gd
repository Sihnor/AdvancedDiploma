extends Control

signal itemPickedUp(itemName: String, itemIcon: Texture2D)
@export var item_name: String
@export var item_icon: Texture2D

func _ready():
	if item_name != null:
		return
	if item_icon != null:
		return
	add_to_group("pickup_items")


func _on_button_pressed():
	print("Pickup")
	emit_signal("itemPickedUp", item_name, item_icon)  
	queue_free()
