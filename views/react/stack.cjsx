React = require("react")
_ = require("lodash")

PageContainer = require("./modules/container-page")
{StackItemMain, StackItemSecondary} = require("./modules/widget-stack-item")

# Stack
Stack = React.createClass({
	getInitialState: ->
		return app.content.Stack
	render: ->
		_primary = _.filter @state.list, (x)->
			x.secondary == false
		_secondary = _.filter @state.list, (x)->
			x.secondary == true
		primary = _primary.map (x, i)->
			<StackItemMain key={i} {...x} />
		secondary = _secondary.map (x, i)->
			<StackItemSecondary key={i} {...x} />
			
		<PageContainer {...@state}>
			<ul className="stack-list-main">
				{primary}
			</ul>
			<ul className="stack-list-secondary">
				{secondary}
			</ul>
		</PageContainer>
	})

module.exports = Stack