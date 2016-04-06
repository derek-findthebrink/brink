express = require("express")
admin = express.Router()

# helpers
# ------------------------
login = (req, res)->
	res.render("admin/login")

renderDashboard = (req, res)->
	res.render("admin/dashboard", {
		mnt: "/admin"
		})

# routes
# -------------------------
admin.get("/login", login)
admin.get("/", renderDashboard)


# exports
# ---------------------------
module.exports = admin