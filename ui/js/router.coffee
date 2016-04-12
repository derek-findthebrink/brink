_ = require("lodash")
$ = require("jquery")
Backbone = require("backbone")

# Helpers
# -----------------------
_dispatch = (page, sub)->
	x = {
		action: "render_content"
		page: page
		sub: sub || null
	}
	return app.flux.dispatch(x)


# Router Export
# ----------------------------------------------
router = Backbone.Router.extend({
	initialize: ->
		console.log "router init"
		if !Backbone.History.started
			console.log "starting backbone history..."
			Backbone.history.start({
				pushState: true
				root: "/"
				})
		@listeners()
	listeners: ->
		targets = $(".app-nav")
		targets.off("click")
		targets.click (e)->
			e.preventDefault()
			t = $(e.currentTarget).attr("href")
			n = t.substring(1, t.length)
			app.router.navigate n, {trigger: true}
	hrefNavigator: (href)->
		l = document.createElement("a")
		l.href = href
		n = l.pathname.substring(1, l.pathname.length)
		app.router.navigate(n, {trigger: true})
	routes:
		""										: 	"home"
		"products-and-services(/:sub)"			:	"products"
		"products-and-services/:sub/:product"	: 	"renderProductLearn"
		"contact/:category/:product"			:	"contactProduct"
		"portfolio"								: 	"portfolio"
		"stack"									:	"stack"
		"contact"								:	"contact"
	home: ->
		_dispatch("Home")
	portfolio: ->
		_dispatch("Portfolio")
	stack: ->
		_dispatch("Stack")
	products: (sub)->
		# console.log sub:sub
		section = sub || "packages"
		_dispatch("Products", section)
	contact: ->
		_dispatch("Contact")
	renderProduct: (sub)->
		_dispatch("Products", sub)
	renderProductLearn: (sub, product)->
		# console.log sub:sub, product:product
		app.flux.dispatch({
			action: "render_learn"
			category: sub
			product: product
			})
	contactProduct: (category, product)->
		# console.log "contactProduct"
		# console.log category:category, product:product
		x = category:category, product:product
		app.flux.dispatch({
			action: "render_content"
			page: "Contact"
			merge:
				product: x
			})
	})

module.exports = router