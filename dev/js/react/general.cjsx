module.exports = {
	FormField: React.createClass({
		render: ->
			if this.props.type == "select"
				<div className="form-field">
					<label htmlFor={this.props.name}>{this.props.title || this.props.name}</label>
					<select type={this.props.type} placeholder={this.props.placeholder || null} name={this.props.name} onChange={this.props.change} value={this.props.value}>
						{
							this.props.options.map((x, i)->
								<option key={i} value={x.value}>{x.title || x.value}</option>
								)
						}
					</select>
				</div>
			else
				<div className="form-field">
					<label htmlFor={this.props.name}>{this.props.title || this.props.name || null}</label>
					<input value={this.props.value} type={this.props.type} placeholder={this.props.placeholder || null} name={this.props.name || null} onChange={this.props.change} onClick={this.props.click} />
				</div>
		})
	ReactSchema: (schema)->
		# console.log("react schema ran")
		# console.log(schema)
		inputs = []
		# returns array of inputs for use in react views
		_.each(schema, (x)->
			if x["input"]
				console.log(x)
				delete x.input
				delete x.db
				delete x.order
				if x.list && typeof(x.list) == "function"
					x.list = x.list()
				if x.default && typeof(x.default) == "function"
					x.default = x.default()
				inputs.push(x)
			)
		# sorted = _.sortBy(inputs, "order")
		# console.log(sorted)
		# console.log(inputs)
		return inputs
}