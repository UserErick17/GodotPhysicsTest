extends KinematicBody2D

# Declare member variables here. Examples:
const SPEED = 200
# var b = "text"
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	# ler entrada do jogador
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized() 
	# normalizar o vetor para manter a mesma velocidade diagonal

	# atualizar a velocidade do personagem
	velocity = input_vector * SPEED

	# mover o personagem
	var collision = move_and_collide(velocity * delta)

	# lidar com colisões
	if collision:
		velocity = velocity.bounce(collision.normal) 
	# fazer o personagem "quicar" quando colidir com um objeto
