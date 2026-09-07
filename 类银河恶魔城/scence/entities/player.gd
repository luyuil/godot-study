extends CharacterBody2D

var direction_x: float 
var speed := 200
@export var jump_strength := 10
@export var gravity := 10

signal shoot(pos: Vector2, dir: Vector2)

# 这里横板闯关就只要用到左右移动键控制方向，所以使用单轴输入
func get_input():
	direction_x = Input.get_axis("left","right")
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_strength
	if Input.is_action_just_pressed("shoot") and $ReloadTimer.time_left == 0:
		var dir = get_local_mouse_position().normalized()
		shoot.emit(position, dir)
		print("shoot")
		$ReloadTimer.start()
		var tween = get_tree().create_tween()
		tween.tween_property($Marker, "scale", Vector2(0.1,0.1),0.2)
		tween.tween_property($Marker, "scale", Vector2(0.2,0.2),0.4)

# 加入重力运算
func apply_gravity(delta):
	velocity.y += gravity * delta

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	get_input()
	velocity.x = direction_x * speed 
	move_and_slide()
	animation()
	update_torso_aim()
	update_marker()
	
func animation():
	$Legs.flip_h = direction_x < 0
	#$AnimationPlayer.current_animation = 'run' if direction_x else 'idle'
	
	if !is_on_floor():
		$AnimationPlayer.current_animation = 'jump'
	else:
		$AnimationPlayer.current_animation = 'run' if direction_x else 'idle'
		
func update_torso_aim():
	var dir = get_global_mouse_position() - global_position
	var angle = dir.angle()  # 返回值范围：-PI ~ PI，0 表示正右方
	
	# 把负数角度转成 0~2PI，方便计算
	if angle < 0:
		angle += 2 * PI
	
	# 8个方向，每个占 45度(PI/4)
	# round() 四舍五入得到最近的方位，%8 防止溢出到第8帧
	var frame = int(round(angle / (PI / 4))) % 8
	$Torso.frame = frame

func update_marker():
	var dir = (get_global_mouse_position() - global_position).normalized()
	$Marker.position = 60 * dir
