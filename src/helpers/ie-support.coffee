test = (req)->
	if req
		ua = req.headers["user-agent"]
	else
		ua = window.navigator.userAgent
	msie = ua.indexOf("MSIE ")
	console.log ua, msie

	if (msie > 0 || !!ua.match(/Trident.*rv\:11\./))
		# it's MSIE, now do something
		# perhaps figure out version
		# alert(parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))))
		return true
	else
		return false

module.exports = {
	test
}