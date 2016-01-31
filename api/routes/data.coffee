express = require "express"

app = express.Router()
c = require "../controllers/data"

app.get("/questions", c.getQuestions)
app.post("/questions", c.addQuestion)
app.delete("/questions/:id", c.removeQuestion)
app.put("/questions/:id", c.updateQuestion)

module.exports = app