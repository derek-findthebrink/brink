exports.collect = (fn)->
	stuff = []
	add = (css)->
		stuff.push(css)
	old = exports.add
	exports.add = add
	fn()
	exports.add = old
	return stuff.join("\n")

exports.add = ()->