extends CanvasLayer

signal start_game
var score = 0
@onready var message_label = $Control/Label
@onready var score_label = $Control/ScoreLabel
@onready var start_button = $Control/StartButton
@onready var message_timer = $messageTimer

func show_message(text):
	message_label.text = text
	message_label.show()
	message_timer.start()
	
func show_game_over():
	show_message("Game Over")
	await message_timer.timeout
	
	message_label.text = "Vicky"
	message_label.show()
	
	await get_tree().create_timer(1.0).timeout
	score_label.text = str(score)


func _on_start_button_pressed():
	start_button.hide()
	start_game.emit()


func _on_message_timer_timeout():
	message_label.hide()

upate score
