class_name PG_StateMachine


# States is a stack of state.
# The top state in the statck is the current state.
var states = PG_Stack.new()

# This function should be invoked on every frame.
# The dt parameter is the time elapsed in seconds since the previous call to process.
func update_on_new_frame(dt):
	self.states.peek().update_on_new_frame(dt)

func on_input(input_ev):
	self.states.peek().on_input(input_ev)

