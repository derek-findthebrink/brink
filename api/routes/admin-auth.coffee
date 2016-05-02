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



go = (passport)->
	app = express.Router()
	
	app.post("/login", passport.authenticate("local", {failureRedirect: "/login"}), (req, res)->
		log.info user:req.user, "is logged in now"
		res.redirect("/admin")
		)

	app.get("/logout", (req, res)->
		req.logout()
		res.redirect("/login")
		)

	app.get("/auth", (req, res)->
		log.info "auth route checked"
		user = req.user
		if user
			return res.json(req.user).end()
		else
			return res.json(false).end()
		)


	return app


module.exports = go