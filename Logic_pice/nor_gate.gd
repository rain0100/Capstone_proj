extends Gate

class_name NorGate


func evaluate():
	#this should not be a nand gate just to demenstat to jordan
	outputs[0].set_state(!(inputs[0].get_state() or inputs[1].get_state()))
