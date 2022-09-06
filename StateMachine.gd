class_name PG_StateMachine


# States is a stack of state.
# The top state in the statck is the current state.
var states = PG_Stack.new()

# This function should be invoked on every frame.
# The dt parameter is the time elapsed in seconds since the previous call to process.
func update_on_new_frame(dt):
	self.states.peek().update_on_new_frame(dt)

# This function should be called when a new input event happened
func on_input(input_ev):
	self.states.peek().on_input(input_ev)


# Push the state to the top of stack.
# Invoke the state's on_enter method.
func push_state(state):
	var prev_state = self.states.peek()
	self.states.push(state)
	state.on_enter(prev_state)