extends Node2D

@export var bug_scene : PackedScene
var score 

func _ready():
	new_game()
	
func game_over():
	$BugTimer.stop()
	$ScoreTimer.stop()

func new_game():
	$StartTimer.start()
	$player.start_pos($StartPosition.Position)
	score = 0

func _on_bug_timer_timeout() -> void:
	var bug = bug_scene.instantiete()
	var bug_location = $BugPath/BugPathLocation
	bug_location.progress_ratio = randf()
	
	var direction = bug_location.rotation + PI / 2
	bug.position = bug_location.position
	direction += randf_range(-PI /4, PI/4)
	bug.rotation = direction 
	
	var velocity = Vector2(randf_range(150.0,250.0), 0.0)
	bug.linear_velocity = velocity.rotated(direction)
	add_child(bug)

func _on_start_timer_timeout() -> void:
	pass


func _on_score_timer_timeout() -> void:
	score += 1
