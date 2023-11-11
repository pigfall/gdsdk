class_name PG_StateMachine


# States is a stack of state.
# The top state in the statck is the current state.
var states = PG_Stack.new()

# This function should be invoked checked every frame.
# The dt parameter is the time elapsed in seconds since the previous call to process.
func update_on_new_frame(dt):
	self.states.peek().update_on_new_frame(dt)

# This function should be called when a new input event happened
func on_input(input_ev):
	self.states.peek().on_input(input_ev)

func on_unhandled_input(input_ev):
	self.states.peek().on_unhandled_input(input_ev)

func exec_cmd(cmd):
	self.states.peek().exec_cmd(cmd)



# Push the state to the top of stack.
# Invoke the state's on_enter method.
func push_state(state:State):
	var prev_state = self.states.peek()
	self.states.push(state)
	state.on_enter(prev_state)

func pop_state():
	var prev_state =self.states.pop()
	prev_state.on_leave()
	self.states.peek().on_enter(prev_state)

class State:
	func on_leave():
		pass
	func on_enter(_prev_state):
		pass
	func exec_cmd(_cmd):
		pass
	func on_input(_input_ev):
		pass
	func on_unhandled_input(_input_ev):
		pass
	func update_on_new_frame(_dt):
		pass
