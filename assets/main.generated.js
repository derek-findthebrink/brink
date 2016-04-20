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

	var app, contact, home, portfolio, product, stack, views;

	home = __webpack_require__(1);

	contact = __webpack_require__(10);

	portfolio = __webpack_require__(14);

	product = __webpack_require__(15);

	stack = __webpack_require__(20);

	app = __webpack_require__(22);

	views = {
	  home: home,
	  contact: contact,
	  portfolio: portfolio,
	  product: product,
	  stack: stack,
	  app: app
	};

	module.exports = views;


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	var BlogWidget, FeaturedProducts, Home, PageContainer, React, ReactDOM, _, error, log;

	React = __webpack_require__(2);

	ReactDOM = __webpack_require__(3);

	_ = __webpack_require__(4);

	PageContainer = __webpack_require__(5);

	BlogWidget = __webpack_require__(8);

	FeaturedProducts = __webpack_require__(9);

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
	    return React.createElement(PageContainer, React.__spread({}, home), React.createElement(BlogWidget, null), React.createElement(FeaturedProducts, null));
	  }
	});

	module.exports = Home;


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

	module.exports = require("lodash");

/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	var ContentHeader, PageContainer, React;

	React = __webpack_require__(2);

	ContentHeader = __webpack_require__(6);

	PageContainer = React.createClass({
	  propTypes: {
	    header: React.PropTypes.object,
	    children: React.PropTypes.any.isRequired
	  },
	  render: function() {
	    var cssClasses, cssFinal;
	    cssClasses = ["page"];
	    if (this.props.CSSClass) {
	      cssClasses.push(this.props.CSSClass);
	    }
	    cssFinal = cssClasses.join(" ");
	    return React.createElement("div", {
	      "className": cssFinal
	    }, React.createElement(ContentHeader, React.__spread({}, this.props.header)), this.props.children);
	  }
	});

	module.exports = PageContainer;


/***/ },
/* 6 */
/***/ function(module, exports, __webpack_require__) {

	var ContentHeader, React, styles;

	React = __webpack_require__(2);

	styles = __webpack_require__(7);

	ContentHeader = React.createClass({
	  propTypes: {
	    title: React.PropTypes.string.isRequired,
	    description: React.PropTypes.string
	  },
	  render: function() {
	    return React.createElement("div", {
	      "className": styles.container
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
/* 7 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"content-header___container__30eb9","inner":"content-header___inner__3R29O","logo":"content-header___logo__3kjkH","copy":"content-header___copy__3s-Qp"};

/***/ },
/* 8 */
/***/ function(module, exports, __webpack_require__) {

	var BlogWidget, React;

	React = __webpack_require__(2);

	BlogWidget = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": "blog-widget"
	    }, React.createElement("p", null, "I\'m a blog-widget!"));
	  }
	});

	module.exports = BlogWidget;


/***/ },
/* 9 */
/***/ function(module, exports, __webpack_require__) {

	var FeaturedProducts, React;

	React = __webpack_require__(2);

	FeaturedProducts = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": "featured-products"
	    }, React.createElement("p", null, "some featured products!"));
	  }
	});

	module.exports = FeaturedProducts;


/***/ },
/* 10 */
/***/ function(module, exports, __webpack_require__) {

	var $, ButtonField, Captcha, Contact, ContactForm, Field, LocationInfo, LocationRow, PageContainer, React, _, ref, styles;

	React = __webpack_require__(2);

	_ = __webpack_require__(4);

	$ = __webpack_require__(11);

	PageContainer = __webpack_require__(5);

	ref = __webpack_require__(12), Field = ref.Field, ButtonField = ref.ButtonField;

	styles = __webpack_require__(13);

	Captcha = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": "g-recaptcha",
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
	      "className": "contact-form",
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
	    }), React.createElement(Captcha, null), React.createElement(ButtonField, null, React.createElement("input", {
	      "type": "submit",
	      "value": "submit",
	      "onClick": this.submit
	    }), React.createElement("button", {
	      "type": "back",
	      "onClick": this.back
	    }, "back")));
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
	      "className": "location-row"
	    }, React.createElement("span", {
	      "className": "location-header"
	    }, header), React.createElement("span", {
	      "className": "location-info"
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
	      "className": "location"
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
	      "className": "form-header"
	    }, "send us a message")));
	  }
	});

	module.exports = Contact;


/***/ },
/* 11 */
/***/ function(module, exports) {

	module.exports = require("jquery");

/***/ },
/* 12 */
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
	      "className": "form-field"
	    }, React.createElement("label", {
	      "htmlFor": this.props.name
	    }, label), React.createElement("div", {
	      "className": "field"
	    }, _i));
	  }
	});

	ButtonField = React.createClass({
	  render: function() {
	    return React.createElement("div", {
	      "className": "button-field"
	    }, this.props.children);
	  }
	});

	module.exports = {
	  Field: Field,
	  ButtonField: ButtonField
	};


/***/ },
/* 13 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"contact":"contact___contact__9tnJe","page":"contact___page__3p1XK","location":"contact___location__9jLYJ","location-row":"contact___location-row__3fmLR","location-info":"contact___location-info__1Yl0H","contact-form":"contact___contact-form__1gFws","g-recaptcha":"contact___g-recaptcha__2EOlU","form-header":"contact___form-header__1wnq7","form-field":"contact___form-field__Is8am"};

/***/ },
/* 14 */
/***/ function(module, exports, __webpack_require__) {

	var $, PageContainer, Portfolio, React, _;

	React = __webpack_require__(2);

	_ = __webpack_require__(4);

	$ = __webpack_require__(11);

	PageContainer = __webpack_require__(5);

	Portfolio = React.createClass({
	  contextTypes: {
	    content: React.PropTypes.object
	  },
	  render: function() {
	    var content;
	    content = this.context.content["Portfolio"];
	    return React.createElement(PageContainer, React.__spread({}, content), React.createElement("p", null, "portfolio content here"));
	  }
	});

	module.exports = Portfolio;


/***/ },
/* 15 */
/***/ function(module, exports, __webpack_require__) {

	var $, HorizontalMenu, PageContainer, ProductItem, Products, React, ReactCSSTransitionGroup, _, k;

	React = __webpack_require__(2);

	_ = __webpack_require__(4);

	$ = __webpack_require__(11);

	ReactCSSTransitionGroup = __webpack_require__(16);

	PageContainer = __webpack_require__(5);

	HorizontalMenu = __webpack_require__(17).HorizontalMenu;

	ProductItem = React.createClass({
	  navigate: function(e) {
	    var h;
	    e.preventDefault();
	    h = e.target.href;
	    return app.flux.dispatch({
	      action: "href_navigate",
	      href: h
	    });
	  },
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
	      "className": "product-item"
	    }, React.createElement("div", {
	      "className": "img"
	    }, React.createElement("img", {
	      "src": "/brink-logo-small.svg",
	      "alt": "brink logo"
	    })), React.createElement("div", {
	      "className": "description"
	    }, React.createElement("h2", {
	      "className": "product-header"
	    }, this.props.title), React.createElement("p", {
	      "className": "summary"
	    }, this.props.description), React.createElement("div", {
	      "className": "details"
	    }, React.createElement("p", {
	      "className": "includes-header"
	    }, "includes:"), React.createElement("ul", {
	      "className": "includes"
	    }, includes), React.createElement("div", {
	      "className": "pricing"
	    }, React.createElement("span", {
	      "className": "price"
	    }, "starting at: $100"), React.createElement("span", {
	      "className": "deal"
	    }, "for you: $50"))), React.createElement("div", {
	      "className": "action-callout"
	    }, React.createElement("a", {
	      "onClick": this.navigate,
	      "href": _hrefLearn,
	      "className": "learn"
	    }, "learn more"), React.createElement("a", {
	      "onClick": this.navigate,
	      "href": _hrefContact,
	      "className": "quote"
	    }, "quote"))));
	  }
	});

	k = 0;

	Products = React.createClass({
	  contextTypes: {
	    content: React.PropTypes.object
	  },
	  render: function() {
	    var content, e, error, items, menuItems, speed;
	    content = this.context.content["Products"];
	    menuItems = [];
	    try {
	      items = content.list.map(function(x, i) {
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
	    speed = 750;
	    return React.createElement(PageContainer, React.__spread({}, content), React.createElement(HorizontalMenu, {
	      "menu": content.menu
	    }), React.createElement("ul", {
	      "className": "products-list"
	    }, React.createElement(ReactCSSTransitionGroup, {
	      "transitionName": "product-transition",
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
/* 16 */
/***/ function(module, exports) {

	module.exports = require("react-addons-css-transition-group");

/***/ },
/* 17 */
/***/ function(module, exports, __webpack_require__) {

	var CSSModules, HorizontalMenu, MenuItem, React, _HorizontalMenu, styles;

	React = __webpack_require__(2);

	CSSModules = __webpack_require__(18);

	styles = __webpack_require__(19);

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
	    }, React.createElement("a", {
	      "className": "app-nav",
	      "href": this.props.link
	    }, this.props.title));
	  }
	});

	HorizontalMenu = React.createClass({
	  componentDidMount: function() {
	    var e, error;
	    try {
	      return app.router.listeners();
	    } catch (error) {
	      e = error;
	      return console.log("click event handler initialization via router failed, retrying...");
	    }
	  },
	  render: function() {
	    var items;
	    items = this.props.menu.map(function(x, i) {
	      if (typeof location === "object" && x.link === location.pathname) {
	        return React.createElement(MenuItem, React.__spread({}, x, {
	          "key": i,
	          "addClass": "active"
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

	_HorizontalMenu = CSSModules(HorizontalMenu, styles);

	module.exports = {
	  _HorizontalMenu: _HorizontalMenu
	};


/***/ },
/* 18 */
/***/ function(module, exports) {

	module.exports = require("react-css-modules");

/***/ },
/* 19 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"horizontal":"menu___horizontal__2Y3fh","active":"menu___active__1HJO1"};

/***/ },
/* 20 */
/***/ function(module, exports, __webpack_require__) {

	var CSSModules, PageContainer, React, Stack, StackItemMain, StackItemSecondary, TradeImage, _, styles;

	React = __webpack_require__(2);

	_ = __webpack_require__(4);

	CSSModules = __webpack_require__(18);

	PageContainer = __webpack_require__(5);

	styles = __webpack_require__(21);

	console.log(styles);

	TradeImage = React.createClass({
	  render: function() {
	    var imgSrc, overlay, style;
	    imgSrc = this.props.src || "/brink-logo-small.svg";
	    if (imgSrc === "") {
	      imgSrc = "/brink-logo-small.svg";
	    }
	    style = {
	      backgroundImage: ["url(", imgSrc, ")"].join("")
	    };
	    overlay = null;
	    if (this.props.overlay) {
	      overlay = React.createElement("div", {
	        "className": styles.overlay
	      }, React.createElement("h4", {
	        "className": styles["overlay-text"]
	      }, this.props.title));
	    }
	    return React.createElement("div", {
	      "styleName": "trade"
	    }, React.createElement("a", {
	      "href": this.props.href,
	      "target": "_blank"
	    }, React.createElement("div", {
	      "className": this.props.addClass,
	      "style": style
	    }), overlay));
	  }
	});

	StackItemMain = React.createClass({
	  render: function() {
	    return React.createElement("li", null, React.createElement(TradeImage, React.__spread({
	      "addClass": styles.mainTradeImg
	    }, this.props.img, {
	      "title": this.props.title
	    })), React.createElement("div", null, React.createElement("h3", {
	      "className": styles.stackHeader
	    }, this.props.title), React.createElement("span", {
	      "className": styles.stackDescription
	    }, this.props.description)));
	  }
	});

	StackItemSecondary = React.createClass({
	  render: function() {
	    return React.createElement("li", null, React.createElement(TradeImage, React.__spread({}, this.props.img, {
	      "addClass": styles.secondaryTradeImg,
	      "title": this.props.title,
	      "overlay": true
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
/* 21 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"listMain":"stack___listMain__gde13","listSecondary":"stack___listSecondary__3NcR0","overlay":"stack___overlay__2sKFo","trade":"stack___trade__3ALzx","mainTradeImg":"stack___mainTradeImg__1DM9e","secondaryTradeImg":"stack___secondaryTradeImg__3DbtU","stackHeader":"stack___stackHeader__ORmWE","stackDescription":"stack___stackDescription__27a0u","overlay-text":"stack___overlay-text__36bZh"};

/***/ },
/* 22 */
/***/ function(module, exports, __webpack_require__) {

	var App, Footer, Header, Link, React, content;

	React = __webpack_require__(2);

	Link = __webpack_require__(23).Link;

	Footer = __webpack_require__(24);

	Header = __webpack_require__(26);

	content = __webpack_require__(30);

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
/* 23 */
/***/ function(module, exports) {

	module.exports = require("react-router");

/***/ },
/* 24 */
/***/ function(module, exports, __webpack_require__) {

	var Footer, React, styles;

	React = __webpack_require__(2);

	styles = __webpack_require__(25);

	Footer = React.createClass({
	  render: function() {
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
	      "href": "javascript:void(0)"
	    }, "Facebook")), React.createElement("li", null, React.createElement("a", {
	      "href": "javascript:void(0)"
	    }, "Twitter")), React.createElement("li", null, React.createElement("a", {
	      "href": "javascript:void(0)"
	    }, "YouTube"))), React.createElement("ul", {
	      "className": styles.linkList
	    }, React.createElement("li", null, React.createElement("h3", null, "Content")), React.createElement("li", null, React.createElement("a", {
	      "href": "javascript:void(0)"
	    }, "About")), React.createElement("li", null, React.createElement("a", {
	      "href": "javascript:void(0)"
	    }, "Contact")), React.createElement("li", null, React.createElement("a", {
	      "href": "javascript:void(0)"
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
/* 25 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"container":"refills_footer___container__spV9d","logo":"refills_footer___logo__3zvgg","linksContainer":"refills_footer___linksContainer__1ytpy","linkList":"refills_footer___linkList__1IfG6"};

/***/ },
/* 26 */
/***/ function(module, exports, __webpack_require__) {

	var CSSModules, Header, Link, Nav, React, styles;

	React = __webpack_require__(2);

	Link = __webpack_require__(23).Link;

	CSSModules = __webpack_require__(18);

	Nav = __webpack_require__(27);

	styles = __webpack_require__(29);

	Header = React.createClass({
	  render: function() {
	    return React.createElement("header", {
	      "className": styles.app
	    }, React.createElement(Link, {
	      "to": "/"
	    }, React.createElement("h1", {
	      "className": styles.header
	    }, "brink technology co.")), React.createElement(Nav, null));
	  }
	});

	module.exports = CSSModules(Header, styles);


/***/ },
/* 27 */
/***/ function(module, exports, __webpack_require__) {

	var Link, Nav, React, styles;

	React = __webpack_require__(2);

	Link = __webpack_require__(23).Link;

	styles = __webpack_require__(28);

	Nav = React.createClass({
	  render: function() {
	    return React.createElement("nav", {
	      "className": styles.main
	    }, React.createElement("ul", null, React.createElement("li", null, React.createElement(Link, {
	      "to": "/portfolio"
	    }, "portfolio")), React.createElement("li", null, React.createElement(Link, {
	      "to": "/stack"
	    }, "stack")), React.createElement("li", null, React.createElement(Link, {
	      "to": "/products-and-services"
	    }, "products")), React.createElement("li", null, React.createElement(Link, {
	      "to": "/contact"
	    }, "contact"))));
	  }
	});

	module.exports = Nav;


/***/ },
/* 28 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"main":"main-nav___main__1HWc-"};

/***/ },
/* 29 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin
	module.exports = {"app":"header___app__3p2me","header":"header___header__2ZUVm"};

/***/ },
/* 30 */
/***/ function(module, exports) {

	var Contact, Home, ImgCreator, Portfolio, Products, Stack;

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
	    title: "ambitions javascript design",
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
	      description: "a super cool javascript-based server platform",
	      secondary: false
	    }, {
	      title: "MongoDB",
	      img: {
	        src: "http://s3.amazonaws.com/info-mongodb-com/_com_assets/media/mongodb-logo-rgb.jpeg",
	        alt: "MongoDB logo",
	        href: "https://www.mongodb.org/"
	      },
	      description: "a super cool key-value store",
	      secondary: false
	    }, {
	      title: "ReactJS",
	      img: {
	        src: "http://red-badger.com/blog/wp-content/uploads/2015/04/react-logo-1000-transparent.png",
	        alt: "ReactJS Logo",
	        href: "https://facebook.github.io/react/"
	      },
	      description: "a high-performance javascript rendering library",
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
	      link: "/products-and-services"
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
	      includes: ["static website"],
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
	      includes: ["two emails", "unlimited aliases", "high-quality interface"],
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
	      includes: ["one email", "unlimited aliases"],
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
	    description: "how to get in touch with us"
	  },
	  location: {
	    city: "vancouver, bc",
	    country: "canada",
	    phone: "+16047626133"
	  }
	};

	module.exports = {
	  Home: Home,
	  Portfolio: Portfolio,
	  Stack: Stack,
	  Products: Products,
	  Contact: Contact
	};


/***/ }
/******/ ]);