module.exports = (app, passport, Account)->
	app.use passport.initialize()
	app.use passport.session()

	passport.use(Account.createStrategy())
	passport.serializeUser(Account.serializeUser())
	passport.deserializeUser(Account.deserializeUser())
	