class ImgCreator
	constructor: (@img, @alt, @description)->
		return this

Home = {
	header:
		title: "ambitious javascript design"
		description: "cutting-edge web design"
	carousel:
		[
			{
				img:
					src: "http://gamingbolt.com/wp-content/uploads/2012/03/datacore3.jpg"
					alt: "dude with head getting weird"
				title: "we make cool shit"
				description: "seriously..."
				href: "/products-and-services/"
			}
			{
				img:
					src: "http://gamingbolt.com/wp-content/uploads/2012/03/datacore3.jpg"
					alt: "dude with head getting weird"
				title: "we make cool shit"
				description: "seriously..."
				href: "/products-and-services/"
			}
			{
				img:
					src: "http://gamingbolt.com/wp-content/uploads/2012/03/datacore3.jpg"
					alt: "dude with head getting weird"
				title: "we make cool shit"
				description: "seriously..."
				href: "/products-and-services/"
			}
			{
				img:
					src: "http://gamingbolt.com/wp-content/uploads/2012/03/datacore3.jpg"
					alt: "dude with head getting weird"
				title: "we make cool shit"
				description: "seriously..."
				href: "/products-and-services/"
			}
			{
				img:
					src: "http://gamingbolt.com/wp-content/uploads/2012/03/datacore3.jpg"
					alt: "dude with head getting weird"
				title: "we make cool shit"
				description: "seriously..."
				href: "/products-and-services/"
			}
		]
}

About = {
	header:
		title: "about"
		description: "what makes us tick"
}

Portfolio = {
	header:
		title: "portfolio"
		description: "some of our best work"
}

Stack = {
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
			description: "
				Our specialty: the latest and greatest arrival on the web scene. Based on javascript, an event-driven
				server engine that turned Universal Code from an idea into a reality.
			"
			secondary: false
		}
		{
			title: "MongoDB"
			img:
				src: "http://s3.amazonaws.com/info-mongodb-com/_com_assets/media/mongodb-logo-rgb.jpeg"
				alt: "MongoDB logo"
				href: "https://www.mongodb.org/"
			description: "
				About as fast as they get. A database engine that natively speaks javascript and delivers results ridiculously fast. Our
				go-to when it comes to new builds. 
			"
			secondary: false
		}
		{
			title: "ReactJS"
			img:
				src: "http://red-badger.com/blog/wp-content/uploads/2015/04/react-logo-1000-transparent.png"
				alt: "ReactJS Logo"
				href: "https://facebook.github.io/react/"
			description: "
				The latest and greatest website rendering library. Enables us to create beautiful webpages that
				are easily maintainable while remaining compatible with the rest of the web as older computers
				slowly catch up.
			"
			secondary: false
		}
		{
			title: "Sass"
			img:
				src: "http://sass-lang.com/assets/img/logos/logo-b6e1ef6e.svg"
				alt: ""
				href: "http://sass-lang.com"
			description: ""
			secondary: true
		}
		{
			title: "npm"
			img:
				src: "https://www.npmjs.com/static/images/npm-logo.svg"
				alt: ""
				href: "https://npmjs.com"
			description: ""
			secondary: true
		}
		{
			title: "bower"
			img:
				src: "http://bower.io/img/bower-logo.png"
				alt: ""
				href: "http://bower.io"
			description: ""
			secondary: true
		}
		{
			title: "grunt"
			img:
				src: "https://camo.githubusercontent.com/39242419c60a53e1f3cecdeecb2460acce47366f/687474703a2f2f6772756e746a732e636f6d2f696d672f6772756e742d6c6f676f2d6e6f2d776f72646d61726b2e737667"
				alt: ""
				href: "http://gruntjs.com"
			description: ""
			secondary: true
		}
		{
			title: "browser-sync"
			img:
				src: "https://www.browsersync.io/brand-assets/logo-red.png"
				alt: ""
				href: "https://www.browsersync.io/"
			description: ""
			secondary: true
		}
		{
			title: "jade"
			img:
				src: "https://avatars0.githubusercontent.com/u/9338635?v=3&s=400"
				alt: ""
				href: "http://jade-lang.com"
			description: ""
			secondary: true
		}
		{
			title: "browserify"
			img:
				src: "https://pbs.twimg.com/profile_images/420347030263701504/9esmqty2_400x400.png"
				alt: ""
				href: "http://browserify.org"
			description: ""
			secondary: true
		}
		{
			title: "amazon web services"
			img:
				src: "http://www.websitemagazine.com/images/blog/amazonaws-mini.png"
				alt: ""
				href: "https://aws.amazon.com/"
			description: ""
			secondary: true
		}
		{
			title: "google"
			img:
				src: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1024px-Google_%22G%22_Logo.svg.png"
				alt: ""
				href: "https://google.com/"
			description: ""
			secondary: true
		}
		{
			title: "android"
			img:
				src: "http://storage.googleapis.com/ix_choosemuse/uploads/2016/02/android-logo.png"
				alt: ""
				href: "https://www.android.com/"
			description: ""
			secondary: true
		}
		{
			title: "flux"
			img:
				src: "http://objectpartners.github.io/react-workshop/assets/img/flux-logo.png"
				alt: ""
				href: "http://facebook.github.io/flux/"
			description: ""
			secondary: true
		}
		{
			title: "backbone"
			img:
				src: "https://worldvectorlogo.com/logos/backbone-icon.svg"
				alt: ""
				href: "http://backbonejs.org/"
			description: ""
			secondary: true
		}
		{
			title: "adobe illustrator"
			img:
				src: "/brink-logo-small.svg"
				alt: ""
				href: "http://backbonejs.org/"
			description: ""
			secondary: true
		}
		{
			title: "webpack"
			img:
				src: "/brink-logo-small.svg"
				alt: ""
				href: "http://backbonejs.org/"
			description: ""
			secondary: true
		}
		{
			title: "express.js"
			img:
				src: "/brink-logo-small.svg"
				alt: ""
				href: "http://backbonejs.org/"
			description: ""
			secondary: true
		}
		{
			title: "CoffeeScript"
			img:
				src: ""
				alt: ""
				href: "http://backbonejs.org/"
			description: ""
			secondary: true
		}
		{
			title: "Linux Ubuntu"
			img:
				src: "/brink-logo-small.svg"
				alt: ""
				href: "http://backbonejs.org/"
			description: ""
			secondary: true
		}

	]
}

Products = {
	header:
		title: "products & services"
		description: "what we would like to do for you"
	baseCategory: "packages"
	menu: [
		{
			title: "packages"
			link: "/products-and-services/packages"
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
	list: [
		{
			title: "startup package"
			description: "everything you need to get your company online."
			category: "packages"
			product: "startup-package"
			price: "1000"
			priceType: "base price"
			includes: ["business cards", "email addresses", "website"]
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
		{
			title: "basic design"
			description: "want a website? We'll design it, test it and
			get it running on the web within 5 days."
			category: "websites"
			product: "basic"
			price: "600"
			priceType: "base price"
			includes: ["a website", "mobile optimization", "up-to-date html standards"]
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
			price: "10"
			priceType: "starting at"
			active: false
			includes: ["managed domain", "automatic renewals", "domain hunting"]
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
			title: "small business email"
			description: "email solutions for your small business. Grow your
			business with a professional email for your contacts."
			category: "email"
			product: "small-business"
			price: "50"
			priceType: "per month"
			includes: ["two emails", "unlimited aliases", "premium support"]
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
			price: "20"
			active: false
			priceType: "per month"
			includes: ["one email", "high-quality interface"]
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
			title: "iconography"
			description: "custom iconography for your print and web projects"
			category: "graphics"
			product: "iconography"
			price: "30"
			active: false
			priceType: "per hour"
			includes: ["custom iconography set", "brand syncing"]
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
			price: "30"
			active: false
			priceType: "per hour"
			product: "site-layouts"
			includes: [
				"you-own vectors"
				"up-to-date internet standards"
				"library recommendations"
			]
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
			title: "basic app"
			description: "need more than just a website? Data-driven web applications
			are the future of the internet. We'll get you started."
			category: "apps"
			price: "40"
			priceType: "per hour"
			includes: [
				"our custom-built library with monthly updates"
				"everything customizeable"
				"api integration with external services"
				"premium support"
			]
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
			price: "40"
			priceType: "per hour"
			includes: [
				"complete integration with your stack"
			]
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
	CSSClass: "contact"
	header:
		title: "contact"
		description: "how to get in touch with us"
		background: "/brink-contact-lg.png"
	location:
		city: "vancouver, bc"
		country: "canada"
		phone: "+16047626133"
}

module.exports = {
	Home
	About
	Portfolio
	Stack
	Products
	Contact
}