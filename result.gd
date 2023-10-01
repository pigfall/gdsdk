class_name Result

var value
var error

static func with_err(err)->Result:
	var r = Result.new()
	r.error = err
	return r
	
static func with_value(v)->Result:
	var r = Result.new()
	r.value = v
	return r
