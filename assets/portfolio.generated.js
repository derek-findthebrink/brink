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

	var $, PageContainer, Portfolio, React, _, styles;

	React = __webpack_require__(1);

	_ = __webpack_require__(16);

	$ = __webpack_require__(17);

	PageContainer = __webpack_require__(2);

	styles = __webpack_require__(26);

	Portfolio = React.createClass({
	  contextTypes: {
	    content: React.PropTypes.object
	  },
	  render: function() {
	    var content;
	    content = this.context.content["Portfolio"];
	    return React.createElement(PageContainer, React.__spread({}, content), React.createElement("div", {
	      "className": styles.container
	    }, React.createElement("div", {
	      "className": styles.row
	    }, React.createElement("h2", null, "Cleanify")), React.createElement("div", {
	      "className": styles.row
	    }, React.createElement("h2", null, "Pyrrha")), React.createElement("div", {
	      "className": styles.row
	    }, React.createElement("h2", null, "One Ocean"))));
	  }
	});

	module.exports = Portfolio;


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

/***/ 16:
/***/ function(module, exports) {

	module.exports = require("lodash");

/***/ },

/***/ 17:
/***/ function(module, exports) {

	module.exports = require("jquery");

/***/ },

/***/ 26:
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"portfolio___container__cLtjZ"};

/***/ }

/******/ });