React = require("react")

Cookie = React.createClass({
	render: ->
		styles = require("./cookie-warn.sass")
		<div className={styles.container}>
			<p>This site uses cookies to track all of your sexy movements. Here at Brink,
			we love sexy movements.</p>
			<button>I accept</button>
			<button>Do Not Track</button>
		</div>
	})

module.exports = Cookie