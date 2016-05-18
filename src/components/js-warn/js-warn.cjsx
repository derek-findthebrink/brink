React = require("react")
$ = require("jquery")
{SimpleButton} = require("../buttons/buttons.cjsx")
{Link} = require("react-router")
cookies = require("browser-cookies")
uuid = require("uuid")

cookiesAcceptName = "bt-ap1-cookie_accept"


CookieWarn = React.createClass({
	setCookie: ->
		opts = {
			expires: 365
			domain: ""
			secure: false
			httponly: false
		}
		cookies.set(cookiesAcceptName, uuid.v4(), opts)
		@hide()
	hide: ->
		styles = require("./js-warn.sass")
		$("." + styles.cookieWarn).hide()
	componentDidMount: ->
		test = !!cookies.get(cookiesAcceptName)
		if test
			@hide()
	render: ->
		styles = require("./js-warn.sass")
		<div className={styles.cookieWarn}>
			<div className={styles.description}>
				<p>
					This site uses cookies to give you a better experience. <Link to="/privacy-policy">Learn More</Link> 
				</p>
			</div>
			<div className={styles.menu}>
				<SimpleButton onClick={@setCookie} title="Got it!" type="go" />
			</div>
		</div>
	})

JSWarn = React.createClass({
	componentDidMount: ->
		styles = require("./js-warn.sass")
		$("." + styles.jsWarn).hide()
	render: ->
		styles = require("./js-warn.sass")
		text = "You have javascript disabled on this page. For the best experience, please
				enable javascript and reload this page."
		# if  __CLIENT__
		# 	version = app.IEVersion
		# 	if version
		# 		console.log "IE Version:", version
		# 		IE = "You are using Internet Exporer " + version + ", this site 
		# 		uses technology that is incompatible with this browser. Sorry about this, we're working on correcting this."
		# else
		# 	IE = null
		<div className={styles.jsWarn}>
			<p>{text}</p>
		</div>
	})

module.exports = {
	JSWarn
	CookieWarn
}