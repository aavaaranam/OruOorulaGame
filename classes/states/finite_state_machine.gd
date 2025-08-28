extends Node
class_name FiniteStateMachine

var states : Dictionary = {}
var current_state:State
@export var initial_state:State

#NOTE This is a generic finite_state_machine, it handles all states, changes to this code will affect
	# everything that uses a state machine!
	
func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_transition.connect(change_state)
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state

#Call the current states update function continuosly
func _process(delta):
	if current_state:
		current_state.update(delta)

#region State Management
func change_state(old_state:State,new_state_name:String):
	if old_state!= current_state:
		print("Invalid change_state trying from:"+old_state.name+"but currently in "+current_state.name)
		return
	var new_state =  states.get(new_state_name.to_lower())
	if !new_state:
		print("New state is empty")
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state=new_state
#endregion
