React = require("react")

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
					<li><a href="javascript:void(0)">Facebook</a></li>
					<li><a href="javascript:void(0)">Twitter</a></li>
					<li><a href="javascript:void(0)">YouTube</a></li>
				</ul>
				<ul className={styles.linkList}>
					<li><h3>Content</h3></li>
					<li><a href="javascript:void(0)">About</a></li>
					<li><a href="javascript:void(0)">Contact</a></li>
					<li><a href="javascript:void(0)">Products</a></li>
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