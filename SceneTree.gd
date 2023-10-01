class_name PG_SceneTree

static var paniced = false

func must_find_node(nodeInSceneTree: Node,path: String):
	var node = nodeInSceneTree.get_node(path)
	if node == null:
		panic(nodeInSceneTree,"not found node by path %s" % path)
	return node

static func panic(node_in_scene_tree: Node ,msg: String):
	paniced = true
	var dialog = AcceptDialog.new()
	dialog.dialog_text = msg
	dialog.title="game crash"
	
	dialog.canceled.connect(func():
			node_in_scene_tree.get_tree().quit()
	)
	dialog.confirmed.connect(func():
			node_in_scene_tree.get_tree().quit()
	)
	dialog.process_mode = Node.PROCESS_MODE_ALWAYS
	node_in_scene_tree.add_child(dialog)
	dialog.popup()
	node_in_scene_tree.get_tree().paused = true

func must_change_scene(node: Node,scene_path:String):
	var err_code = node.get_tree().change_scene_to_file(scene_path)
	if err_code != OK :
		panic(node,"Error: change scene to %s, err code: %s" % [scene_path,err_code])

func must_connect_signal(nodeInTree:Node,signal_owner:Node,signal_name: String,method_owner:Object,method_name:String, binds:Array=[]):
	var err_code 
	if binds.size() > 0:
		err_code = signal_owner.connect(signal_name,Callable(method_owner,method_name).bind(binds))
	else:
		err_code = signal_owner.connect(signal_name,Callable(method_owner,method_name))
		
	if err_code != OK:
		panic(nodeInTree,"failed to connect signal %s" % err_code)
		return

func must_instance_scene_from_path(nodeInTree: Node,scene_path: String):
	var scene_resource  = load(scene_path)
	if (scene_resource == null):
		panic(nodeInTree,"failed to load scene from path %s" % scene_path)
	return scene_resource.instantiate()
	
