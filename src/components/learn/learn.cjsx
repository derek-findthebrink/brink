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
	render: ->
		console.log props:@props
		product = @props.product
		inputs = product.learnData.inputs.map (x, i)->
			<InputImg {...x} key={i} />
		process = product.learnData.process.map (x, i)->
			<InputImg {...x} key={i} />
		outputs = product.learnData.outputs.map (x, i)->
			<InputImg {...x} key={i} />

		styles = require("./learn.sass")

		<div className={styles.container}>
			<div className={styles.header}>
				<h2>{product.title}</h2>
				<p>{product.description}</p>
			</div>

			<div className={styles.description}>
				<span className={styles.descriptor}>description</span>
				<p>{product.learnData.description}</p>
			</div>

			<div className={styles.inputs}>
				<span className={styles.descriptor}>inputs</span>
				{inputs}
			</div>

			<div className={styles.process}>
				<span className={styles.descriptor}>process</span>
				{process}
			</div>

			<div className={styles.results}>
				<span className={styles.descriptor}>you get</span>
				<h3>{product.learnData.result}</h3>
				<div className={styles.outputs}>
					{outputs}
				</div>
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