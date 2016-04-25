exports.actions = {
	SELECT_PRODUCT: "SELECT_PRODUCT"
	LOAD: "reduxAsyncConnect/LOAD_SUCCESS"
}

exports.selectProduct = (prod)->
	return {
		type: SELECT_PRODUCT
		value: prod
	}

