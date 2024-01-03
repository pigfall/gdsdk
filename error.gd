class_name PG_Error

var error

static func create(error_)->PG_Error:
	var e =PG_Error.new()
	e.error = error_
	return e

func get_error():
	return error
