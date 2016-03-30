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
}