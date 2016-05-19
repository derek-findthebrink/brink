try
	log = appLogger.child({
		type: "analytics"
		file: "sitemap"
	})
catch
	log = console
	log.info = console.log

class URL
	constructor: (url, @changeFreq, @priority)->
		@url = "https://findthebrink.com" + url
		@changeFreq = @changeFreq || "weekly"
		@priority = @priority || 0.5
		@mobile = true

sm = require("sitemap")
sitemap = sm.createSitemap({
	hostname: "https://findthebrink.com"
	cacheTimeout: 60 * 1000
	urls: [
		new URL("/")
		new URL("/products-and-services", "weekly", 1)
		new URL("/products-and-services/packages", "weekly", 1)
		new URL("/products-and-services/websites", "weekly", 1)
		new URL("/products-and-services/email", "weekly", 1)
		new URL("/products-and-services/graphics", "weekly", 1)
		new URL("/products-and-services/apps", "weekly", 1)
		new URL("/portfolio")
		new URL("/about")
		new URL("/stack")
		new URL("/contact")
		new URL("/donate")
	]
	})

log.info sitemap:sitemap, "sitemap"

getSitemap = (req, res)->
	sitemap.toXML (err, xml)->
		if err
			return res.status(500).end()
		res.header("Content-Type", "application/xml")
		res.send(xml)

module.exports = getSitemap