extends Node
class_name Level


const Cars = preload('res://scene/cars/cars.tscn')
var slow_lane: Array = [600, 544, 438, 324, 384, 216, 160]
var fast_lane: Array = [488, 272, 104]
var score_player_one: int = 0
var score_player_two: int = 0


func _ready() -> void:
  pass


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
