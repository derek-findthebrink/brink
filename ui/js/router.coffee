_ = require("lodash")
$ = require("jquery")
Backbone = require("backbone")

router = Backbone.Router.extend({
	initialize: ->
		if !Backbone.History.started
			Backbone.history.start({
				pushState: true
				root: "/"
				})
	})

module.exports = router