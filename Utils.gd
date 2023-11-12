extends Node

class_name Utils

static func panic(node_in_tree:Node,msg: String):
	PG_SceneTree.panic(node_in_tree,msg)
	
# Result<AudioStreamMP3>
static func load_mp3(path:String)->Result:
	var file = FileAccess.open(path,FileAccess.READ)
	if file == null:
		var err = FileAccess.get_open_error()
		return Result.with_err(err)
	var stream = AudioStreamMP3.new()
	stream.data = file.get_buffer(file.get_length())
	file.close()
	return Result.with_value(stream)
