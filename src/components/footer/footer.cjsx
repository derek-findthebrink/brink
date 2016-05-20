React = require("react")

{Link} = require("react-router")


Footer = React.createClass({
	render: ->
		styles = require("./refills_footer.scss")
		year = new Date().getFullYear()
		<footer className={styles.container} role="contentinfo">
			<div className={styles.logo}>
				<img src="/brink-logo-small.svg" alt="Logo image" />
			</div>
			<div className={styles.linksContainer}>
				<ul className={styles.linkList}>
					<li><h3>Follow Us</h3></li>
					<li><a target="_blank" href="https://www.facebook.com/findthebrink/">Facebook</a></li>
					<li><a target="_blank" href="https://twitter.com/findthebrink">Twitter</a></li>
				</ul>
				<ul className={styles.linkList}>
					<li><h3>Content</h3></li>
					<li><Link to="/about">About</Link></li>
					<li><Link to="/contact">Contact</Link></li>
					<li><Link to="/products-and-services">Products</Link></li>
					<li><Link to="/sitemap">Site Map</Link></li>
				</ul>
				<ul className={styles.linkList}>
					<li><h3>Legal</h3></li>
					<li><Link to="/terms-and-conditions">Terms and Conditions</Link></li>
					<li><Link to="/privacy-policy">Privacy Policy</Link></li>
				</ul>
			</div>
			<hr />
			<p>&copy; {year} Brink Technology Co. All Rights Reserved.</p>
		</footer>
	})

module.exports = Footer