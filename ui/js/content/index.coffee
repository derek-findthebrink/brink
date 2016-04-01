{Main, pages} = require("../views/_base")
Stack = pages.Stack
Products = pages.Products

class ImgCreator
	constructor: (@img, @alt, @description)->
		return this

Home = {
	view: Main
	props:
		header:
			title: "home"
			description: "derp nerp slerp"
}

Portfolio = {
	view: Main
	props:
		header:
			title: "portfolio"
			description: "some of our best work"
}

Stack = {
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
}

Products = {
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
				description: "everything you need to get your company online."
				category: "packages"
				product: "startup-package"
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_brand.svg"
							"brand input"
							"survey")
						new ImgCreator(
							"/icons/brink-icons_brand.svg"
							"brand input"
							"business requirements")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_uptime.svg"
							"brand input"
							"one week")
					]
					result: "a great looking website with
					synchronized branding and emails to boot"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"brand input"
							"website")
						new ImgCreator(
							"/icons/brink-icons_email.svg"
							"brand input"
							"two email accounts")
						new ImgCreator(
							"/icons/brink-icons_business\ cards.svg"
							"brand input"
							"brand design")
					]
					callout: [
						new ImgCreator(
							"/icons/brink-icons_brand.svg")
					]
			}
		]
		websites: [
			{
				title: "basic design"
				description: "want a website? We'll design it, test it and
				get it running on the web within 5 days."
				category: "websites"
				product: "basic"
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
			{
				title: "domains"
				description: "purchase and manage your domain names"
				category: "websites"
				product: "domain"
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
		]
		email: [
			{
				title: "small business email"
				description: "email solutions for your small business. Grow your
				business with a professional email for your contacts."
				category: "email"
				product: "small-business"
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
			{
				title: "personal email"
				description: "personal email solutions. Can't get the email you want
				on Gmail? We've got you covered."
				category: "email"
				product: "personal"
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
		]
		graphics: [
			{
				title: "iconography"
				description: "custom iconography for your print and web projects"
				category: "graphics"
				product: "iconography"
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
			{
				title: "site layouts"
				description: "speed up your website development. We'll create custom
				wireframes based on your business needs and the latest web-standards."
				category: "graphics"
				product: "site-layouts"
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
		]
		apps: [
			{
				title: "basic app"
				description: "need more than just a website? Data-driven web applications
				are the future of the internet. We'll get you started."
				category: "apps"
				product: "basic"
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
			{
				title: "custom component development"
				description: "already have an app but need new features?
				We've got you covered."
				category: "apps"
				product: "custom-component"
				learnData:
					inputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"herp")
					]
					process: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]
					result: "hi there!"
					outputs: [
						new ImgCreator(
							"/icons/brink-icons_computer.svg"
							"computer"
							"a computer")
					]

					callout: []
			}
		]
}



Contact = {
	view: Main
	props:
		header:
			title: "contact"
			description: "how to get in touch with us"
}

module.exports = {
	Home
	Portfolio
	Stack
	Products
	Contact
}