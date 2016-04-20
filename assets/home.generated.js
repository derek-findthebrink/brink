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

	BlogWidget = __webpack_require__(21);

	FeaturedProducts = __webpack_require__(22);

	Story = __webpack_require__(23);

	styles = __webpack_require__(25);

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
/* 19 */,
/* 20 */,
/* 21 */
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
/* 22 */
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
/* 23 */
/***/ function(module, exports, __webpack_require__) {

	var Benefits, How, Now, React, Story, StoryItem, Why, items, styles;

	React = __webpack_require__(1);

	styles = __webpack_require__(24);

	items = [
	  {
	    title: "Because it shouldn't be hard to get your business on the internet.",
	    description: "this is why we exist"
	  }, {
	    title: "by using the latest tricks and tools",
	    description: "this is how we do our thing"
	  }, {
	    title: "you get:",
	    description: "this is why you should choose us"
	  }, {
	    title: "check out our products",
	    description: "this is what you should do now"
	  }
	];

	Why = React.createClass({
	  render: function() {
	    return React.createElement("div", null, React.createElement("h2", null, items[0].title), React.createElement("p", null, "Thanks to the internet, the speed of commerce has never been faster. And it keeps speeding up."), React.createElement("p", null, "We specialize in getting you online, fast, with a code-base that will grow as fast as your company does."));
	  }
	});

	How = React.createClass({
	  render: function() {
	    return React.createElement("div", null, React.createElement("h2", null, items[1].title), React.createElement("div", {
	      "className": styles.twoCol
	    }, React.createElement("div", null, React.createElement("div", {
	      "className": styles.colorContainer
	    }, React.createElement("img", {
	      "src": "/icons/brink-icons_business\ cards.svg"
	    }), React.createElement("h3", null, "Universal Code"), React.createElement("p", null, "\t\t\t\t\t\t\tGone are the days of using a different language for each target device. Our custom servers, web sites and \n\t\t\t\t\t\t\tapplications are all written in universal javascript. ")), React.createElement("h3", {
	      "className": styles.callout
	    }, "One codebase, one language, super fast development.")), React.createElement("div", null, React.createElement("div", {
	      "className": styles.colorContainer
	    }, React.createElement("img", {
	      "src": "/icons/brink-icons_domain.svg"
	    }), React.createElement("h3", null, "Sprint Development"), React.createElement("p", null, "\t\t\t\t\t\t\tWe like to get things done quickly too. Our tools help us move quickly, freeing up more time for working\n\t\t\t\t\t\t\twith you to make the best online presence for your business.")), React.createElement("h3", {
	      "className": styles.callout
	    }, "Less time developing, more time earning."))));
	  }
	});

	Benefits = React.createClass({
	  render: function() {
	    return React.createElement("div", null, React.createElement("h2", null, items[2].title), React.createElement("div", {
	      "className": styles.threeCol
	    }, React.createElement("div", null, React.createElement("img", {
	      "src": "/icons/brink-icons_uptime.svg"
	    }), React.createElement("h3", null, "speed"), React.createElement("p", null, "\t\t\t\t\t\tWant it done fast? No problem. Our tools (which we love) and our philosophy\n\t\t\t\t\t\tlets us move quickly from conception to completion.")), React.createElement("div", null, React.createElement("img", {
	      "src": "/icons/brink-icons_oil.svg"
	    }), React.createElement("h3", null, "money in your pocket"), React.createElement("p", null, "\t\t\t\t\t\tWe\'re cheap! It\'s true, check out our competition. Being a startup teaches\n\t\t\t\t\t\tyou how to keep your operation lean. Our lean operation keeps our costs down and your\n\t\t\t\t\t\twallet happy.")), React.createElement("div", null, React.createElement("img", {
	      "src": "/icons/brink-icons_trends.svg"
	    }), React.createElement("h3", null, "quality, reusable code"), React.createElement("p", null, "\t\t\t\t\t\tThe internet is getting smarter. Newcomers like React, Node and the Isomorphic philosophy have enabled us\n\t\t\t\t\t\tto write compatible, standards-compliant code quickly using our custom-built library."))), React.createElement("h3", {
	      "className": styles.callout
	    }, "\t\t\t\tYour business will love our universal codebase. Let us build your online presence."));
	  }
	});

	Now = React.createClass({
	  render: function() {
	    return React.createElement("div", null, React.createElement("h2", null, items[3].title));
	  }
	});

	StoryItem = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": styles.storyItem
	    }, React.createElement("div", {
	      "className": styles.inner
	    }, this.props.children));
	  }
	});

	Story = React.createClass({
	  render: function() {
	    var style;
	    style = {
	      backgroundImage: "url(/backgrounds/square_bg.png)"
	    };
	    return React.createElement("div", {
	      "className": styles.container,
	      "style": style
	    }, React.createElement(StoryItem, null, React.createElement(Why, null)), React.createElement(StoryItem, null, React.createElement(How, null)), React.createElement(StoryItem, null, React.createElement(Benefits, null)), React.createElement(StoryItem, null, React.createElement(Now, null)));
	  }
	});

	module.exports = Story;


/***/ },
/* 24 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"story___container__2NNsF","storyItem":"story___storyItem__34eUm","inner":"story___inner__2Y7YD","threeCol":"story___threeCol__1x1Al","twoCol":"story___twoCol__2gzEi","callout":"story___callout__3i0xM","colorContainer":"story___colorContainer__PV6ST"};

/***/ },
/* 25 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"home___container__3BPNc","check":"home___check__1kkCX"};

/***/ }
/******/ ]);