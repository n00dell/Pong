extends StaticBody2D
var p_height: int
var win_height: float
var direction: float

# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
	random_dir()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	var speed = get_parent().PADDLE_SPEED
	position.y += direction * speed * delta
	if position.y <= p_height/2 :
		position.y = p_height/2
		direction *= -1
	if position.y >= win_height - (p_height/2):
		position.y = win_height - (p_height/2)
		direction *= -1 

func random_dir():
	direction = [-1.0, 1.0].pick_random()
