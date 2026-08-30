extends Node2D

var test:String = 'something'

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_something()
	calculate()
	print(test)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func print_something() ->void:
	print("hello world")
	print(2 + 2)
	
func calculate():
	var a = 10
	var b = 20
	var result = pow(a,2) + pow(b,2)
	print(sqrt(result))
