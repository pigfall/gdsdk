class_name PG_AudioResourceManager

static var lock = Mutex.new()
static var cache = {}

# Result<AudioStreamMP3>
static func load_audio(path: String)->Result:
	var stream: AudioStreamMP3
	lock.lock()
	stream = cache.get(path)
	lock.unlock()
	if stream != null:
		return Result.with_value(stream)
	var result: Result = Utils.load_mp3(path)
	if result.error != null:
		return result
	lock.lock()
	cache[path] = result.value
	lock.unlock()
	
	return result
