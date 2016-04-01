class ImgCreator
	constructor: (@img, @alt, @description)->
		return this

_l = {
	package:
		"startup-package":
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
	website:
		"basic":
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
		"domain":
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
	email:
		"small-business":
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
		"personal":
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

	graphics:
		iconography:
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
		"site-layouts":
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

	app:
		basic:
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
		"components":
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

module.exports = _l