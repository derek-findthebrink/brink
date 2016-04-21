module.exports =
/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	var $, ButtonField, CSSModules, Captcha, Contact, ContactForm, Field, LocationInfo, LocationRow, PageContainer, React, _, ref, styles;

	React = __webpack_require__(1);

	_ = __webpack_require__(15);

	$ = __webpack_require__(16);

	PageContainer = __webpack_require__(2);

	ref = __webpack_require__(17), Field = ref.Field, ButtonField = ref.ButtonField;

	CSSModules = __webpack_require__(10);

	styles = __webpack_require__(19);

	Captcha = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": styles["g-recaptcha"],
	      "data-sitekey": "6LcEyRwTAAAAAOhoaR6dCTQPOnLdSfcfIvRE-0n9"
	    });
	  }
	});

	ContactForm = React.createClass({
	  getInitialState: function() {
	    return {
	      name: "",
	      email: "",
	      product: "",
	      description: ""
	    };
	  },
	  submit: function(e) {},
	  back: function() {
	    return console.log("back clicked");
	  },
	  change: function(key) {
	    return (function(_this) {
	      return function(e) {
	        var val;
	        val = e.target.value;
	        return _this.setState(function() {
	          var x;
	          x = {};
	          x[key] = val;
	          return x;
	        });
	      };
	    })(this);
	  },
	  componentWillMount: function() {
	    var category, email, name, product;
	    if (this.props.product) {
	      if (this.props.product.product && this.props.product.category) {
	        product = this.props.product.product;
	        category = this.props.product.category;
	        this.setState({
	          product: category + "/" + product
	        });
	      }
	    }
	    if (this.props.user) {
	      name = this.props.user.name || "";
	      email = this.props.user.email || "";
	      return this.setState({
	        name: name,
	        email: email
	      });
	    }
	  },
	  render: function() {
	    return React.createElement("form", {
	      "className": styles["contact-form"],
	      "method": "post",
	      "action": "/contact"
	    }, this.props.children, React.createElement(Field, {
	      "name": "name",
	      "value": this.state.name,
	      "change": this.change("name")
	    }), React.createElement(Field, {
	      "name": "email",
	      "label": "email address",
	      "value": this.state.email,
	      "change": this.change("email_address")
	    }), React.createElement(Field, {
	      "name": "product",
	      "value": this.state.product,
	      "change": this.change("product")
	    }), React.createElement(Field, {
	      "name": "description",
	      "type": "textarea",
	      "change": this.change("description"),
	      "value": this.state.description
	    }), React.createElement(Captcha, null), React.createElement(ButtonField, null, React.createElement("button", {
	      "type": "back",
	      "onClick": this.back
	    }, "back"), React.createElement("input", {
	      "type": "submit",
	      "value": "submit",
	      "onClick": this.submit
	    })));
	  }
	});

	LocationRow = React.createClass({
	  render: function() {
	    var header, info;
	    info = this.props.value;
	    header = this.props.header;
	    if (header === "phone") {
	      info = "604.762.6133";
	    }
	    return React.createElement("div", {
	      "className": styles["location-row"]
	    }, React.createElement("span", {
	      "className": "location-header"
	    }, header), React.createElement("span", {
	      "className": styles["location-info"]
	    }, info));
	  }
	});

	LocationInfo = React.createClass({
	  render: function() {
	    var items;
	    items = _.map(this.props.location, function(x, i) {
	      return React.createElement(LocationRow, {
	        "header": i,
	        "value": x,
	        "key": i
	      });
	    });
	    return React.createElement("div", {
	      "className": styles.location
	    }, items);
	  }
	});

	Contact = React.createClass({
	  contextTypes: {
	    content: React.PropTypes.object
	  },
	  render: function() {
	    var content;
	    content = this.context.content["Contact"];
	    return React.createElement(PageContainer, React.__spread({}, content), React.createElement(LocationInfo, React.__spread({}, content)), React.createElement(ContactForm, React.__spread({}, content), React.createElement("h2", {
	      "className": styles["form-header"]
	    }, "send us a message")));
	  }
	});

	module.exports = CSSModules(Contact, styles);


/***/ },
/* 1 */
/***/ function(module, exports) {

	module.exports = require("react");

/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	var ContentHeader, PageContainer, React;

	React = __webpack_require__(1);

	ContentHeader = __webpack_require__(3);

	PageContainer = React.createClass({
	  propTypes: {
	    header: React.PropTypes.object,
	    children: React.PropTypes.any.isRequired
	  },
	  render: function() {
	    return React.createElement("div", null, React.createElement(ContentHeader, React.__spread({}, this.props.header)), this.props.children);
	  }
	});

	module.exports = PageContainer;


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	var ContentHeader, React, styles;

	React = __webpack_require__(1);

	styles = __webpack_require__(4);

	ContentHeader = React.createClass({
	  propTypes: {
	    title: React.PropTypes.string.isRequired,
	    description: React.PropTypes.string
	  },
	  render: function() {
	    var style;
	    if (this.props.background) {
	      style = {
	        backgroundImage: "url(" + this.props.background + ")"
	      };
	    } else {
	      style = null;
	    }
	    return React.createElement("div", {
	      "className": styles.container,
	      "style": style
	    }, React.createElement("div", {
	      "className": styles.inner
	    }, React.createElement("img", {
	      "className": styles.logo,
	      "src": "/brink-logo-small.svg",
	      "alt": "products"
	    }), React.createElement("div", {
	      "className": styles.copy
	    }, React.createElement("h2", null, this.props.title), React.createElement("p", null, this.props.description))));
	  }
	});

	module.exports = ContentHeader;


/***/ },
/* 4 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"content-header___container__30eb9","inner":"content-header___inner__3R29O","logo":"content-header___logo__3kjkH","copy":"content-header___copy__3s-Qp"};

/***/ },
/* 5 */,
/* 6 */,
/* 7 */,
/* 8 */,
/* 9 */,
/* 10 */
/***/ function(module, exports) {

	module.exports = require("react-css-modules");

/***/ },
/* 11 */,
/* 12 */,
/* 13 */,
/* 14 */,
/* 15 */
/***/ function(module, exports) {

	module.exports = require("lodash");

/***/ },
/* 16 */
/***/ function(module, exports) {

	module.exports = require("jquery");

/***/ },
/* 17 */
/***/ function(module, exports, __webpack_require__) {

	var ButtonField, Field, InputSwitch, React, styles;

	React = __webpack_require__(1);

	styles = __webpack_require__(18);

	InputSwitch = React.createClass({
	  render: function() {
	    console.log({
	      props: this.props
	    }, "input switch");
	    return React.createElement("div", {
	      "className": "form-field"
	    }, React.createElement("label", {
	      "className": "checkbox-fancy"
	    }, React.createElement("input", {
	      "type": "checkbox",
	      "checked": this.props.value
	    }), React.createElement("div", {
	      "className": "checkbox"
	    })));
	  }
	});

	Field = React.createClass({
	  render: function() {
	    var _i, change, label, type, value, x;
	    label = this.props.label || this.props.name;
	    type = this.props.type;
	    change = this.props.change;
	    value = this.props.value || null;
	    x = {
	      name: this.props.name,
	      label: label,
	      type: type,
	      onChange: change,
	      value: value
	    };
	    _i = null;
	    if (type === "textarea") {
	      _i = React.createElement("textarea", x);
	    } else if (type === "select") {
	      _i = React.createElement("select", x);
	    } else if (type === "checkbox") {
	      _i = React.createElement(InputSwitch, x);
	    } else {
	      _i = React.createElement("input", x);
	    }
	    return React.createElement("div", {
	      "className": styles["form-field"]
	    }, React.createElement("label", {
	      "htmlFor": this.props.name
	    }, label), React.createElement("div", {
	      "className": styles.field
	    }, _i));
	  }
	});

	ButtonField = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": styles["button-field"]
	    }, this.props.children);
	  }
	});

	module.exports = {
	  Field: Field,
	  ButtonField: ButtonField
	};


/***/ },
/* 18 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"form-field":"form___form-field__5Bdtc","field":"form___field__3U_gR","button-field":"form___button-field__2_kpe"};

/***/ },
/* 19 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"location":"contact___location__9jLYJ","location-row":"contact___location-row__3fmLR","location-info":"contact___location-info__1Yl0H","contact-form":"contact___contact-form__1gFws","g-recaptcha":"contact___g-recaptcha__2EOlU","form-header":"contact___form-header__1wnq7","form-field":"contact___form-field__Is8am"};

/***/ }
/******/ ]);