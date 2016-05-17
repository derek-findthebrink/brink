React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")
{connect} = require("react-redux")

{MARK_COMPLETE, MARK_IGNORE} = require("../../actions/types/contact")

DashboardItem = React.createClass({
	render: ->
		<li>
			<h3>{@props.title}</h3>
			{@props.children}
		</li>
	})


ContactItem = React.createClass({
	markComplete: ->
		app.flux.dispatch({
			type: MARK_COMPLETE
			model: @props.model
			})
	render: ->
		styles = require("./dashboard.sass")
		model = @props.model
		<li className={styles.contactItem}>
			<div>
				<span>{model.email}</span>
			</div>
			<div className={styles.menu}>
				<iron-icon icon="icons:done" onClick={@markComplete} />
				<iron-icon icon="icons:remove" />
			</div>
		</li>
	})

Dashboard = React.createClass({
	render: ->
		contactItems = @props.contacts.map (x, i)->
			if !x.isNewContact
				return
			return <ContactItem model={x} key={i} />

		styles = require("./dashboard.sass")
		<div className={styles.container}>
			<ul>
				<div className={styles.mainItems}>
					<DashboardItem title="new contacts">
						<ul>
							{contactItems}
						</ul>
					</DashboardItem>
					<DashboardItem title="messages" />
				</div>
				<DashboardItem title="analytics" />
				<DashboardItem title="open projects" />
				<DashboardItem title="content" />
				<DashboardItem title="library" />
			</ul>
		</div>
	})

mapToProps = (state, ownProps)->
	return {
		contacts: state.contacts.get("items")
	}

Final = connect(
	mapToProps
	)(Dashboard)

module.exports = Final