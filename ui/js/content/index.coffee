{Main, pages} = require("../views/_base")
Stack = pages.Stack
Products = pages.Products

_learn = require("./learn")

_c = {
	home:
		view: Main
		props:
			header:
				title: "home"
				description: "derp nerp slerp"

	portfolio:
		view: Main
		props:
			header:
				title: "portfolio"
				description: "some of our best work"

	stack:
		view: Stack
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

	products:
		view: Products
		props:
			header:
				title: "products & services"
				description: "what we would like to do for you"
			menu: [
				{
					title: "packages"
					link: "/products-and-services"
				}
				{
					title: "websites"
					link: "/products-and-services/websites"
				}
				{
					title: "email"
					link: "/products-and-services/email"
				}
				{
					title: "graphics"
					link: "/products-and-services/graphics"
				}
				{
					title: "apps"
					link: "/products-and-services/apps"
				}
			]

			packages: [
				{
					title: "startup package"
					description: "everything you need to get your organization running."
					category: "package"
					product: "startup-package"
					learn: "/products-and-services/package/startup-package"
				}
			]
			websites: [
				{
					title: "basic design"
					description: "want a website? We'll design it, test it and
					get it running on the web within 5 days."
					category: "website"
					product: "basic"
					learn: "/products-and-services/websites/basic"
				}
				{
					title: "domains"
					description: "purchase and manage your domain names"
					category: "website"
					product: "domain"
					learn: "/products-and-services/websites/domains"
				}
			]
			email: [
				{
					title: "small business email"
					description: "email solutions for your small business. Grow your
					business with a professional email for your contacts."
					category: "email"
					product: "small-business"
					learn: "/products-and-services/email/small-business"
				}
				{
					title: "personal email"
					description: "personal email solutions. Can't get the email you want
					on Gmail? We've got you covered."
					category: "email"
					product: "personal"
					learn: "/products-and-services/email/personal"
				}
			]
			graphics: [
				{
					title: "iconography"
					description: "custom iconography for your print and web projects"
					category: "graphics"
					product: "iconography"
					learn: "/products-and-services/graphics/iconography"
				}
				{
					title: "site layouts"
					description: "speed up your website development. We'll create custom
					wireframes based on your business needs and the latest web-standards."
					category: "graphics"
					product: "site-layouts"
					learn: "/products-and-services/graphics/site-layouts"
				}
			]
			apps: [
				{
					title: "basic app"
					description: "need more than just a website? Data-driven web applications
					are the future of the internet. We'll get you started."
					category: "app"
					product: "basic"
					learn: "/products-and-services/apps/basic"
				}
				{
					title: "custom component development"
					description: "already have your app running but need a new feature?
					We've got you covered."
					category: "app"
					product: "custom-component"
					learn: "/products-and-services/apps/components"
				}
			]




	contact:
		view: Main
		props:
			header:
				title: "contact"
				description: "how to get in touch with us"

	learn: _learn
}

module.exports = _c