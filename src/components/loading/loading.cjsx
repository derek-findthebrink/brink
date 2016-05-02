React = require("react")
{connect} = require("react-redux")
ReactCSSTransitionGroup = require("react-addons-css-transition-group")


Loading = React.createClass({
	render: ->
		console.log loadingState:@props
		if !@props.loading
			return null
		styles = require("./loading.sass")

		<ReactCSSTransitionGroup
			transitionName={{
				leave: styles.leaveTransition
				}}
			transitionLeave={true}
			transitionLeaveTimeout={750}>
			<div className={styles.container}>
				<div>
					<img src="/brink-logo-small.svg" />
					<h1>brink technology co.</h1>
				</div>
			</div>
		</ReactCSSTransitionGroup>
	})

mapStateToProps = (state)->
	return {
		loading: state.app.loading
	}

ReduxLoading = connect(
	mapStateToProps
	)(Loading)

module.exports = ReduxLoading