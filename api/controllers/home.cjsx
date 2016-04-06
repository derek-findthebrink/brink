React = require("react")
ReactServer = require("react-dom/server")

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

# Template Cache
# ----------------------------------------------
StackEl = React.createElement(StackView, _content["Stack"].props)
_Stack = ReactServer.renderToString(StackEl)

HomeEl = React.createElement(HomeView, _content["Home"].props)
_Home = ReactServer.renderToString(HomeEl)

PortfolioEl = React.createElement(PortfolioView, _content["Portfolio"].props)
_Portfolio = ReactServer.renderToString(PortfolioEl)

ProductsEl = React.createElement(ProductsView, _content["Products"].props)
_Products = ReactServer.renderToString(ProductsEl)

ContactEl = React.createElement(ContactView, _content["Contact"].props)
_Contact = ReactServer.renderToString(ContactEl)


module.exports = {
	home: (req, res)->
		res.render("pages/home", {
			content: _Home
			})
	portfolio: (req,res)->
		res.render("pages/portfolio", {
			content: _Portfolio
			})
	stack: (req, res)->
		res.render("pages/stack", {
			content: _Stack
			})
	contact: (req, res)->
		res.render("pages/contact", {
			content: _Contact
			})
	productsAndServices: (req, res)->
		res.render("pages/products-and-services", {
			content: _Products
			})
	productsAndServicesSub: (req, res)->
		sub = req.params.sub
		log.info sub:sub, "productsAndServicesSub"
		res.render("pages/products-and-services")
	productLearn: (req, res)->
		category = req.params.category
		product = req.params.product
		res.render("pages/products-and-services")
}