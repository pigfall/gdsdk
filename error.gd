class_name PG_Error

var error

static func create(error)->PG_Error:
	var e =PG_Error.new()
	e.error = error
	return e
