# require("dotenv").config()
nodepath = require("path")
webpack = require("webpack")

ROOT = nodepath.resolve(process.env.APP_ROOT)

autoprefixer = require("autoprefixer")
ExtractTextPlugin = require("extract-text-webpack-plugin")
_webpackIsomorphicToolsPlugin = require("webpack-isomorphic-tools/plugin")
webpackIsomorphicToolsPlugin = new _webpackIsomorphicToolsPlugin(require("./iso-config.coffee"))

# Plugins
# -----------------------------------
plugins = [
	new ExtractTextPlugin("[name]-[chunkhash].css", {
		allChunks: true
		})
	# new webpack.NoErrorsPlugin()
	webpackIsomorphicToolsPlugin
	new webpack.DefinePlugin({
		__CLIENT__: true
		__SERVER__: false
		__DEVELOPMENT__: false
		__DEVTOOLS__: false
		})
]

# Entry Points
# --------------------------------------------
app_entry = nodepath.resolve(ROOT, "src/client-app.cjsx")
admin_entry = nodepath.resolve(ROOT, "src/admin-app.cjsx")

# Loaders
# ------------------------------
_loaders = [
	{
		test: /\.coffee$/
		loaders: ["coffee"]
	}
]


# App
# ---------------------------------------------------------
__style_pipe = "style"
__css_pipe = "css?modules&importLoaders=2&sourceMap"
__w_sass = __css_pipe + "!sass?outputStyle=expanded&sourceMap=true&sourceMapContents=true"

_sass = {
	test: /\.sass$/
	loader: ExtractTextPlugin.extract(__style_pipe, __w_sass)
	# loaders: [
	# 	__style_pipe
	# 	__css_pipe
	# 	"sass"
	# ]
}
_scss = {
	test: /\.scss$/
	loader: ExtractTextPlugin.extract(__style_pipe, __w_sass)
	# loaders: [
	# 	__style_pipe
	# 	__css_pipe
	# 	"sass"
	# ]
}
_css = {
	test: /\.css$/
	loader: ExtractTextPlugin.extract(__style_pipe, __css_pipe)
	# loaders: [
	# 	__style_pipe
	# 	"css?sourceMap"
	# ]
}
_cjsx = {
	test: /\.cjsx$/
	loaders: ["coffee", "cjsx"]
}
_json = {
	test: /\.json$/
	loader: "json-loader"
}



# Final
# --------------------------------------
module.exports = {
	name: "production-build"
	entry: 
		app: app_entry
		admin: admin_entry
	# target: "node"
	context: ROOT
	plugins: plugins
	devtool: "source-map"
	resolveLoader:
		modulesDirectories: ["node_modules"]
		# extensions: ["", ".webpack-loader.js", ".web-loader.js", ".loader.js", ".js"],
		# root: [nodepath.resolve("."), nodepath.resolve("./loaders")]
	resolve:
		extensions: ["", ".js", ".coffee", ".cjsx", ".sass", ".scss", ".css"]
		root: ROOT
		modulesDirectories: ["node_modules", "assets/public/lib", "src"]
	output:
		path: nodepath.resolve(ROOT, "assets/public")
		filename: "[name].generated.js"
		chunkFilename: "[name]-[chunkhash].js"
		publicPath: "/"
		# libraryTarget: "commonjs2"
	# externals: /^[a-z\-0-9]+$/
	module:
		loaders: _loaders.concat([
			_css
			_sass
			_scss
			_cjsx
			_json
			])
}