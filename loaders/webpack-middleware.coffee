webpack = require("webpack")
webpackMiddleware = require("webpack-dev-middleware")
webpackHotMiddleware = require("webpack-hot-middleware")
webpackConfig = require("../dev.config.coffee")

module.exports = (app)->
	compiler = webpack(webpackConfig)
	app.use(webpackMiddleware(compiler, {
		noInfo: true
		publicPath: webpackConfig.output.publicPath
		}))
	app.use(webpackHotMiddleware(compiler))
