React = require("react")
ReactDOM = require("react-dom")


try
	log = appLogger.child({
		type: "controller"
		file: "home"
		})
catch e
	log = console
	log.info = console.log


module.exports = {
	home: (req, res)->
		res.render("pages/home")
	portfolio: (req,res)->
		res.render("pages/portfolio")
	stack: (req, res)->
		res.render("pages/stack")
	contact: (req, res)->
		res.render("pages/contact")
	productsAndServices: (req, res)->
		res.render("pages/products-and-services")
	productsAndServicesSub: (req, res)->
		sub = req.params.sub
		log.info sub:sub, "productsAndServicesSub"
		res.render("pages/products-and-services")
	productLearn: (req, res)->
		category = req.params.category
		product = req.params.product
		res.render("pages/products-and-services")
}