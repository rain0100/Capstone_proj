extends Node2D

@onready var host = $host
@onready var join = $join
@onready var username = $username
@onready var send = $send
@onready var message= $message
@onready var messages= $messages
var usrnm: String 
var msg: String 


func _on_host_pressed():
	var peer= ENetMultiplayerPeer.new()
	peer.create_server(5000)
	get_tree().set_multiplayer(SceneMultiplayer.new(), self.get_path())
	multiplayer.multiplayer_peer=peer
	joined()


func _on_join_pressed():
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
