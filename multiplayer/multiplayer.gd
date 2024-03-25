extends Node2D

@onready var host = $host
@onready var join = $join
@onready var username = $username
@onready var send = $send
@onready var message= $message
@onready var messages= $messages
static var usrnm: String 
var msg: String 

static var host_flag=0
static var join_flag=0

func _enter_tree():
	print(host_flag)
	if(host_flag>1):
		usrnm=usrnm
		$join.hide()
		$host.hide()
		$username.hide()
	if(join_flag>1):
		usrnm=usrnm
		$join.hide()
		$host.hide()
		$username.hide()
	
func _on_host_pressed():
	host_flag=host_flag+1
	var peer= ENetMultiplayerPeer.new()
	peer.create_server(5000)
	get_tree().set_multiplayer(SceneMultiplayer.new(), self.get_path())
	multiplayer.multiplayer_peer=peer
	joined()

func _on_join_pressed():
	join_flag=join_flag+1
	var peer= ENetMultiplayerPeer.new()
	peer.create_client("127.0.0.1", 5000)
	get_tree().set_multiplayer(SceneMultiplayer.new(), self.get_path())
	multiplayer.multiplayer_peer=peer
	joined()
	
@rpc("any_peer","call_local")
func msg_rpc(usrnm,data):
	messages.text+=str(usrnm, ": ", data, "\n")
	messages.scroll_vertical=INF
	
func _on_send_pressed():
	rpc("msg_rpc", usrnm, message.text)
	message.text=""
	
func joined():
	host.hide()
	join.hide()
	username.hide()
	usrnm=username.text

func _on_levels_pressed():
	if(LevelSelect.mult_load_flag):
		get_tree().change_scene_to_file("res://Load Game Menu/Level_Select.tscn")
	else:
		get_tree().change_scene_to_file("res://New Game Menu/Level_Select.tscn")
