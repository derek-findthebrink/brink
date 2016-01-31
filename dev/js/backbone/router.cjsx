Questions = require "../react/questions"
Dashboard = require "../react/dashboard"

ui = $(".content")[0]

module.exports = Backbone.Router.extend({
	initialize: ->
		if !Backbone.History.started
			Backbone.history.start({
				pushState: true
				root: "/v1"
				})
		$(".sidebar a").click((e)=>
			e.preventDefault()
			target = $(e.currentTarget).attr("href")
			# console.log(target)
			t = target.substring(4, target.length)
			# console.log(t)
			this.navigate(t, {trigger: true})
			)

	routes:
		"":					"dashboard"
		"questions": 		"questions"
	questions: ->
		ReactDOM.render(
			<Questions.Questions />
			ui
			)
	dashboard: ->
		ReactDOM.render(
			<Dashboard.Dashboard />
			ui
			)

	})