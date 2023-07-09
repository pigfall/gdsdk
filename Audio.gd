extends Node

class_name SDKAudio

static func audio_stream_player_3d(stream:AudioStream)->AudioStreamPlayer3D:
	var player = AudioStreamPlayer3D.new()
	player.stream = stream
	return player

static func mp3_audio_stream(path:String)->Result:
	var file =FileAccess.open(path,FileAccess.READ)
	if file == null:
		var err = FileAccess.get_open_error()
		return Result.create(null, SDKError.create(0,"Read file {path} error: {err}".format({"path":path,"err":err})))
	var buffer = file.get_buffer(file.get_length())
	var stream =  AudioStreamMP3.new()
	file.close()
	stream.data =buffer
	return Result.create(stream,null)
