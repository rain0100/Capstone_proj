extends Node2D

var peer= ENetMultiplayerPeer.new()
@export var player_scence: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_host_pressed():
	peer.create_server(5000)
	multiplayer.multiplayer_peer=peer
	multiplayer.peer_connected.connect(add_player)
	add_player()

func _on_join_pressed():
	peer.create_client("127.0.0.1", 5000) #localhost port 5000
	multiplayer.multiplayer_peer=peer
	
	
func add_player(id=1):
	var player=player_scence.instantiate()
	player.name=str(id)
	call_deferred("add_child", player)
	
func exit_game(id):
	multiplayer.peer_disconnected.connect(del_player)
	del_player(id)
	
func del_player(id):
	rpc("_del_player", id)
	
@rpc("any_peer", "call_local")	func _del_player(id):
	get_node(str(id)).queue_free()
	
	
	
