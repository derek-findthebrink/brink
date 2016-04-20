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

	var $, HorizontalMenu, Link, PageContainer, ProductItem, Products, React, ReactCSSTransitionGroup, _, k, styles;

	React = __webpack_require__(1);

	_ = __webpack_require__(16);

	$ = __webpack_require__(17);

	Link = __webpack_require__(6).Link;

	ReactCSSTransitionGroup = __webpack_require__(27);

	styles = __webpack_require__(28);

	PageContainer = __webpack_require__(2);

	HorizontalMenu = __webpack_require__(29).HorizontalMenu;

	ProductItem = React.createClass({
	  render: function() {
	    var _hrefContact, _hrefLearn, includes;
	    _hrefLearn = ["/products-and-services", this.props.category, this.props.product].join("/");
	    _hrefContact = ["/contact", this.props.category, this.props.product].join("/");
	    includes = null;
	    if (this.props.includes) {
	      includes = this.props.includes.map(function(x, i) {
	        return React.createElement("li", {
	          "key": i
	        }, x);
	      });
	    } else {
	      includes = React.createElement("li", null, "no includes provided");
	    }
	    return React.createElement("li", {
	      "className": styles["product-item"]
	    }, React.createElement("div", {
	      "className": styles.img
	    }, React.createElement("img", {
	      "src": "/brink-logo-small.svg",
	      "alt": "brink logo"
	    })), React.createElement("div", {
	      "className": styles.description
	    }, React.createElement("div", {
	      "className": styles.header
	    }, React.createElement("h2", null, this.props.title), React.createElement("p", null, this.props.description)), React.createElement("div", {
	      "className": styles.details
	    }, React.createElement("div", {
	      "className": styles.includes
	    }, React.createElement("p", null, "includes:"), React.createElement("ul", null, includes)), React.createElement("div", {
	      "className": styles.pricing
	    }, React.createElement("h2", null, this.props.price, " ", React.createElement("span", {
	      "className": styles.currency
	    }, "CAD")), React.createElement("p", null, this.props.priceType))), React.createElement("div", {
	      "className": styles["action-callout"]
	    }, React.createElement(Link, {
	      "to": _hrefLearn,
	      "className": styles.learn
	    }, "learn more"), React.createElement(Link, {
	      "to": _hrefContact,
	      "className": styles.quote
	    }, "quote"))));
	  }
	});

	k = 0;

	Products = React.createClass({
	  contextTypes: {
	    content: React.PropTypes.object
	  },
	  render: function() {
	    var base, content, e, error, items, section, speed;
	    speed = 750;
	    content = this.context.content["Products"];
	    section = this.props.params.section;
	    if (section) {
	      base = _.filter(content.list, function(x) {
	        return x.category === section;
	      });
	    } else {
	      base = content.list;
	    }
	    try {
	      items = base.map(function(x, i) {
	        if (x.active === false) {
	          return;
	        }
	        return React.createElement(ProductItem, React.__spread({}, x, {
	          "key": k++
	        }));
	      });
	    } catch (error) {
	      e = error;
	      items = React.createElement(ProductItem, {
	        "title": "no items available"
	      });
	    }
	    return React.createElement(PageContainer, React.__spread({}, content), React.createElement(HorizontalMenu, {
	      "menu": content.menu,
	      "location": this.props.location
	    }), React.createElement("ul", {
	      "className": styles["products-list"]
	    }, React.createElement(ReactCSSTransitionGroup, {
	      "transitionName": {
	        enter: styles["product-trans-enter"],
	        leave: styles["product-trans-leave"],
	        appear: styles["product-trans-enter"]
	      },
	      "transitionAppear": true,
	      "transitionAppearTimeout": speed,
	      "transitionEnterTimeout": speed,
	      "transitionLeave": false,
	      "transitionLeaveTimeout": speed
	    }, items)));
	  }
	});

	module.exports = Products;


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
/* 6 */
/***/ function(module, exports) {

	module.exports = require("react-router");

/***/ },
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
/* 15 */,
/* 16 */
/***/ function(module, exports) {

	module.exports = require("lodash");

/***/ },
/* 17 */
/***/ function(module, exports) {

	module.exports = require("jquery");

/***/ },
/* 18 */,
/* 19 */,
/* 20 */,
/* 21 */,
/* 22 */,
/* 23 */,
/* 24 */,
/* 25 */,
/* 26 */,
/* 27 */
/***/ function(module, exports) {

	module.exports = require("react-addons-css-transition-group");

/***/ },
/* 28 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"product-trans-enter":"product___product-trans-enter__1vKIT","product-trans-leave":"product___product-trans-leave__2OT7P","fadeIn":"product___fadeIn__3Jefo","fadeOut":"product___fadeOut__3x4MY","products-list":"product___products-list__1X-N4","product-item":"product___product-item__3gLpk","description":"product___description__2jNPB","img":"product___img__3lwZp","header":"product___header__1Tfep","details":"product___details__1bNtR","includes":"product___includes__NLVvy","pricing":"product___pricing__3Qxc7","action-callout":"product___action-callout__2m09Y","learn":"product___learn__20KlH","quote":"product___quote__DZjQo","currency":"product___currency__3VoSO"};

/***/ },
/* 29 */
/***/ function(module, exports, __webpack_require__) {

	var CSSModules, HorizontalMenu, Link, MenuItem, React, styles;

	React = __webpack_require__(1);

	CSSModules = __webpack_require__(10);

	Link = __webpack_require__(6).Link;

	styles = __webpack_require__(30);

	MenuItem = React.createClass({
	  render: function() {
	    var c, classes;
	    classes = ["app-nav"];
	    if (this.props.addClass) {
	      classes.push(this.props.addClass);
	    }
	    c = classes.join(" ");
	    return React.createElement("li", {
	      "className": this.props.addClass || null
	    }, React.createElement(Link, {
	      "to": this.props.link
	    }, this.props.title));
	  }
	});

	HorizontalMenu = React.createClass({
	  componentDidMount: function() {},
	  render: function() {
	    var items, location;
	    location = this.props.location;
	    items = this.props.menu.map(function(x, i) {
	      if (typeof location === "object" && x.link === location.pathname) {
	        return React.createElement(MenuItem, React.__spread({}, x, {
	          "key": i,
	          "addClass": styles.active
	        }));
	      } else {
	        return React.createElement(MenuItem, React.__spread({}, x, {
	          "key": i
	        }));
	      }
	    });
	    return React.createElement("div", {
	      "className": styles.horizontal
	    }, React.createElement("ul", null, items));
	  }
	});

	module.exports = {
	  HorizontalMenu: HorizontalMenu
	};


/***/ },
/* 30 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"horizontal":"menu___horizontal__2Y3fh","active":"menu___active__1HJO1"};

/***/ }
/******/ ]);