class_name Result

var value =null
var err:SDKError= null

static func create(value:Object,err:SDKError)->Result:
	var result = Result.new()
	result.value = value
	result.err = err
	return result

