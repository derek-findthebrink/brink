chai = require "chai"
chai.should()
expect = chai.expect

# requirements testing file
# -------------------------------------------------------------------
# defines application requirements
# does not necessarily import any code, rather serves as a checklist

describe "content", ->
	it "should have a home page"

	it "should have a portfolio page"

	it "should have a page to explain the stack we like to use"

	it "should have a contact page"

	it "should have a privacy policy"

	it "should have a terms of use"

	it "should have a products and services page"


describe "security and access", ->
	it "should be available on the internet"

	it "should use https"

	it "should use google analytics"

	it "should produce an error screen on 404 error"


describe "ui", ->
	it "should be react powered"

	it "should use a bundle"

	it "should be closure compiled for production"

	it "should be mobile-optimized"

	it "should be isomorphic"
