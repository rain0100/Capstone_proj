extends Gate

class_name OrGate

func evaluate():
	outputs[0].set_state((inputs[0].get_state() or inputs[1].get_state()))
