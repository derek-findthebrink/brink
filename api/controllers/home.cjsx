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
console.log _content
{Main, pages} = require(BASE_DIR + "views/_base")

Contact = pages.Contact
Products = pages.Products

StackView = require(BASE_DIR + "views/_stack")

# Template Cache
# ----------------------------------------------
StackEl = React.createElement(StackView, _content["Stack"].props)
_Stack = ReactServer.renderToString(StackEl)

HomeEl = React.createElement(Main, _content["Home"].props)
_Home = ReactServer.renderToString(HomeEl)

PortfolioEl = React.createElement(Main, _content["Portfolio"].props)
_Portfolio = ReactServer.renderToString(PortfolioEl)

ProductsEl = React.createElement(Products, _content["Products"].props)
_Products = ReactServer.renderToString(ProductsEl)

ContactEl = React.createElement(Contact, _content["Contact"].props)
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