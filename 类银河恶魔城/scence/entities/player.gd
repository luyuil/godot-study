extends CharacterBody2D

var direction_x: float 
var speed := 200
@export var jump_strength := 10
@export var gravity := 10

# 这里横板闯关就只要用到左右移动键控制方向，所以使用单轴输入
func get_input():
	direction_x = Input.get_axis("left","right")
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_strength
	var colddown_time: float
	colddown_time += 0.1
	if Input.is_action_just_pressed("shoot"):
		print("shoot")
		colddown_time = 0.0
	

# 加入重力运算
func apply_gravity(delta):
	velocity.y += gravity * delta

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	get_input()
	velocity.x = direction_x * speed 
	move_and_slide()
	
