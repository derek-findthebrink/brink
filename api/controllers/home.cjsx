React = require("react")
ReactServer = require("react-dom/server")
_ = require("underscore")

try
	log = appLogger.child({
		type: "controller"
		file: "home"
		})
catch e
	log = console
	log.info = console.log

BASE_DIR = "../../ui/js/"
_content = require(BASE_DIR + "content/index")

HomeView = require(BASE_DIR + "views/home")
StackView = require(BASE_DIR + "views/stack")
ProductsView = require(BASE_DIR + "views/product")
ContactView = require(BASE_DIR + "views/contact")
PortfolioView = require(BASE_DIR + "views/portfolio")

views = {
	"Home": HomeView
	"Stack": StackView
	"Products": ProductsView
	"Contact": ContactView
	"Portfolio": PortfolioView
}

render = (name, req)->
	user = req.user || null
	x = {
		content: _render(name, user)
		user: user
		base: "app"
	}
	return x

_render = (name, user)->
	contentProps = _content[name].props
	view = views[name]
	props = _createProps(user, contentProps)
	html = _renderView(view, props)
	return html

_createProps = (user, props)->
	_base = {
		user: user
	}
	x = _.extend _base, props
	return x

_renderView = (view, props)->
	x = React.createElement(view, props)
	str = ReactServer.renderToString(x)
	return str



inputData = (req, res, next)->
	data = req.body
	log.info data:data, "contact post data"
	x = new Contact(data)
	x.save (err)->
		if err then log.error {err}, "contact save error"
		next(err)

renderThanks = (req, res)->
	res.redirect("/contact")





module.exports = {
	home: (req, res)->
		res.render("pages/home", render("Home", req))
	portfolio: (req,res)->
		res.render("pages/portfolio", render("Portfolio", req))
	stack: (req, res)->
		res.render("pages/stack", render("Stack", req))
	contact: (req, res)->
		res.render("pages/contact", render("Contact", req))
	productsAndServices: (req, res)->
		res.render("pages/products-and-services", render("Products", req))
	productsAndServicesSub: (req, res)->
		sub = req.params.sub
		log.info sub:sub, "productsAndServicesSub"
		res.render("pages/products-and-services", render("Products", req))
	productLearn: (req, res)->
		category = req.params.category
		product = req.params.product
		res.render("pages/products-and-services")
	contactProduct: (req, res)->
		category = req.params.category
		product = req.params.product
		user = req.user || null
		x = category:category, product:product
		newProps = _.extend _content["Contact"].props, product:x, user:user
		y = React.createElement(ContactView, newProps)
		z = ReactServer.renderToString(y)
		res.render("pages/contact", render("Contact", req))

	inputData: inputData
	renderThanks: renderThanks
}