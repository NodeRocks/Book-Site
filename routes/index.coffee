
###
GET home page.
###

exports.index = (req, res) ->
	res.render "index",
		title: "Node Rocks"

exports.player = (req, res) ->
	res.render "player",
		title: "Player"
		layout: false