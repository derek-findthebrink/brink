express = require("express")
webpack = require("webpack")

log = require("bunyan").createLogger({
	name: "webpack-dev-server"
	})

webpackConfig = require("./dev.config.coffee")
compiler = webpack(webpackConfig)

host = process.env.HOST || "localhost"
port = (Number(process.env.PORT) + 1) || 3001
serverOptions = {
	contentBase: "http://" + host + ":" + port
	quiet: true
	noInfo: true
	hot: true
	inline: true
	lazy: false
	publicPath: webpackConfig.output.publicPath
	headers: {"Access-Control-Allow-Origin": "*"}
	stats:
		colors: true
}

app = new express()
app.use(require("webpack-dev-middleware")(compiler, serverOptions))
app.use(require("webpack-hot-middleware")(compiler))

app.listen(port, (err)->
	if err
		log.error err:err, "webpack dev server error"
	else
		log.info "\n\n==> Webpack dev server listening on port:" + port + "\n\n"
	)