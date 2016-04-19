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

	var BlogWidget, FeaturedProducts, Home, PageContainer, React, Story, error, log, styles;

	React = __webpack_require__(1);

	PageContainer = __webpack_require__(2);

	BlogWidget = __webpack_require__(19);

	FeaturedProducts = __webpack_require__(20);

	Story = __webpack_require__(21);

	styles = __webpack_require__(23);

	try {
	  log = appLogger.child({
	    type: "views",
	    file: "react/home"
	  });
	} catch (error) {
	  log = console;
	  log.info = console.log;
	}

	Home = React.createClass({
	  contextTypes: {
	    content: React.PropTypes.object
	  },
	  render: function() {
	    var home;
	    home = this.context.content["Home"];
	    return React.createElement(PageContainer, React.__spread({}, home), React.createElement(Story, null), React.createElement("div", {
	      "className": styles.check
	    }, React.createElement(BlogWidget, null), React.createElement(FeaturedProducts, null)));
	  }
	});

	module.exports = Home;


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
/* 10 */,
/* 11 */,
/* 12 */,
/* 13 */,
/* 14 */,
/* 15 */,
/* 16 */,
/* 17 */,
/* 18 */,
/* 19 */
/***/ function(module, exports, __webpack_require__) {

	var BlogWidget, React;

	React = __webpack_require__(1);

	BlogWidget = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": "blog-widget"
	    }, React.createElement("h3", null, "recent blog entries"));
	  }
	});

	module.exports = BlogWidget;


/***/ },
/* 20 */
/***/ function(module, exports, __webpack_require__) {

	var FeaturedProducts, React;

	React = __webpack_require__(1);

	FeaturedProducts = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": "featured-products"
	    }, React.createElement("h3", null, "featured products"));
	  }
	});

	module.exports = FeaturedProducts;


/***/ },
/* 21 */
/***/ function(module, exports, __webpack_require__) {

	var React, Story, StoryItem, items, styles;

	React = __webpack_require__(1);

	styles = __webpack_require__(22);

	items = [
	  {
	    title: "why",
	    description: "this is why we exist"
	  }, {
	    title: "how",
	    description: "this is how we do our thing"
	  }, {
	    title: "what you get",
	    description: "this is why you should choose us"
	  }, {
	    title: "callout",
	    description: "this is what you should do now"
	  }
	];

	StoryItem = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": styles.storyItem
	    }, React.createElement("div", {
	      "className": styles.inner
	    }, React.createElement("h2", null, this.props.title), React.createElement("p", null, this.props.description)));
	  }
	});

	Story = React.createClass({
	  render: function() {
	    var storyboard, style;
	    style = {
	      backgroundImage: "url(/backgrounds/square_bg.png)"
	    };
	    storyboard = items.map(function(x, i) {
	      return React.createElement(StoryItem, React.__spread({}, x, {
	        "key": i
	      }));
	    });
	    return React.createElement("div", {
	      "className": styles.container,
	      "style": style
	    }, storyboard);
	  }
	});

	module.exports = Story;


/***/ },
/* 22 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"story___container__2NNsF","storyItem":"story___storyItem__34eUm","inner":"story___inner__2Y7YD"};

/***/ },
/* 23 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"home___container__3BPNc","check":"home___check__1kkCX"};

/***/ }
/******/ ]);