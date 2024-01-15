extends Gate

class_name NotGate

func evaluate():
	outputs[0].set_state(!inputs[0].get_state())
