express = require("express")

React = require("react")
ReactServer = require("react-dom/server")
mongoose = require("mongoose")
passport = require("passport")
_ = require("lodash")

nodepath = require("path")


try
	log = appLogger.child({
		type: "route"
		file: "admin"
	})
catch
	log = console
	log.info = console.log


# Views
# -------------------------





# Database
# --------------------------
log.info {models: mongoose.modelNames()}, "loaded models"
Account = mongoose.model("Account")




# View Controllers
# ------------------------
_viewsDir = nodepath.join(process.cwd(), "ui/js/views/")

LoginView = require(_viewsDir + "login")
DashboardView = require(_viewsDir + "adminDashboard")

renderWithProps = (view, props)->
	_props = props || {}
	_v = React.createElement(view, _props)
	_html = ReactServer.renderToString(_v)
	return _html

renderLogin = (req, res)->
	props = {
		title: "login"
		action: "/admin/login"
	}
	res.render("admin/login", {
		content: renderWithProps(LoginView, props)
		})

renderDashboard = (req, res)->
	props = {
		username: req.user.username
	}
	res.render("admin/dashboard", {
		content: renderWithProps(DashboardView, props)
		})

renderRegister = (req, res)->
	props = {
		title: "register"
		action: "/admin/register"
	}
	res.render("admin/login", {
		content: renderWithProps(LoginView, props)
		})





# Data Controllers
# ---------------------------
login = (req, res, next)->
	body = req.body
	log.info body:body, "login"

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
	log.info user: req.user, "user"
	if !req.user
		log.warn {user: req.user}, "no user logged in!"
		return res.redirect("/admin/login")
	else
		next()

logout = (req, res)->
	req.logout()
	res.redirect("/admin/login")




# routes
# -------------------------
admin = express.Router()

admin.get("/login", renderLogin)
admin.get("/", isLoggedIn, renderDashboard)
admin.get("/register", renderRegister)

admin.get("/logout", logout)

admin.post("/login", passport.authenticate("local"), (req, res)->
	res.redirect("/admin")
	)
admin.post("/register", register, passport.authenticate("local"), (req, res)->
	res.redirect("/admin")
	)


# exports
# ---------------------------
module.exports = admin