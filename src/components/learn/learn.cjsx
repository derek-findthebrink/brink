React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")
$ = require("jquery")
{asyncConnect} = require("redux-async-connect")
{connect} = require("react-redux")


InputImg = React.createClass({
	render: ->
		styles = require("./learn.sass")
		<div className={styles.learnInputImage}>
			<img src={@props.img} alt={@props.alt} />
			<p>{@props.description}</p>
		</div>
	})

ContactCallout = React.createClass({
	render: ->
		styles = require("./learn.sass")
		<div className={styles.callout}>
			<a href="#">+1.604.762.6133</a>
			<a href="#">I'm ready.</a>
		</div>
	})

Base = React.createClass({
	# componentDidMount: ->
	# 	# $(".content").addClass("fill")
	# 	@_wps = $(ReactDOM.findDOMNode(this)).children("div")
	# 		.waypoint({
	# 			handler: ->
	# 				el = this.element
	# 				$(el).addClass("active")
	# 			offset: "70%"
	# 			})
	# componentWillUnmount: ->
	# 	@_wps.map (x)->
	# 		x.destroy()
		# $(".content").removeClass("fill")
	render: ->
		product = @props.product
		inputs = product.learnData.inputs.map (x, i)->
			<InputImg {...x} key={i} />
		process = product.learnData.process.map (x, i)->
			<InputImg {...x} key={i} />
		outputs = product.learnData.outputs.map (x, i)->
			<InputImg {...x} key={i} />

		styles = require("./learn.sass")

		<div className={styles.learn}>
			<div className={styles.learnHeader}>
				<h2>{product.title}</h2>
				<p>{product.description}</p>
			</div>
			<div className={styles.learnDescription}>
				<p>I'm a description</p>
			</div>
			<div className={styles.inputs}>
				{inputs}
			</div>
			<div className={styles.process}>
				{process}
			</div>
			<div className={styles.results}>
				<h3>{product.learnData.result}</h3>
			</div>
			<div className={styles.outputs}>
				{outputs}
			</div>
			<ContactCallout />
		</div>
	})

mapState = (state, ownProps)->
	product = _.find state.products.items, (x)->
		ownProps.params.product == x._id
	return {
		product: product
	}


Final = connect(
	mapState
	)(Base)

AsyncFinal = asyncConnect({
	products: (params, {store, get})->		
		{dispatch, getState} = store
		isLoaded = (s)->
			state = s.reduxAsyncConnect
			return state.products && state.products.loaded
		if (!isLoaded(getState()))
			return get("products")
	})(Final)

module.exports = AsyncFinal