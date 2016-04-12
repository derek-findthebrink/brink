nodepath = require("path")
React = require("react")
ReactServer = require("react-dom/server")
mongoose = require("mongoose")
_ = require("lodash")
Q = require("q")




try
	log = appLogger.child({
		type: "route"
		file: "admin"
	})
catch
	log = console
	log.info = console.log

# Database
# --------------------------
log.info {models: mongoose.modelNames()}, "loaded models"
Account = mongoose.model("Account")




# View Controllers
# ------------------------
_viewsDir = nodepath.join(process.cwd(), "ui/js/views/admin/")

LoginView = require(_viewsDir + "login")
DashboardView = require(_viewsDir + "dashboard")
EditView = require(_viewsDir + "edit")

renderWithProps = (view, props)->
	_props = props || {}
	_v = React.createElement(view, _props)
	_html = ReactServer.renderToString(_v)
	return _html






# Rendering
# ---------------------------

renderLogin = (req, res)->
	props = {
		title: "login"
		action: "/admin/login"
	}
	res.render("admin/login", {
		content: renderWithProps(LoginView, props)
		user: req.user
		})

renderDashboard = (req, res)->
	props = {
		username: req.user.username
	}
	res.render("admin/dashboard", {
		content: renderWithProps(DashboardView, props)
		user: req.user
		})

renderRegister = (req, res)->
	props = {
		title: "register"
		action: "/admin/register"
	}
	res.render("admin/login", {
		content: renderWithProps(LoginView, props)
		user: req.user
		})


# Edit

Stack = mongoose.model("Application")
Product = mongoose.model("Product")

_getItems = (model)->
	def = Q.defer()
	model.find({}).lean().exec (err, docs)->
		if err then return def.reject(err)
		return def.resolve(docs)
	return def.promise


renderEdit = (req, res)->
	section = req.params.section
	# get section data
	# load section data into props
	m = null
	switch section
		when "products" then m = Product
		when "stack" then m = Stack
		else
			log.error new Error("could not parse section " + section)
	_getItems(m)
	.then(
		(items)->
			log.info {items:items}, "items loaded"
			props = {
				username: req.user.username
				section: section
				items: items
			}
			res.render("admin/dashboard", {
				content: renderWithProps(EditView, props)
				user: req.user
				})
		(reason)->
			log.error {err:reason}, "load items failed"
	)







# Data Routes
# -----------------------------------------
register = (req, res, next)->
	body = req.body
	log.info body:body, "register"
	_b = _.omit(body, ["password"])
	_a = new Account(_b)
	log.info base:_b, pass:req.body.password, "user begin"
	Account.register(_a, req.body.password, (err)->
		if err
			log.error {err}, "register error"
			return next(err)
		log.info {user:_b}, "successful register"
		next()
		)

isLoggedIn = (req, res, next)->
	if !req.user
		log.warn {user: req.user}, "no user logged in!"
		return res.redirect("/admin/login")
	else
		next()

logout = (req, res)->
	req.logout()
	res.redirect("/admin/login")



module.exports = {
	renderLogin
	renderDashboard
	renderRegister
	register
	isLoggedIn
	logout
	renderEdit
}