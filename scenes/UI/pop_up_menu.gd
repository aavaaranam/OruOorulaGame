extends MarginContainer
var is_open = false

#func _ready() -> void:
	#visible = false
	#
#func _process(delta: float) -> void:
	#if(Input.is_action_just_pressed("open_Inv")):
		#if is_open:
			#close()
		#else:
			##update_slots()
			#open()
#
#
#func close():
	#visible = false
	#is_open = false
#
#func open():
	#visible = true
	#is_open = true
