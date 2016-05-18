test = (req)->
	if req
		ua = req.headers["user-agent"]
	else
		ua = window.navigator.userAgent
	msie = ua && ua.indexOf("MSIE ")

	if (msie > 0 || !!ua.match(/Trident.*rv\:11\./))
		# it's MSIE, now do something
		# perhaps figure out version
		# alert(parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))))
		if __DEVELOPMENT__
			version = parseInt(ua.substring(msie + 5, ua.indexOf(".", msie)))
			console.log "MSIE", version, {UserAgent: ua}
		return true
	else
		return false

getVersion = (req)->
	if req
		ua = req.headers["user-agent"]
	else
		ua = window.navigator.userAgent
	msie = ua && ua.indexOf("MSIE ")
	if (msie > 0 || !!ua.match(/Trident.*resolve\:11\./))
		version = parseInt(ua.substring(msie + 5, ua.indexOf(".", msie)))
		return version
	return false

module.exports = {
	test
	getVersion
}