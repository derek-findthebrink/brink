base = {
	description: "javascript design firm based in Vancouver, Canada specializing in providing high-quality, universal javascript web solutions to your business needs"
	creator: "@findthebrink"
	themeColor: "#40526B"
}

class Icon
	constructor: (type, size, href)->
		@sizes = [String(size), "x", String(size)].join("")
		if type == "apple"
			@rel = "apple-touch-icon"
			@href = ["/apple-icon-", @sizes, ".png"].join("")
		else
			@rel = "icon"
			@type = "image/png"
			@href = ["/", href, "-", @sizes, ".png"].join("")

config = {
	app:
		title: "Brink Technology Co."
		description: "ambitious javascript design"
		head:
			titleTemplate: "%s | brink technology co."
			defaultTitle: "ambitious javascript design"
			htmlAttributes: {"lang": "en"}
			meta: [
				{charset: "utf-8"}
				{name: "description", content: base.description}
				{name: "viewport", content: "width=device-width, initial-scale=1"}
				{property: "og:site_name", content: "Brink Technology Co."}
				{property: "og:image", content: "https://findthebrink.com/brink-logo-small.svg"}
				{property: "og:locale", content: "en_GB"}
				{property: "og:title", content: "Brink Technology Co."}
				{property: "og:description", content: base.description}
				{property: "og:card", content: "summary"}
				{property: "og:site", content: base.creator}
				{property: "og:creator", content: base.creator}
				{property: "og:image:width", content: "200"}
				{property: "og:image:height", content: "200"}
				{property: "msapplication-TileColor", content: base.themeColor}
				{property: "msapplication-TileImage", content: "/ms-icon-144x144.png"}
				{property: "theme-color", content: base.themeColor}
			]
		link: [
			# icons
			new Icon("apple", 57)
			new Icon("apple", 60)
			new Icon("apple", 72)
			new Icon("apple", 76)
			new Icon("apple", 114)
			new Icon("apple", 120)
			new Icon("apple", 144)
			new Icon("apple", 152)
			new Icon("apple", 180)
			new Icon("icon", 192, "android-icon")
			new Icon("icon", 32, "favicon")
			new Icon("icon", 96, "favicon")
			new Icon("icon", 16, "favicon")
			{rel: "manifest", href: "/manifest.json"}
		]
}

module.exports = config