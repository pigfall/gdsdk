# Represents a variable size last-in-first-out collection of elements
class_name PG_Stack

var elems = []

# Insert a elem at the top of the stack.
func push(elem):
    self.elems.append(elem)

# Removes and returns the object at the top of the stack.
func pop():
    self.elems.pop_back()

# Returns the object at the top of stack without removing it.
func peek():
    if self.elems.is_empty():
        return null
    return self.elems.back()


