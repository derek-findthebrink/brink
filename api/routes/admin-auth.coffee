express = require("express")
_ = require("lodash")

try
	log = appLogger.child({
		type: "routes"
		file: "admin-auth"
	})
catch
	log = console
	log.info = console.log

sanitize = require("../services/sanitize").login



go = (passport)->
	app = express.Router()

	app.post("/login", sanitize, passport.authenticate("local", {failureRedirect: "/login"}), (req, res)->
		# log.info user:req.user, "is logged in now"
		res.redirect("/admin")
		)

	app.get("/logout", (req, res)->
		req.logout()
		res.redirect("/login")
		)


	return app


module.exports = go