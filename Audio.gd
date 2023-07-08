extends Node

class_name UtilsAudio

static func audio_stream_player_3d(stream:AudioStream)->AudioStreamPlayer3D:
	var player = AudioStreamPlayer3D.new()
	player.stream = stream
	return player

static func mp3_audio_stream(path:String)->AudioStreamMP3:
	var file =FileAccess.open(path,FileAccess.READ)
	if file == null:
		var err = FileAccess.get_open_error()
		SDKGame.exit(1,"Path %s not found" % path)
		return null
	return null
