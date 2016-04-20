bunyan = require("bunyan")
log = bunyan.createLogger({
	name: "scratch-pad"
	})

x = require("../assets/home.generated.js")
log.info home:x, "home generated"
console.log "home:", x