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
	productsAndServices: (req, res)->
		res.render("pages/products-and-services")
	contact: (req, res)->
		res.render("pages/contact")
	productsAndServicesSub: (req, res)->
		sub = req.params.sub
		log.info sub:sub, "productsAndServicesSub"
		res.render("pages/products-and-services")
}