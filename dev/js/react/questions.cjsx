FormField = require("./general").FormField
questionSchema = require("../../../config/schemas").question
ReactSchemaGen = require("./general").ReactSchema


Questions = React.createClass({
	getInitialState: ->
		return {
			questions: app.questions
		}
	componentDidMount: ->
		# console.log(app.questions)
		_.extend(this, Backbone.Events)
		ReactDOM.render(
			<QuestionsMenu />
			$(".content-menu")[0]
			)
		refresh = =>
			console.log("refresh ran")
			this.setState({
				questions: app.questions
				})
			# console.log(this.state)
		# refresh()
		this.listenTo(app, "refresh", refresh)
	componentWillUnmount: ->
		this.stopListening()
	render: ->
		<div>
			<ul>
				{
					this.state.questions.map((x, i)->
						<QuestionItem model={x} key={i} />
						)
				}
			</ul>
		</div>
	})

ReoccurMenu = React.createClass({
	render: ->
		<div className="reoccur-menu">
			<h2>Nterw6r2c</h2>
		</div>
	})

QuestionItem = React.createClass({
	edit: ->
		this.model.edit(AddQuestionFactory(this.props.model))
	delete: ->
		this.model.delete()
	reoccur: ->
		console.log("reoccur clicked!")
	render: ->
		this.model = app.c.questions.findWhere({ _id: this.props.model._id })
		<li className="question-item">
			<div className="icon">
			</div>
			<div className="details">
				<span>{
					this.props.model.question
					}</span>
			</div>
			<div className="menu">
				<iron-icon icon="icons:create" model={this.props.model} onClick={this.edit} />
				<iron-icon icon="icons:delete" model={this.props.model} onClick={this.delete} />
				<iron-Icon icon="icons:refresh" model={this.props.model} onClick={this.reoccur} />
			</div>
		</li>
	})

AddQuestion = React.createClass({
	getInitialState: ->
		# try
		# 	this.inputs = ReactSchemaGen(questionSchema)
		# catch e
		# 	console.error(e)
		# 	this.inputs = []
		# console.log(this.props)
		return {
			question: this.props.question || null
			category: this.props.category || null
			type: this.props.type || null
			id: this.props._id || null
		}
	change: (keyName, e)->
		# console.log(keyName, e)
		val = e.target.value
		preState = this.state 
		preState[keyName] = val 
		this.setState(preState)
		console.log(this.state)
	componentDidMount: ->
		this.setState({
			category: this.state.category || this.categories[1].value
			type: this.state.type || this.types[0].value
			})
		# console.log(this.state)
	save: (e)->
		e.preventDefault()
		val = this.state
		if this.props._id
			m = app.c.questions.findWhere({ _id: this.props._id})
			delete val._id
			m.save(this.state)
		else
			app.c.questions.add(val).save()
		this.setState({
			question: null
			category: null
			})
		this.props.closeDialog()
	render: ->
		this.categories = app.categories
		this.types = app.types
		# console.log(this.state)
		<div>
			<form>
				<FormField type="text" placeholder="something to keep an eye on..." name="question" change={_.partial(this.change, "question")} value={this.state.question} />
				<FormField type="select" name="category" options={this.categories} change={_.partial(this.change, "category")} value={this.state.category} />
				<FormField type="select" name="type" options={this.types} change={_.partial(this.change, "type")} value={this.state.type} />
				<FormField type="submit" value="Save!" click={this.save} />
			</form>
		</div>
	})

AddQuestionFactory = React.createFactory(AddQuestion)

ActiveQuestions = React.createClass({
	render: ->
		<ul>
			{
				this.props.questions.map((x, i)->
					if x.today
						<QuestionItem model={x} key={i} />
					)
			}
		</ul>
	})

QuestionsMenu = React.createClass({
	show: ->
		container = $("<div>").dialog({
			title: "Add Question"
			modal: true
			width: 500
			close: (e)->
				# console.log(e)
				ReactDOM.unmountComponentAtNode(container[0])
				$(this).remove()
			})
		closeDialog = (e)->
			# e.preventDefault()
			container.dialog("close")

		add = ReactDOM.render(
			<AddQuestion closeDialog={closeDialog} />
			container[0]
			)

	render: ->
		<div>
			<iron-icon icon="icons:add" onClick={this.show} />
		</div>
	})

module.exports = {
	Questions: Questions
}