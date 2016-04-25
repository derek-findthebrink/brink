React = require("react")
_ = require("lodash")
{asyncConnect} = require("redux-async-connect")

PageContainer = require("../../components/page/container-page.cjsx")
{LocationInfo, ContactForm} = require("./contact-components.cjsx")



# Contact
Contact = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		# console.log props:@props
		styles = require("./contact.sass")
		content = @context.content["Contact"]
		_q = @props.location.query
		if _q.product
			product = _.find @props.products.data, (x)->
				return x._id == _q.product
		else
			product = null

		<PageContainer {...content}>
			<LocationInfo {...content} />
			<ContactForm products={@props.products.data} selected={product}>
				<h2 className={styles["form-header"]}>send us a message</h2>
			</ContactForm>
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