React = require("react")
ReactDOM = require("react-dom")
$ = require("jquery")
_ = require("lodash")

{content, pages} = require("../views/_base")
Header = content.ContentHeader
Stack = pages.Stack
Products = pages.Products

ui = $(".content")[0]

_c = {
	home:
		props:
			title: "home"
			description: "derp nerp slerp"
		view: Header
	portfolio:
		props:
			title: "portfolio"
			description: "some of our best work"
		view: Header
	stack:
		props:
			header:
				title: "stack"
				description: "what we use and why we like to use it"
			list: [
				{
					title: "node.js"
					img:
						src: "http://johanndutoit.net/presentations/2013/02/gdg-capetown-nodejs-workshop-23-feb-2013/images/nodejs_logo.png"
						alt: "node.js logo"
						href: "https://nodejs.org/en/"
					description: "a super cool javascript-based server platform"
				}
				{
					title: "MongoDB"
					img:
						src: "http://s3.amazonaws.com/info-mongodb-com/_com_assets/media/mongodb-logo-rgb.jpeg"
						alt: "MongoDB logo"
						href: "https://www.mongodb.org/"
					description: "a super cool key-value store"
				}
				{
					title: "ReactJS"
					img:
						src: "http://www.programwitherik.com/content/images/2015/12/reactjs.png"
						alt: "ReactJS Logo"
						href: "https://facebook.github.io/react/"
					description: "a high-performance javascript rendering library"
				}
			]
		view: Stack
	products:
		props:
			header:
				title: "products & services"
				description: "what we would like to do for you"
			menu: [
				{
					title: "packages"
					link: "#"
				}
				{
					title: "websites"
					link: "#"
				}
				{
					title: "email"
					link: "#"
				}
				{
					title: "graphics"
					link: "#"
				}
				{
					title: "apps"
					link: "#"
				}

			]
		view: Products
	contact:
		props:
			title: "contact"
			description: "how to get in touch with us"
		view: Header
}

_contentMatch = (payload)->
	return _c[payload.page]

renderContent = (payload)->
	c = _contentMatch(payload)
	props = c.props
	view = c.view
	v = React.createElement(view, props)
	ReactDOM.render(v, ui)


module.exports = renderContent