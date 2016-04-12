express = require("express")

passport = require("passport")


try
	log = appLogger.child({
		type: "route"
		file: "admin"
	})
catch
	log = console
	log.info = console.log


{
	renderLogin
	renderDashboard
	renderRegister
	register
	isLoggedIn
	logout
	renderEdit
} = require("../controllers/admin")

# routes
# -------------------------
admin = express.Router()

admin.get("/login", renderLogin)
admin.get("/register", renderRegister)

admin.get("/", isLoggedIn, renderDashboard)


admin.post("/login", passport.authenticate("local"), (req, res)->
	res.redirect("/admin")
	)
admin.post("/register", register, passport.authenticate("local"), (req, res)->
	res.redirect("/admin")
	)
admin.get("/logout", logout)



# Editing
# --------------------------
admin.get("/edit/:section", renderEdit)


# exports
# ---------------------------
module.exports = admin