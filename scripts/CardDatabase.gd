extends Node

var cards: Array[Dictionary] = []

func _ready() -> void:
	print("Loading cards.json...")

	var json_text := FileAccess.get_file_as_string("res://data/cards.json")
	var parsed = JSON.parse_string(json_text)

	if typeof(parsed) == TYPE_DICTIONARY and parsed.has("cards"):
		cards.clear()
		for c in parsed["cards"]:
			if typeof(c) == TYPE_DICTIONARY:
				cards.append(c)

	print("Loaded %d cards" % cards.size())
	if cards.size() > 0:
		print("First card:", cards[0].get("name", ""))

func get_all_cards() -> Array[Dictionary]:
	return cards

func get_random_card() -> Dictionary:
	if cards.is_empty():
		return {}
	return cards.pick_random()
