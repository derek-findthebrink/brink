React = require("react")
{render} = require("react-dom")
{Router, Route, Link, browserHistory, IndexRoute, Redirect} = require("react-router")
$ = require("jquery")

content = require("content/index")

container = $(".app-container")[0]

App = React.createClass({
	getInitialState: ->
		return {content}
	componentDidMount: ->
		# $(".app-nav-main").slicknav({
		# 	closeOnClick: true
		# 	label: ""
		# 	brand: "<a href=\"/\">brink technology co.</a>"
		# 	init: ->
		# 		$("nav.app-nav-main, header.header-main").hide()
		# 	})
	render: ->
		<div className="app-container">
			<header className="header-main">
				<Link to="/">
					<h1>brink technology co.</h1>
				</Link>
			</header>
			<nav className="app-nav-main">
				<ul>
					<li><Link to="/portfolio">portfolio</Link></li>
					<li><Link to="/stack">stack</Link></li>
					<li><Link to="/products-and-services">products</Link></li>
					<li><Link to="/contact">contact</Link></li>
				</ul>
			</nav>
			<main>
				{@props.children}
			</main>
			<script src="/vendor.bundle.js"></script>
			<script src="/app.js"></script>
		</div>
	})

Home = require("home.cjsx")
Portfolio = require("portfolio.cjsx")
Contact = require("contact.cjsx")
Stack = require("stack.cjsx")
Product = require("product.cjsx")

header = {
	title: "herp"
	description: "derp"
}
render(
	<Router history={browserHistory}>
		<Route path="/" component={App}>
			<IndexRoute component={Home} />
			<Route path="/portfolio" component={Portfolio} />
			<Route path="/contact" component={Contact} />
			<Route path="/stack" component={Stack} />
			<Route path="/products-and-services" component={Product} />
		</Route>
	</Router>
	container
	)
