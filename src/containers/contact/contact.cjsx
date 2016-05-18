React = require("react")
_ = require("lodash")
{asyncConnect} = require("redux-async-connect")
cookies = require("browser-cookies")

PageContainer = require("../../components/page/container-page.cjsx")
{LocationInfo, ContactForm} = require("./contact-components.cjsx")



# Contact
Contact = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		styles = require("./contact.sass")
		content = @context.content["Contact"]
		_q = @props.location.query
		product = _q.product || ""
		# console.log props:@props, "contact container"

		<PageContainer {...content}>
			<LocationInfo {...content} />
			<ContactForm products={@props.products.data} selected={product} />
		</PageContainer>
	})

AsyncContact = asyncConnect({
	products: (params, {get, store})->
		{dispatch, getState} = store
		isLoaded = (s)->
			state = s.reduxAsyncConnect
			return state.products && state.products.loaded
		if (!isLoaded(getState()))
			return get("products")
	})(Contact)

module.exports = AsyncContact