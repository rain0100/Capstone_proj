extends Gate

class_name XorGate

func evaluate():
	outputs[0].set_state((inputs[0].get_state() != inputs[1].get_state()))

