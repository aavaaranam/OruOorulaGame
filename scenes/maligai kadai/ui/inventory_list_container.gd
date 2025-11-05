extends VBoxContainer
var InventorySlot = preload("res://scenes/maligai kadai/ui/shop_inventory_slot.tscn")
const SHOP_INVENTORY_STOCK = preload("res://scenes/maligai kadai/inventory/shop_inventory_stock.tres")


func _ready() -> void:
	for item in SHOP_INVENTORY_STOCK.items:
		var inventoryRow = preload("res://scenes/maligai kadai/ui/shop_inventory_slot.tscn").instantiate()
		inventoryRow.item = item
		add_child(inventoryRow)
