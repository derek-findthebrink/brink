express = require "express"
c = require "../controllers/home"

home = express.Router()

home.get("/", c.home)
home.get("/portfolio", c.portfolio)
home.get("/stack", c.stack)
home.get("/products-and-services", c.productsAndServices)
home.get("/contact", c.contact)

module.exports = home