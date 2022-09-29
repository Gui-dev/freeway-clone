extends Node
class_name Level


const Cars = preload('res://scene/cars/cars.tscn')
var slow_lane: Array = [600, 544, 438, 324, 384, 216, 160]
var fast_lane: Array = [488, 272, 104]
var score_player_one: int = 0
var score_player_two: int = 0
onready var fast_car_timer: Timer = $fast_car_timer
onready var slow_car_timer: Timer = $slow_car_timer
onready var label_score_player_one: Label = $label_score_player_one
onready var label_score_player_two: Label = $label_score_player_two
onready var winning_player: Label = $winning_player
onready var points: AudioStreamPlayer2D = $points
onready var win: AudioStreamPlayer2D = $win
onready var background_sfx: AudioStreamPlayer2D = $background_sfx


func _ready() -> void:
  randomize()


func _on_fast_car_timer_timeout() -> void:
  var fast_car = Cars.instance()
  fast_car.position.x = -10
  fast_car.position.y = fast_lane[randi() % fast_lane.size()]
  fast_car.linear_velocity = Vector2(rand_range(700, 710), 0)
  get_tree().root.call_deferred('add_child', fast_car)


func _on_slow_car_timer_timeout() -> void:
  var slow_car = Cars.instance()
  slow_car.position.x = -10
  slow_car.position.y = slow_lane[randi() % slow_lane.size()]
  slow_car.linear_velocity = Vector2(rand_range(300, 310), 0)
  get_tree().root.call_deferred('add_child', slow_car)


func _on_point_player_one() -> void:
  if score_player_one < 10:
    score_player_one += 1
    points.play()
    label_score_player_one.text = str(score_player_one)
  if score_player_one >= 10:
    background_sfx.stop()
    winning_player.text = 'Player 1 WIN'
    win.play()
    fast_car_timer.stop()
    slow_car_timer.stop()
    

func _on_point_player_two() -> void:
  if score_player_two < 2:
    score_player_two += 1
    points.play()
    label_score_player_two.text = str(score_player_two)
  if score_player_two >= 2:
    background_sfx.stop()
    winning_player.text = 'Player 2 WIN'
    win.play()
    fast_car_timer.stop()
    slow_car_timer.stop()
