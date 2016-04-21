module.exports =
/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	var Flux, app;
	
	Flux = __webpack_require__(1);
	
	app = window.app = {};
	
	__webpack_require__(53);
	
	app.flux = new Flux().initialize();


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	var $, Flux, React, Router, browserHistory, getContent, hrefNavigate, match, ref, render, renderContent, renderLearn, router, views;
	
	React = __webpack_require__(2);
	
	render = __webpack_require__(3).render;
	
	$ = __webpack_require__(4);
	
	ref = __webpack_require__(5), browserHistory = ref.browserHistory, match = ref.match, Router = ref.Router;
	
	views = __webpack_require__(6);
	
	router = __webpack_require__(40);
	
	renderContent = __webpack_require__(48);
	
	renderLearn = __webpack_require__(49);
	
	getContent = __webpack_require__(51).getContent;
	
	hrefNavigate = function(payload) {
	  return app.router.hrefNavigator(payload.href);
	};
	
	Flux = (function() {
	  function Flux() {
	    this._views = [];
	  }
	
	  Flux.prototype.dispatch = function(payload) {
	    console.log({
	      payload: payload
	    }, "flux");
	    switch (payload.action) {
	      case "render_content":
	        return renderContent(payload);
	      default:
	        return console.error(new Error("could not parse payload: " + payload.action));
	    }
	  };
	
	  Flux.prototype.initialize = function() {
	    var container, history, routes;
	    container = $("#app-container")[0];
	    history = browserHistory;
	    routes = router(history, views);
	    return match({
	      history: history,
	      routes: routes
	    }, function(err, redirect, renderProps) {
	      return render(React.createElement(Router, React.__spread({}, renderProps)), container);
	    });
	  };
	
	  return Flux;
	
	})();
	
	module.exports = Flux;


/***/ },
/* 2 */
/***/ function(module, exports) {

	module.exports = require("react");

/***/ },
/* 3 */
/***/ function(module, exports) {

	module.exports = require("react-dom");

/***/ },
/* 4 */
/***/ function(module, exports) {

	module.exports = require("jquery");

/***/ },
/* 5 */
/***/ function(module, exports) {

	module.exports = require("react-router");

/***/ },
/* 6 */
/***/ function(module, exports, __webpack_require__) {

	var about, app, contact, home, portfolio, product, stack, views;
	
	home = __webpack_require__(7);
	
	contact = __webpack_require__(16);
	
	portfolio = __webpack_require__(21);
	
	product = __webpack_require__(23);
	
	stack = __webpack_require__(28);
	
	app = __webpack_require__(30);
	
	about = __webpack_require__(38);
	
	views = {
	  home: home,
	  contact: contact,
	  portfolio: portfolio,
	  product: product,
	  stack: stack,
	  app: app,
	  about: about
	};
	
	module.exports = views;


/***/ },
/* 7 */
/***/ function(module, exports, __webpack_require__) {

	var BlogWidget, FeaturedProducts, Home, PageContainer, React, Story, error, log;
	
	React = __webpack_require__(2);
	
	PageContainer = __webpack_require__(8);
	
	BlogWidget = __webpack_require__(11);
	
	FeaturedProducts = __webpack_require__(12);
	
	Story = __webpack_require__(13);
	
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
	    var home, styles;
	    styles = __webpack_require__(15);
	    home = this.context.content["Home"];
	    return React.createElement(PageContainer, React.__spread({}, home), React.createElement(Story, null), React.createElement("div", {
	      "className": styles.check
	    }, React.createElement(BlogWidget, null), React.createElement(FeaturedProducts, null)));
	  }
	});
	
	module.exports = Home;


/***/ },
/* 8 */
/***/ function(module, exports, __webpack_require__) {

	var ContentHeader, PageContainer, React;
	
	React = __webpack_require__(2);
	
	ContentHeader = __webpack_require__(9);
	
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
/* 9 */
/***/ function(module, exports, __webpack_require__) {

	var ContentHeader, React;
	
	React = __webpack_require__(2);
	
	ContentHeader = React.createClass({
	  propTypes: {
	    title: React.PropTypes.string.isRequired,
	    description: React.PropTypes.string
	  },
	  render: function() {
	    var style, styles;
	    styles = __webpack_require__(10);
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
/* 10 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"content-header___container__VXl_S","inner":"content-header___inner__1Xjfa","logo":"content-header___logo__1hL0R","copy":"content-header___copy__fYW8l"};

/***/ },
/* 11 */
/***/ function(module, exports, __webpack_require__) {

	var BlogWidget, React;
	
	React = __webpack_require__(2);
	
	BlogWidget = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": "blog-widget"
	    }, React.createElement("h3", null, "recent blog entries"));
	  }
	});
	
	module.exports = BlogWidget;


/***/ },
/* 12 */
/***/ function(module, exports, __webpack_require__) {

	var FeaturedProducts, React;
	
	React = __webpack_require__(2);
	
	FeaturedProducts = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": "featured-products"
	    }, React.createElement("h3", null, "featured products"));
	  }
	});
	
	module.exports = FeaturedProducts;


/***/ },
/* 13 */
/***/ function(module, exports, __webpack_require__) {

	var Benefits, How, Now, React, Story, StoryItem, Why, items;
	
	React = __webpack_require__(2);
	
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
	    var styles;
	    styles = __webpack_require__(14);
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
	    var styles;
	    styles = __webpack_require__(14);
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
	    var styles;
	    styles = __webpack_require__(14);
	    return React.createElement("div", {
	      "className": styles.storyItem
	    }, React.createElement("div", {
	      "className": styles.inner
	    }, this.props.children));
	  }
	});
	
	Story = React.createClass({
	  render: function() {
	    var style, styles;
	    styles = __webpack_require__(14);
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
/* 14 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"story___container__1vBvh","storyItem":"story___storyItem__3LVEV","inner":"story___inner__I0s7h","threeCol":"story___threeCol__13DK8","twoCol":"story___twoCol__1r7iJ","callout":"story___callout__1h51-","colorContainer":"story___colorContainer__30csC"};

/***/ },
/* 15 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"home___container__XsPfC","check":"home___check__-K6Zi"};

/***/ },
/* 16 */
/***/ function(module, exports, __webpack_require__) {

	var $, ButtonField, Captcha, Contact, ContactForm, Field, LocationInfo, LocationRow, PageContainer, React, _, ref;
	
	React = __webpack_require__(2);
	
	_ = __webpack_require__(17);
	
	$ = __webpack_require__(4);
	
	PageContainer = __webpack_require__(8);
	
	ref = __webpack_require__(18), Field = ref.Field, ButtonField = ref.ButtonField;
	
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
	    var styles;
	    styles = __webpack_require__(20);
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
	    var header, info, styles;
	    styles = __webpack_require__(20);
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
	    var items, styles;
	    styles = __webpack_require__(20);
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
	    var content, styles;
	    styles = __webpack_require__(20);
	    content = this.context.content["Contact"];
	    return React.createElement(PageContainer, React.__spread({}, content), React.createElement(LocationInfo, React.__spread({}, content)), React.createElement(ContactForm, React.__spread({}, content), React.createElement("h2", {
	      "className": styles["form-header"]
	    }, "send us a message")));
	  }
	});
	
	module.exports = Contact;


/***/ },
/* 17 */
/***/ function(module, exports) {

	module.exports = require("lodash");

/***/ },
/* 18 */
/***/ function(module, exports, __webpack_require__) {

	var ButtonField, Field, InputSwitch, React;
	
	React = __webpack_require__(2);
	
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
	    var _i, change, label, styles, type, value, x;
	    styles = __webpack_require__(19);
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
	    var styles;
	    styles = __webpack_require__(19);
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
/* 19 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"form-field":"form___form-field__2fH7x","field":"form___field__3plZq","button-field":"form___button-field__377LH"};

/***/ },
/* 20 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"location":"contact___location__2q8Pp","location-row":"contact___location-row__3zH77","location-info":"contact___location-info__144yT","contact-form":"contact___contact-form__2_GSG","g-recaptcha":"contact___g-recaptcha__2Z5CZ","form-header":"contact___form-header__2eVrr","form-field":"contact___form-field__1Fex7"};

/***/ },
/* 21 */
/***/ function(module, exports, __webpack_require__) {

	var $, PageContainer, Portfolio, React, _;
	
	React = __webpack_require__(2);
	
	_ = __webpack_require__(17);
	
	$ = __webpack_require__(4);
	
	PageContainer = __webpack_require__(8);
	
	Portfolio = React.createClass({
	  contextTypes: {
	    content: React.PropTypes.object
	  },
	  render: function() {
	    var content, styles;
	    styles = __webpack_require__(22);
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
/* 22 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"portfolio___container__3-dId"};

/***/ },
/* 23 */
/***/ function(module, exports, __webpack_require__) {

	var $, HorizontalMenu, Link, PageContainer, ProductItem, Products, React, ReactCSSTransitionGroup, _, k;
	
	React = __webpack_require__(2);
	
	_ = __webpack_require__(17);
	
	$ = __webpack_require__(4);
	
	Link = __webpack_require__(5).Link;
	
	ReactCSSTransitionGroup = __webpack_require__(24);
	
	PageContainer = __webpack_require__(8);
	
	HorizontalMenu = __webpack_require__(25).HorizontalMenu;
	
	ProductItem = React.createClass({
	  render: function() {
	    var _hrefContact, _hrefLearn, includes, styles;
	    styles = __webpack_require__(27);
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
	    var base, content, e, error, items, section, speed, styles;
	    styles = __webpack_require__(27);
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
/* 24 */
/***/ function(module, exports) {

	module.exports = require("react-addons-css-transition-group");

/***/ },
/* 25 */
/***/ function(module, exports, __webpack_require__) {

	var HorizontalMenu, Link, MenuItem, React;
	
	React = __webpack_require__(2);
	
	Link = __webpack_require__(5).Link;
	
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
	    var items, location, styles;
	    styles = __webpack_require__(26);
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
/* 26 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"horizontal":"menu___horizontal__3MZUD","active":"menu___active__1kU_W"};

/***/ },
/* 27 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"product-trans-enter":"product___product-trans-enter__s-JuG","product-trans-leave":"product___product-trans-leave__3nbux","fadeIn":"product___fadeIn__1w5qq","fadeOut":"product___fadeOut__1pVoO","products-list":"product___products-list__n1To8","product-item":"product___product-item__VenDv","description":"product___description__3Gyv_","img":"product___img__3xB7I","header":"product___header__nKLal","details":"product___details__l4ks9","includes":"product___includes__leYKt","pricing":"product___pricing__5w6kB","action-callout":"product___action-callout__3DoB5","learn":"product___learn__1VwdG","quote":"product___quote__1mQ3g","currency":"product___currency__1Rx77"};

/***/ },
/* 28 */
/***/ function(module, exports, __webpack_require__) {

	var PageContainer, React, Stack, StackItemMain, StackItemSecondary, TradeImage, _;
	
	React = __webpack_require__(2);
	
	_ = __webpack_require__(17);
	
	PageContainer = __webpack_require__(8);
	
	TradeImage = React.createClass({
	  render: function() {
	    var imgsrc, overlay, styles, theClassName;
	    styles = __webpack_require__(29);
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
	    var styles;
	    styles = __webpack_require__(29);
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
	    var _primary, _secondary, content, primary, secondary, styles;
	    styles = __webpack_require__(29);
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
	      "className": styles.listMain
	    }, primary), React.createElement("ul", {
	      "className": styles.listSecondary
	    }, secondary));
	  }
	});
	
	module.exports = Stack;


/***/ },
/* 29 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"listMain":"stack___listMain__3uXr6","mainDescription":"stack___mainDescription__-xqcl","listSecondary":"stack___listSecondary__2B_vI","mainTradeImg":"stack___mainTradeImg__oXwv7","secondaryTradeImg":"stack___secondaryTradeImg__25bX-","stackHeader":"stack___stackHeader__289E_","stackDescription":"stack___stackDescription__18WVc","overlay":"stack___overlay__cTHdv","overlay-text":"stack___overlay-text__262G2"};

/***/ },
/* 30 */
/***/ function(module, exports, __webpack_require__) {

	var App, Footer, Header, Link, React, content;
	
	React = __webpack_require__(2);
	
	Link = __webpack_require__(5).Link;
	
	Footer = __webpack_require__(31);
	
	Header = __webpack_require__(33);
	
	content = __webpack_require__(37);
	
	App = React.createClass({
	  childContextTypes: {
	    content: React.PropTypes.object
	  },
	  getChildContext: function() {
	    return {
	      content: content
	    };
	  },
	  componentDidMount: function() {},
	  render: function() {
	    return React.createElement("div", null, React.createElement(Header, null), React.createElement("main", null, this.props.children), React.createElement(Footer, null));
	  }
	});
	
	module.exports = App;


/***/ },
/* 31 */
/***/ function(module, exports, __webpack_require__) {

	var Footer, Link, React;
	
	React = __webpack_require__(2);
	
	Link = __webpack_require__(5).Link;
	
	Footer = React.createClass({
	  render: function() {
	    var styles;
	    styles = __webpack_require__(32);
	    return React.createElement("footer", {
	      "className": styles.container,
	      "role": "contentinfo"
	    }, React.createElement("div", {
	      "className": styles.logo
	    }, React.createElement("img", {
	      "src": "/brink-logo-small.svg",
	      "alt": "Logo image"
	    })), React.createElement("div", {
	      "className": styles.linksContainer
	    }, React.createElement("ul", {
	      "className": styles.linkList
	    }, React.createElement("li", null, React.createElement("h3", null, "Follow Us")), React.createElement("li", null, React.createElement("a", {
	      "target": "_blank",
	      "href": "https://www.facebook.com/findthebrink/"
	    }, "Facebook")), React.createElement("li", null, React.createElement("a", {
	      "target": "_blank",
	      "href": "https://twitter.com/findthebrink"
	    }, "Twitter"))), React.createElement("ul", {
	      "className": styles.linkList
	    }, React.createElement("li", null, React.createElement("h3", null, "Content")), React.createElement("li", null, React.createElement(Link, {
	      "to": "/about"
	    }, "About")), React.createElement("li", null, React.createElement(Link, {
	      "to": "/contact"
	    }, "Contact")), React.createElement("li", null, React.createElement(Link, {
	      "to": "/products-and-services"
	    }, "Products"))), React.createElement("ul", {
	      "className": styles.linkList
	    }, React.createElement("li", null, React.createElement("h3", null, "Legal")), React.createElement("li", null, React.createElement("a", {
	      "href": "javascript:void(0)"
	    }, "Terms and Conditions")), React.createElement("li", null, React.createElement("a", {
	      "href": "javascript:void(0)"
	    }, "Privacy Policy")))), React.createElement("hr", null), React.createElement("p", null, "Disclaimer area lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum, nostrum repudiandae saepe."));
	  }
	});
	
	module.exports = Footer;


/***/ },
/* 32 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"refills_footer___container__SjBEx","logo":"refills_footer___logo__380MD","linksContainer":"refills_footer___linksContainer__gYTcf","linkList":"refills_footer___linkList__1DBQW"};

/***/ },
/* 33 */
/***/ function(module, exports, __webpack_require__) {

	var Header, Link, Nav, React;
	
	React = __webpack_require__(2);
	
	Link = __webpack_require__(5).Link;
	
	Nav = __webpack_require__(34);
	
	Header = React.createClass({
	  render: function() {
	    var styles;
	    styles = __webpack_require__(36);
	    return React.createElement("header", {
	      "className": styles.app
	    }, React.createElement(Link, {
	      "to": "/"
	    }, React.createElement("img", {
	      "src": "/brink-logo-small.svg"
	    }), React.createElement("h1", null, "brink technology co.")), React.createElement(Nav, null));
	  }
	});
	
	module.exports = Header;


/***/ },
/* 34 */
/***/ function(module, exports, __webpack_require__) {

	var Link, Nav, React;
	
	React = __webpack_require__(2);
	
	Link = __webpack_require__(5).Link;
	
	Nav = React.createClass({
	  render: function() {
	    var styles;
	    styles = __webpack_require__(35);
	    return React.createElement("nav", {
	      "className": styles.main
	    }, React.createElement("ul", null, React.createElement("li", null, React.createElement(Link, {
	      "to": "/products-and-services"
	    }, "products")), React.createElement("li", null, React.createElement(Link, {
	      "to": "/portfolio"
	    }, "portfolio")), React.createElement("li", null, React.createElement(Link, {
	      "to": "/about"
	    }, "about")), React.createElement("li", null, React.createElement(Link, {
	      "to": "/stack"
	    }, "stack")), React.createElement("li", null, React.createElement(Link, {
	      "to": "/contact"
	    }, "contact"))));
	  }
	});
	
	module.exports = Nav;


/***/ },
/* 35 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"main":"main-nav___main__1CUp2"};

/***/ },
/* 36 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"app":"header___app__3f-G8"};

/***/ },
/* 37 */
/***/ function(module, exports) {

	var About, Contact, Home, ImgCreator, Portfolio, Products, Stack;
	
	ImgCreator = (function() {
	  function ImgCreator(img, alt, description) {
	    this.img = img;
	    this.alt = alt;
	    this.description = description;
	    return this;
	  }
	
	  return ImgCreator;
	
	})();
	
	Home = {
	  header: {
	    title: "ambitious javascript design",
	    description: "cutting-edge web design"
	  },
	  carousel: [
	    {
	      img: {
	        src: "http://gamingbolt.com/wp-content/uploads/2012/03/datacore3.jpg",
	        alt: "dude with head getting weird"
	      },
	      title: "we make cool shit",
	      description: "seriously...",
	      href: "/products-and-services/"
	    }, {
	      img: {
	        src: "http://gamingbolt.com/wp-content/uploads/2012/03/datacore3.jpg",
	        alt: "dude with head getting weird"
	      },
	      title: "we make cool shit",
	      description: "seriously...",
	      href: "/products-and-services/"
	    }, {
	      img: {
	        src: "http://gamingbolt.com/wp-content/uploads/2012/03/datacore3.jpg",
	        alt: "dude with head getting weird"
	      },
	      title: "we make cool shit",
	      description: "seriously...",
	      href: "/products-and-services/"
	    }, {
	      img: {
	        src: "http://gamingbolt.com/wp-content/uploads/2012/03/datacore3.jpg",
	        alt: "dude with head getting weird"
	      },
	      title: "we make cool shit",
	      description: "seriously...",
	      href: "/products-and-services/"
	    }, {
	      img: {
	        src: "http://gamingbolt.com/wp-content/uploads/2012/03/datacore3.jpg",
	        alt: "dude with head getting weird"
	      },
	      title: "we make cool shit",
	      description: "seriously...",
	      href: "/products-and-services/"
	    }
	  ]
	};
	
	About = {
	  header: {
	    title: "about",
	    description: "what makes us tick"
	  }
	};
	
	Portfolio = {
	  header: {
	    title: "portfolio",
	    description: "some of our best work"
	  }
	};
	
	Stack = {
	  header: {
	    title: "stack",
	    description: "what we use and why we like to use it"
	  },
	  list: [
	    {
	      title: "node.js",
	      img: {
	        src: "http://johanndutoit.net/presentations/2013/02/gdg-capetown-nodejs-workshop-23-feb-2013/images/nodejs_logo.png",
	        alt: "node.js logo",
	        href: "https://nodejs.org/en/"
	      },
	      description: "Our specialty: the latest and greatest arrival on the web scene. Based on javascript, an event-driven server engine that turned Universal Code from an idea into a reality.",
	      secondary: false
	    }, {
	      title: "MongoDB",
	      img: {
	        src: "http://s3.amazonaws.com/info-mongodb-com/_com_assets/media/mongodb-logo-rgb.jpeg",
	        alt: "MongoDB logo",
	        href: "https://www.mongodb.org/"
	      },
	      description: "About as fast as they get. A database engine that natively speaks javascript and delivers results ridiculously fast. Our go-to when it comes to new builds.",
	      secondary: false
	    }, {
	      title: "ReactJS",
	      img: {
	        src: "http://red-badger.com/blog/wp-content/uploads/2015/04/react-logo-1000-transparent.png",
	        alt: "ReactJS Logo",
	        href: "https://facebook.github.io/react/"
	      },
	      description: "The latest and greatest website rendering library. Enables us to create beautiful webpages that are easily maintainable while remaining compatible with the rest of the web as older computers slowly catch up.",
	      secondary: false
	    }, {
	      title: "Sass",
	      img: {
	        src: "http://sass-lang.com/assets/img/logos/logo-b6e1ef6e.svg",
	        alt: "",
	        href: "http://sass-lang.com"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "npm",
	      img: {
	        src: "https://www.npmjs.com/static/images/npm-logo.svg",
	        alt: "",
	        href: "https://npmjs.com"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "bower",
	      img: {
	        src: "http://bower.io/img/bower-logo.png",
	        alt: "",
	        href: "http://bower.io"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "grunt",
	      img: {
	        src: "https://camo.githubusercontent.com/39242419c60a53e1f3cecdeecb2460acce47366f/687474703a2f2f6772756e746a732e636f6d2f696d672f6772756e742d6c6f676f2d6e6f2d776f72646d61726b2e737667",
	        alt: "",
	        href: "http://gruntjs.com"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "browser-sync",
	      img: {
	        src: "https://www.browsersync.io/brand-assets/logo-red.png",
	        alt: "",
	        href: "https://www.browsersync.io/"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "jade",
	      img: {
	        src: "https://avatars0.githubusercontent.com/u/9338635?v=3&s=400",
	        alt: "",
	        href: "http://jade-lang.com"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "browserify",
	      img: {
	        src: "https://pbs.twimg.com/profile_images/420347030263701504/9esmqty2_400x400.png",
	        alt: "",
	        href: "http://browserify.org"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "amazon web services",
	      img: {
	        src: "http://www.websitemagazine.com/images/blog/amazonaws-mini.png",
	        alt: "",
	        href: "https://aws.amazon.com/"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "google",
	      img: {
	        src: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1024px-Google_%22G%22_Logo.svg.png",
	        alt: "",
	        href: "https://google.com/"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "android",
	      img: {
	        src: "http://storage.googleapis.com/ix_choosemuse/uploads/2016/02/android-logo.png",
	        alt: "",
	        href: "https://www.android.com/"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "flux",
	      img: {
	        src: "http://objectpartners.github.io/react-workshop/assets/img/flux-logo.png",
	        alt: "",
	        href: "http://facebook.github.io/flux/"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "backbone",
	      img: {
	        src: "https://worldvectorlogo.com/logos/backbone-icon.svg",
	        alt: "",
	        href: "http://backbonejs.org/"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "adobe illustrator",
	      img: {
	        src: "/brink-logo-small.svg",
	        alt: "",
	        href: "http://backbonejs.org/"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "webpack",
	      img: {
	        src: "/brink-logo-small.svg",
	        alt: "",
	        href: "http://backbonejs.org/"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "express.js",
	      img: {
	        src: "/brink-logo-small.svg",
	        alt: "",
	        href: "http://backbonejs.org/"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "CoffeeScript",
	      img: {
	        src: "",
	        alt: "",
	        href: "http://backbonejs.org/"
	      },
	      description: "",
	      secondary: true
	    }, {
	      title: "Linux Ubuntu",
	      img: {
	        src: "/brink-logo-small.svg",
	        alt: "",
	        href: "http://backbonejs.org/"
	      },
	      description: "",
	      secondary: true
	    }
	  ]
	};
	
	Products = {
	  header: {
	    title: "products & services",
	    description: "what we would like to do for you"
	  },
	  baseCategory: "packages",
	  menu: [
	    {
	      title: "packages",
	      link: "/products-and-services/packages"
	    }, {
	      title: "websites",
	      link: "/products-and-services/websites"
	    }, {
	      title: "email",
	      link: "/products-and-services/email"
	    }, {
	      title: "graphics",
	      link: "/products-and-services/graphics"
	    }, {
	      title: "apps",
	      link: "/products-and-services/apps"
	    }
	  ],
	  list: [
	    {
	      title: "startup package",
	      description: "everything you need to get your company online.",
	      category: "packages",
	      product: "startup-package",
	      price: "1000",
	      priceType: "base price",
	      includes: ["business cards", "email addresses", "website"],
	      learnData: {
	        inputs: [new ImgCreator("/icons/brink-icons_brand.svg", "brand input", "survey"), new ImgCreator("/icons/brink-icons_brand.svg", "brand input", "business requirements")],
	        process: [new ImgCreator("/icons/brink-icons_uptime.svg", "brand input", "one week")],
	        result: "a great looking website with synchronized branding and emails to boot",
	        outputs: [new ImgCreator("/icons/brink-icons_computer.svg", "brand input", "website"), new ImgCreator("/icons/brink-icons_email.svg", "brand input", "two email accounts"), new ImgCreator("/icons/brink-icons_business\ cards.svg", "brand input", "brand design")],
	        callout: [new ImgCreator("/icons/brink-icons_brand.svg")]
	      }
	    }, {
	      title: "basic design",
	      description: "want a website? We'll design it, test it and get it running on the web within 5 days.",
	      category: "websites",
	      product: "basic",
	      price: "600",
	      priceType: "base price",
	      includes: ["a website", "mobile optimization", "up-to-date html standards"],
	      learnData: {
	        inputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "herp")],
	        process: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer"), new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        result: "hi there!",
	        outputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        callout: []
	      }
	    }, {
	      title: "domains",
	      description: "purchase and manage your domain names",
	      category: "websites",
	      product: "domain",
	      price: "10",
	      priceType: "starting at",
	      active: false,
	      includes: ["managed domain", "automatic renewals", "domain hunting"],
	      learnData: {
	        inputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "herp")],
	        process: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer"), new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        result: "hi there!",
	        outputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        callout: []
	      }
	    }, {
	      title: "small business email",
	      description: "email solutions for your small business. Grow your business with a professional email for your contacts.",
	      category: "email",
	      product: "small-business",
	      price: "50",
	      priceType: "per month",
	      includes: ["two emails", "unlimited aliases", "premium support"],
	      learnData: {
	        inputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "herp")],
	        process: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer"), new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        result: "hi there!",
	        outputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        callout: []
	      }
	    }, {
	      title: "personal email",
	      description: "personal email solutions. Can't get the email you want on Gmail? We've got you covered.",
	      category: "email",
	      product: "personal",
	      price: "20",
	      active: false,
	      priceType: "per month",
	      includes: ["one email", "high-quality interface"],
	      learnData: {
	        inputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "herp")],
	        process: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer"), new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        result: "hi there!",
	        outputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        callout: []
	      }
	    }, {
	      title: "iconography",
	      description: "custom iconography for your print and web projects",
	      category: "graphics",
	      product: "iconography",
	      price: "30",
	      active: false,
	      priceType: "per hour",
	      includes: ["custom iconography set", "brand syncing"],
	      learnData: {
	        inputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "herp")],
	        process: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer"), new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        result: "hi there!",
	        outputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        callout: []
	      }
	    }, {
	      title: "site layouts",
	      description: "speed up your website development. We'll create custom wireframes based on your business needs and the latest web-standards.",
	      category: "graphics",
	      price: "30",
	      active: false,
	      priceType: "per hour",
	      product: "site-layouts",
	      includes: ["you-own vectors", "up-to-date internet standards", "library recommendations"],
	      learnData: {
	        inputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "herp")],
	        process: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer"), new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        result: "hi there!",
	        outputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        callout: []
	      }
	    }, {
	      title: "basic app",
	      description: "need more than just a website? Data-driven web applications are the future of the internet. We'll get you started.",
	      category: "apps",
	      price: "40",
	      priceType: "per hour",
	      includes: ["our custom-built library with monthly updates", "everything customizeable", "api integration with external services", "premium support"],
	      product: "basic",
	      learnData: {
	        inputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "herp")],
	        process: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer"), new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        result: "hi there!",
	        outputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        callout: []
	      }
	    }, {
	      title: "custom component development",
	      description: "already have an app but need new features? We've got you covered.",
	      category: "apps",
	      product: "custom-component",
	      price: "40",
	      priceType: "per hour",
	      includes: ["complete integration with your stack"],
	      learnData: {
	        inputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "herp")],
	        process: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer"), new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        result: "hi there!",
	        outputs: [new ImgCreator("/icons/brink-icons_computer.svg", "computer", "a computer")],
	        callout: []
	      }
	    }
	  ]
	};
	
	Contact = {
	  CSSClass: "contact",
	  header: {
	    title: "contact",
	    description: "how to get in touch with us",
	    background: "/brink-contact-lg.png"
	  },
	  location: {
	    city: "vancouver, bc",
	    country: "canada",
	    phone: "+16047626133"
	  }
	};
	
	module.exports = {
	  Home: Home,
	  About: About,
	  Portfolio: Portfolio,
	  Stack: Stack,
	  Products: Products,
	  Contact: Contact
	};


/***/ },
/* 38 */
/***/ function(module, exports, __webpack_require__) {

	var About, PageContainer, React;
	
	React = __webpack_require__(2);
	
	PageContainer = __webpack_require__(8);
	
	About = React.createClass({
	  contextTypes: {
	    content: React.PropTypes.object
	  },
	  render: function() {
	    var about, styles;
	    styles = __webpack_require__(39);
	    about = this.context.content["About"];
	    return React.createElement(PageContainer, React.__spread({}, about), React.createElement("div", {
	      "className": styles.container
	    }, React.createElement("div", {
	      "className": styles.row
	    }, React.createElement("div", {
	      "className": styles.img
	    }, React.createElement("img", {
	      "src": "/brink-logo-small.svg"
	    })), React.createElement("div", {
	      "className": styles.description
	    }, React.createElement("h2", {
	      "className": styles.name
	    }, "Derek"), React.createElement("p", {
	      "className": styles.personDescription
	    }, "\t\t\t\t\t\t\ta cool guy who likes code!\t")))));
	  }
	});
	
	module.exports = About;


/***/ },
/* 39 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"about___container__3uemj","row":"about___row__pLTFr","img":"about___img__nU-NP"};

/***/ },
/* 40 */
/***/ function(module, exports, __webpack_require__) {

	var About, App, AppRouter, Contact, Home, IndexRoute, Portfolio, Product, React, Route, Router, Stack, content, error, log, ref, views_dir;
	
	try {
	  log = appLogger.child({
	    type: "app-router",
	    file: "router"
	  });
	} catch (error) {
	  log = console;
	  log.info = console.log;
	}
	
	React = __webpack_require__(2);
	
	ref = __webpack_require__(5), Router = ref.Router, Route = ref.Route, IndexRoute = ref.IndexRoute;
	
	content = __webpack_require__(37);
	
	views_dir = "../views/react/";
	
	App = !(function webpackMissingModule() { var e = new Error("Cannot find module \".\""); e.code = 'MODULE_NOT_FOUND'; throw e; }());
	
	Home = !(function webpackMissingModule() { var e = new Error("Cannot find module \".\""); e.code = 'MODULE_NOT_FOUND'; throw e; }());
	
	Product = !(function webpackMissingModule() { var e = new Error("Cannot find module \".\""); e.code = 'MODULE_NOT_FOUND'; throw e; }());
	
	Portfolio = !(function webpackMissingModule() { var e = new Error("Cannot find module \".\""); e.code = 'MODULE_NOT_FOUND'; throw e; }());
	
	About = !(function webpackMissingModule() { var e = new Error("Cannot find module \".\""); e.code = 'MODULE_NOT_FOUND'; throw e; }());
	
	Stack = !(function webpackMissingModule() { var e = new Error("Cannot find module \".\""); e.code = 'MODULE_NOT_FOUND'; throw e; }());
	
	Contact = !(function webpackMissingModule() { var e = new Error("Cannot find module \".\""); e.code = 'MODULE_NOT_FOUND'; throw e; }());
	
	AppRouter = function(history) {
	  return React.createElement(Router, {
	    "history": history
	  }, React.createElement(Route, {
	    "path": "/",
	    "component": App
	  }, React.createElement(IndexRoute, {
	    "component": Home
	  }), React.createElement(Route, {
	    "path": "products-and-services(/:section)",
	    "component": Product
	  }), React.createElement(Route, {
	    "path": "portfolio",
	    "component": Portfolio
	  }), React.createElement(Route, {
	    "path": "about",
	    "component": About
	  }), React.createElement(Route, {
	    "path": "stack",
	    "component": Stack
	  }), React.createElement(Route, {
	    "path": "contact",
	    "component": Contact
	  })));
	};
	
	module.exports = AppRouter;


/***/ },
/* 41 */
/***/ function(module, exports) {

	function webpackContext(req) {
		throw new Error("Cannot find module '" + req + "'.");
	}
	webpackContext.keys = function() { return []; };
	webpackContext.resolve = webpackContext;
	module.exports = webpackContext;
	webpackContext.id = 41;


/***/ },
/* 42 */
/***/ function(module, exports) {

	function webpackContext(req) {
		throw new Error("Cannot find module '" + req + "'.");
	}
	webpackContext.keys = function() { return []; };
	webpackContext.resolve = webpackContext;
	module.exports = webpackContext;
	webpackContext.id = 42;


/***/ },
/* 43 */
/***/ function(module, exports) {

	function webpackContext(req) {
		throw new Error("Cannot find module '" + req + "'.");
	}
	webpackContext.keys = function() { return []; };
	webpackContext.resolve = webpackContext;
	module.exports = webpackContext;
	webpackContext.id = 43;


/***/ },
/* 44 */
/***/ function(module, exports) {

	function webpackContext(req) {
		throw new Error("Cannot find module '" + req + "'.");
	}
	webpackContext.keys = function() { return []; };
	webpackContext.resolve = webpackContext;
	module.exports = webpackContext;
	webpackContext.id = 44;


/***/ },
/* 45 */
/***/ function(module, exports) {

	function webpackContext(req) {
		throw new Error("Cannot find module '" + req + "'.");
	}
	webpackContext.keys = function() { return []; };
	webpackContext.resolve = webpackContext;
	module.exports = webpackContext;
	webpackContext.id = 45;


/***/ },
/* 46 */
/***/ function(module, exports) {

	function webpackContext(req) {
		throw new Error("Cannot find module '" + req + "'.");
	}
	webpackContext.keys = function() { return []; };
	webpackContext.resolve = webpackContext;
	module.exports = webpackContext;
	webpackContext.id = 46;


/***/ },
/* 47 */
/***/ function(module, exports) {

	function webpackContext(req) {
		throw new Error("Cannot find module '" + req + "'.");
	}
	webpackContext.keys = function() { return []; };
	webpackContext.resolve = webpackContext;
	module.exports = webpackContext;
	webpackContext.id = 47;


/***/ },
/* 48 */
/***/ function(module, exports, __webpack_require__) {

	var $, Contact, Home, Portfolio, Products, React, ReactDOM, Stack, Views, _, _c, _contentMatch, _pageMatch, renderContent, ui;
	
	React = __webpack_require__(2);
	
	ReactDOM = __webpack_require__(3);
	
	$ = __webpack_require__(4);
	
	_ = __webpack_require__(17);
	
	ui = $(".content")[0];
	
	_c = __webpack_require__(37);
	
	Home = __webpack_require__(7);
	
	Portfolio = __webpack_require__(21);
	
	Stack = __webpack_require__(28);
	
	Products = __webpack_require__(23);
	
	Contact = __webpack_require__(16);
	
	Views = {
	  "Home": Home,
	  "Portfolio": Portfolio,
	  "Stack": Stack,
	  "Products": Products,
	  "Contact": Contact
	};
	
	_contentMatch = function(payload) {
	  var x;
	  x = _c[payload.page];
	  x.props.user = User;
	  return x;
	};
	
	_pageMatch = function(page) {
	  var _v;
	  _v = Views[page.view];
	  return _v;
	};
	
	renderContent = function(payload) {
	  var c, props, v, view;
	  c = _contentMatch(payload);
	  props = c.props;
	  view = _pageMatch(c);
	  if (payload.sub) {
	    props.items = _.filter(c.props.list, function(x) {
	      return x.category === payload.sub;
	    });
	  }
	  if (payload.merge) {
	    props = _.extend(props, payload.merge);
	  }
	  v = React.createElement(view, props);
	  return ReactDOM.render(v, ui);
	};
	
	module.exports = renderContent;


/***/ },
/* 49 */
/***/ function(module, exports, __webpack_require__) {

	var $, Base, Package, React, ReactDOM, _, content, ref, render, renderApp, renderEmail, renderGraphics, renderPackage, renderWebsite, ui;
	
	React = __webpack_require__(2);
	
	ReactDOM = __webpack_require__(3);
	
	$ = __webpack_require__(4);
	
	_ = __webpack_require__(17);
	
	ui = $(".content")[0];
	
	ref = __webpack_require__(50), Package = ref.Package, Base = ref.Base;
	
	content = __webpack_require__(37);
	
	renderPackage = function(payload) {
	  var _v, col, props;
	  col = content.Products.props.list;
	  props = _.find(col, function(x) {
	    return x.product === payload.product;
	  });
	  _v = React.createElement(Base, props);
	  return ReactDOM.render(_v, ui);
	};
	
	renderWebsite = function(payload) {
	  return renderPackage(payload);
	};
	
	renderEmail = function(payload) {
	  return renderPackage(payload);
	};
	
	renderGraphics = function(payload) {
	  return renderPackage(payload);
	};
	
	renderApp = function(payload) {
	  return renderPackage(payload);
	};
	
	render = function(payload) {
	  console.log({
	    payload: payload
	  });
	  switch (payload.category) {
	    case "packages":
	      return renderPackage(payload);
	    case "websites":
	      return renderWebsite(payload);
	    case "email":
	      return renderEmail(payload);
	    case "graphics":
	      return renderGraphics(payload);
	    case "apps":
	      return renderApp(payload);
	    default:
	      return console.error(new Error("could not parse payload " + payload.category));
	  }
	};
	
	module.exports = render;


/***/ },
/* 50 */
/***/ function(module, exports, __webpack_require__) {

	var Base, ContactCallout, InputImg, Package, React, ReactDOM, _;
	
	React = __webpack_require__(2);
	
	ReactDOM = __webpack_require__(3);
	
	_ = __webpack_require__(17);
	
	InputImg = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": "learn-input-image"
	    }, React.createElement("img", {
	      "src": this.props.img,
	      "alt": this.props.alt
	    }), React.createElement("p", null, this.props.description));
	  }
	});
	
	ContactCallout = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": "callout learn-callout"
	    }, React.createElement("a", {
	      "href": "#"
	    }, "+1.604.762.6133"), React.createElement("a", {
	      "href": "#"
	    }, "I\'m ready."));
	  }
	});
	
	Base = React.createClass({
	  componentDidMount: function() {
	    return this._wps = $(ReactDOM.findDOMNode(this)).children("div").waypoint({
	      handler: function() {
	        var el;
	        el = this.element;
	        return $(el).addClass("active");
	      },
	      offset: "70%"
	    });
	  },
	  componentWillUnmount: function() {
	    return this._wps.map(function(x) {
	      return x.destroy();
	    });
	  },
	  render: function() {
	    var inputs, outputs, process;
	    console.log({
	      props: this.props
	    });
	    inputs = this.props.learnData.inputs.map(function(x, i) {
	      return React.createElement(InputImg, React.__spread({}, x, {
	        "key": i
	      }));
	    });
	    process = this.props.learnData.process.map(function(x, i) {
	      return React.createElement(InputImg, React.__spread({}, x, {
	        "key": i
	      }));
	    });
	    outputs = this.props.learnData.outputs.map(function(x, i) {
	      return React.createElement(InputImg, React.__spread({}, x, {
	        "key": i
	      }));
	    });
	    return React.createElement("div", {
	      "className": "learn"
	    }, React.createElement("div", {
	      "className": "learn-header"
	    }, React.createElement("h2", {
	      "className": "learn-header-text"
	    }, this.props.title), React.createElement("p", {
	      "className": "learn-header-description"
	    }, this.props.description)), React.createElement("div", {
	      "className": "learn-description"
	    }, React.createElement("p", null, "I\'m a description")), React.createElement("div", {
	      "className": "learn-process inputs"
	    }, inputs), React.createElement("div", {
	      "className": "learn-process math add"
	    }, React.createElement("span", null, "+")), React.createElement("div", {
	      "className": "learn-process process"
	    }, process), React.createElement("div", {
	      "className": "learn-process math equals"
	    }, React.createElement("span", null, "=")), React.createElement("div", {
	      "className": "learn-process results"
	    }, React.createElement("h3", null, this.props.learnData.result)), React.createElement("div", {
	      "className": "learn-process outputs"
	    }, outputs), React.createElement(ContactCallout, null));
	  }
	});
	
	Package = React.createClass({
	  render: function() {
	    return React.createElement("div", null, React.createElement("h2", null, "Package"));
	  }
	});
	
	module.exports = {
	  Package: Package,
	  Base: Base
	};


/***/ },
/* 51 */
/***/ function(module, exports, __webpack_require__) {

	var Q, getContent;
	
	Q = __webpack_require__(52);
	
	getContent = function() {
	  var content;
	  content = __webpack_require__(37);
	  app.content = content;
	  return console.log(app);
	};
	
	module.exports = {
	  getContent: getContent
	};


/***/ },
/* 52 */
/***/ function(module, exports) {

	module.exports = require("q");

/***/ },
/* 53 */
/***/ function(module, exports) {

	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	ga('create', 'UA-52466507-2', 'auto');
	ga('send', 'pageview');

/***/ }
/******/ ]);
//# sourceMappingURL=main.generated.js.map