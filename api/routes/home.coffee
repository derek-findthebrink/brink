express = require "express"
c = require "../controllers/home"

home = express.Router()

home.get("/", c.home)
home.get("/portfolio", c.portfolio)
home.get("/stack", c.stack)
home.get("/products-and-services", c.productsAndServices)
home.get("/contact", c.contact)

home.get("/products-and-services/:sub", c.productsAndServicesSub)
home.get("/products-and-services/:category/:product", c.productLearn)

module.exports = home