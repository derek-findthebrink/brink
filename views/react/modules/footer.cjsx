React = require("react")

{Link} = require("react-router")

styles = require("vendor/refills_footer.scss")

Footer = React.createClass({
	render: ->
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
					<li><a href="javascript:void(0)">About</a></li>
					<li><Link to="/contact">Contact</Link></li>
					<li><Link to="/products-and-services">Products</Link></li>
				</ul>
				<ul className={styles.linkList}>
					<li><h3>Legal</h3></li>
					<li><a href="javascript:void(0)">Terms and Conditions</a></li>
					<li><a href="javascript:void(0)">Privacy Policy</a></li>
				</ul>
			</div>
			<hr />
			<p>Disclaimer area lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum, nostrum repudiandae saepe.</p>
		</footer>
	})

module.exports = Footer