extends Gate

class_name NandGate

func evaluate():
	outputs[0].set_state(!(inputs[0].get_state() and inputs[1].get_state()))

	
