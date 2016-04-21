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
/******/ ({

/***/ 0:
/***/ function(module, exports, __webpack_require__) {

	var CSSModules, PageContainer, React, Stack, StackItemMain, StackItemSecondary, TradeImage, _, styles;

	React = __webpack_require__(1);

	_ = __webpack_require__(15);

	CSSModules = __webpack_require__(10);

	PageContainer = __webpack_require__(2);

	styles = __webpack_require__(30);

	TradeImage = React.createClass({
	  render: function() {
	    var imgsrc, overlay, theClassName;
	    if (this.props.secondary) {
	      theClassName = styles.secondaryTradeImg;
	      overlay = React.createElement("div", {
	        "className": styles.overlay
	      }, React.createElement("h4", {
	        "className": styles["overlay-text"]
	      }, this.props.title));
	    } else {
	      theClassName = styles.mainTradeImg;
	      overlay = null;
	    }
	    if (this.props.src === "" || !this.props.src) {
	      imgsrc = "/brink-logo-small.svg";
	    } else {
	      imgsrc = this.props.src;
	    }
	    return React.createElement("div", {
	      "className": theClassName
	    }, React.createElement("a", {
	      "href": this.props.href,
	      "target": "_blank"
	    }, React.createElement("iron-image", {
	      "src": imgsrc,
	      "sizing": "contain"
	    }), overlay));
	  }
	});

	StackItemMain = React.createClass({
	  render: function() {
	    return React.createElement("li", null, React.createElement(TradeImage, React.__spread({}, this.props.img, {
	      "title": this.props.title
	    })), React.createElement("div", {
	      "className": styles.mainDescription
	    }, React.createElement("h3", {
	      "className": styles.stackHeader
	    }, this.props.title), React.createElement("span", {
	      "className": styles.stackDescription
	    }, this.props.description)));
	  }
	});

	StackItemSecondary = React.createClass({
	  render: function() {
	    return React.createElement("li", null, React.createElement(TradeImage, React.__spread({}, this.props.img, {
	      "title": this.props.title,
	      "secondary": true
	    })));
	  }
	});

	Stack = React.createClass({
	  contextTypes: {
	    content: React.PropTypes.object
	  },
	  render: function() {
	    var _primary, _secondary, content, primary, secondary;
	    content = this.context.content["Stack"];
	    _primary = _.filter(content.list, function(x) {
	      return x.secondary === false;
	    });
	    _secondary = _.filter(content.list, function(x) {
	      return x.secondary === true;
	    });
	    primary = _primary.map(function(x, i) {
	      return React.createElement(StackItemMain, React.__spread({
	        "key": i
	      }, x));
	    });
	    secondary = _secondary.map(function(x, i) {
	      return React.createElement(StackItemSecondary, React.__spread({
	        "key": i
	      }, x));
	    });
	    return React.createElement(PageContainer, React.__spread({}, content), React.createElement("ul", {
	      "styleName": "listMain"
	    }, primary), React.createElement("ul", {
	      "styleName": "listSecondary"
	    }, secondary));
	  }
	});

	module.exports = CSSModules(Stack, styles);


/***/ },

/***/ 1:
/***/ function(module, exports) {

	module.exports = require("react");

/***/ },

/***/ 2:
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

/***/ 3:
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

/***/ 4:
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"content-header___container__30eb9","inner":"content-header___inner__3R29O","logo":"content-header___logo__3kjkH","copy":"content-header___copy__3s-Qp"};

/***/ },

/***/ 10:
/***/ function(module, exports) {

	module.exports = require("react-css-modules");

/***/ },

/***/ 15:
/***/ function(module, exports) {

	module.exports = require("lodash");

/***/ },

/***/ 30:
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"listMain":"stack___listMain__gde13","mainDescription":"stack___mainDescription__1E6qU","listSecondary":"stack___listSecondary__3NcR0","mainTradeImg":"stack___mainTradeImg__1DM9e","secondaryTradeImg":"stack___secondaryTradeImg__3DbtU","stackHeader":"stack___stackHeader__ORmWE","stackDescription":"stack___stackDescription__27a0u","overlay":"stack___overlay__2sKFo","overlay-text":"stack___overlay-text__36bZh"};

/***/ }

/******/ });