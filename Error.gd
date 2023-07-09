class_name SDKError

var err_msg: String
var err_code: int

static func create(err_code: int, err_msg:String)->SDKError:
	var err = SDKError.new()
	err.err_code = err_code
	err.err_msg = err_msg
	return err
