extends CPUParticles2D

@onready var timer=$Timer
func _ready() -> void:
	timer.wait_time=lifetime
	timer.timeout.connect(queue_free)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
