model = Backbone.Model.extend({
	idAttribute: "_id"
	defaults: 
		dateLastAsked: moment().subtract(1, "days")
	edit: (view)->
		console.log("edit clicked")
		console.log(view)
		container = $("<div>").dialog({
			width: 500
			modal: true
			title: "edit question"
			})
		ReactDOM.render(view, container[0])
	delete: ->
		this.destroy()
	})
module.exports = {
	model: model
	collection: Backbone.Collection.extend({
		url: "/data/questions"
		name: "questions"
		model: model 
		initialize: ->
			app.init.questions = false
			this.on("sync remove", =>
				app.questions = this.toJSON()
				app.trigger(this.name)
				app.init.questions = true
				app.trigger("refresh")
				)
			this.fetch()
		isReady: false
		})
}