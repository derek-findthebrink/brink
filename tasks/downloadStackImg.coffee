_ = require("lodash")
request = require("request")
nodepath = require("path")
async = require("async")
fs = require("fs")

content = require("../ui/js/content/index")


# Target = stack images
stack = content.Stack
imgs = []
combined = _.concat(stack.props.list, stack.props.secondaryList)

# extract image source from each and add to array
_.map combined, (x)->
	y = {
		title: x.title
		src: x.img.src
	}
	imgs.push(y)

download = (obj, cb)->
	uri = obj.src
	folder = nodepath.join(process.cwd(), "assets/stack")
	console.log folder
	request.head(uri, (err, res, body)->
		console.log "content-type", res.headers["content-type"]
		switch res.headers["content-type"]
			when "image/png" then type = "png"
			when "image/svg+xml" then type = "svg"
			when "image/jpeg" then type = "jpeg"
		# console.log type:type
		file = nodepath.join folder, [_.toLower(obj.title), type].join(".")
		console.log file:file
		request(uri).pipe(fs.createWriteStream(file)).on("close", cb)
		)

async.map imgs, download, (err)->
	if err
		throw err
	console.log "done!"