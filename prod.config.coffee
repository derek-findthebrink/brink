nodepath = require("path")
webpack = require("webpack")

autoprefixer = require("autoprefixer")
ExtractTextPlugin = require("extract-text-webpack-plugin")

# Plugins
# -----------------------------------
_serverPlugins = [
	new ExtractTextPlugin("public/css/[name].css", {
		allChunks: true
		})
	new webpack.NoErrorsPlugin()
]




# Entry Points
# --------------------------------------------
# _entryViews = "./views/react/index.cjsx"
view_dir = nodepath.resolve(".", "views/react")
app_entry = nodepath.resolve(".", "ui/js/app/index.coffee")

_entries = {
	home: nodepath.join(view_dir, "home.cjsx")
	portfolio: nodepath.join(view_dir, "portfolio.cjsx")
	stack: nodepath.join(view_dir, "stack.cjsx")
	product: nodepath.join(view_dir, "product.cjsx")
	contact: nodepath.join(view_dir, "contact.cjsx")
	app: nodepath.join(view_dir, "app.cjsx")
	about: nodepath.join(view_dir, "about.cjsx")
}

# Loaders
# ------------------------------
_loaders = [
	{
		test: /\.coffee$/
		loaders: ["coffee"]
	}
]


# SERVER
# ---------------------------------------------------------
# my cool loader
# _myCoolServerCssLoader = nodepath.join(__dirname, "loaders", "style-collector")
__css_server_pipe = "css?sourceMap&modules&importLoaders=1&localIdentName=[name]___[local]__[hash:base64:5]"
__w_sass = __css_server_pipe + "!sass"
__style_server_pipe = "style"

_sassLoaderServer = {
	test: /\.sass$/
	loader: ExtractTextPlugin.extract(__style_server_pipe, __w_sass)
	# loaders: [
	# 	__style_server_pipe
	# 	__css_server_pipe
	# 	"sass"
	# ]
}
_scssLoaderServer = {
	test: /\.scss$/
	loader: ExtractTextPlugin.extract(__style_server_pipe, __w_sass)
	# loaders: [
	# 	__style_server_pipe
	# 	__css_server_pipe
	# 	"sass"
	# ]
}
_cssLoaderServer = {
	test: /\.css$/
	loader: ExtractTextPlugin.extract(__style_server_pipe, __css_server_pipe)
	# loaders: [
	# 	__style_server_pipe
	# 	"css?sourceMap"
	# ]
}
_cjsxLoaderServer = {
	test: /\.cjsx$/
	loaders: ["coffee", "cjsx"]
}



# Final
# --------------------------------------
# Server
serverViews = {
	name: "server-side-views-package"
	entry: _entries
	target: "node"
	context: __dirname
	plugins: _serverPlugins
	resolveLoader:
		modulesDirectories: ["node_modules", "loaders"]
		extensions: ["", ".webpack-loader.js", ".web-loader.js", ".loader.js", ".js"],
		root: [nodepath.resolve("."), nodepath.resolve("./loaders")]
	resolve:
		extensions: ["", ".js", ".coffee", ".cjsx", ".sass", ".scss", ".css"]
		root: [nodepath.resolve(".")]
		modulesDirectories: ["node_modules", "ui/css", "assets/lib", "views/react"]
	output:
		path: nodepath.resolve(process.cwd(), "assets")
		filename: "[name].generated.js"
		publicPath: "/"
		libraryTarget: "commonjs2"
	externals: /^[a-z\-0-9]+$/
	module:
		loaders: _loaders.concat([_cssLoaderServer, _sassLoaderServer, _scssLoaderServer, _cjsxLoaderServer])
}

module.exports = serverViews
