extends Sprite

var tip_close = false
onready var timer = get_node("Timer")


func _ready():
	timer.set_wait_time(2)
	timer.start()

func TimerTimeout():
	queue_free()
	
