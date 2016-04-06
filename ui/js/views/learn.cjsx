React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")


InputImg = React.createClass({
	render: ->
		<div className="learn-input-image">
			<img src={@props.img} alt={@props.alt} />
			<p>{@props.description}</p>
		</div>
	})

ContactCallout = React.createClass({
	render: ->
		<div className="callout learn-callout">
			<a href="#">+1.604.762.6133</a>
			<a href="#">I'm ready.</a>
		</div>
	})

Base = React.createClass({
	componentDidMount: ->
		# $(".content").addClass("fill")
		@_wps = $(ReactDOM.findDOMNode(this)).children("div")
			.waypoint({
				handler: ->
					el = this.element
					$(el).addClass("active")
				offset: "70%"
				})
	componentWillUnmount: ->
		@_wps.map (x)->
			x.destroy()
		# $(".content").removeClass("fill")
	render: ->
		# console.log props:@props
		inputs = @props.learnData.inputs.map (x, i)->
			<InputImg {...x} key={i} />
		process = @props.learnData.process.map (x, i)->
			<InputImg {...x} key={i} />
		outputs = @props.learnData.outputs.map (x, i)->
			<InputImg {...x} key={i} />

		<div className="learn">
			<div className="learn-header">
				<h2 className="learn-header-text">{@props.title}</h2>
				<p className="learn-header-description">{@props.description}</p>
			</div>
			<div className="learn-description">
				<p>I'm a description</p>
			</div>
			<div className="learn-process inputs">
				{inputs}
			</div>
			<div className="learn-process math add">
				<span>+</span>
			</div>
			<div className="learn-process process">
				{process}
			</div>
			<div className="learn-process math equals">
				<span>=</span>
			</div>
			<div className="learn-process results">
				<h3>{@props.learnData.result}</h3>
			</div>
			<div className="learn-process outputs">
				{outputs}
			</div>
			<ContactCallout />
		</div>
	})

Package = React.createClass({
	render: ->
		<div>
			<h2>Package</h2>
		</div>
	})

module.exports = {
	Package
	Base
}