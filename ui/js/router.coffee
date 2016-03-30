_ = require("lodash")
$ = require("jquery")
Backbone = require("backbone")

# Helpers
# -----------------------
_dispatch = (page)->
	x = {
		action: "render_content"
		page: page
	}
	return app.flux.dispatch(x)


# Router Export
# ----------------------------------------------
router = Backbone.Router.extend({
	initialize: ->
		if !Backbone.History.started
			Backbone.history.start({
				pushState: true
				root: "/"
				})
		targets = $("nav.slicknav_nav a")
		targets.click (e)=>
			e.preventDefault()
			t = $(e.currentTarget).attr("href")
			n = t.substring(1, t.length)
			@navigate n, {trigger: true}
	routes:
		""							: 	"home"
		"portfolio"					: 	"portfolio"
		"stack"						:	"stack"
		"products-and-services"		:	"products"
		"contact"					:	"contact"
	home: ->
		_dispatch("home")
	portfolio: ->
		_dispatch("portfolio")
	stack: ->
		_dispatch("stack")
	products: ->
		_dispatch("products")
	contact: ->
		_dispatch("contact")

	})

module.exports = router