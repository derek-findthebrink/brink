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

	console.log("polyfills loading...");

	__webpack_require__(841);

	__webpack_require__(839);

	__webpack_require__(840);


/***/ },

/***/ 1:
/***/ function(module, exports) {

	// shim for using process in browser

	var process = module.exports = {};
	var queue = [];
	var draining = false;
	var currentQueue;
	var queueIndex = -1;

	function cleanUpNextTick() {
	    if (!draining || !currentQueue) {
	        return;
	    }
	    draining = false;
	    if (currentQueue.length) {
	        queue = currentQueue.concat(queue);
	    } else {
	        queueIndex = -1;
	    }
	    if (queue.length) {
	        drainQueue();
	    }
	}

	function drainQueue() {
	    if (draining) {
	        return;
	    }
	    var timeout = setTimeout(cleanUpNextTick);
	    draining = true;

	    var len = queue.length;
	    while(len) {
	        currentQueue = queue;
	        queue = [];
	        while (++queueIndex < len) {
	            if (currentQueue) {
	                currentQueue[queueIndex].run();
	            }
	        }
	        queueIndex = -1;
	        len = queue.length;
	    }
	    currentQueue = null;
	    draining = false;
	    clearTimeout(timeout);
	}

	process.nextTick = function (fun) {
	    var args = new Array(arguments.length - 1);
	    if (arguments.length > 1) {
	        for (var i = 1; i < arguments.length; i++) {
	            args[i - 1] = arguments[i];
	        }
	    }
	    queue.push(new Item(fun, args));
	    if (queue.length === 1 && !draining) {
	        setTimeout(drainQueue, 0);
	    }
	};

	// v8 likes predictible objects
	function Item(fun, array) {
	    this.fun = fun;
	    this.array = array;
	}
	Item.prototype.run = function () {
	    this.fun.apply(null, this.array);
	};
	process.title = 'browser';
	process.browser = true;
	process.env = {};
	process.argv = [];
	process.version = ''; // empty string to avoid regexp issues
	process.versions = {};

	function noop() {}

	process.on = noop;
	process.addListener = noop;
	process.once = noop;
	process.off = noop;
	process.removeListener = noop;
	process.removeAllListeners = noop;
	process.emit = noop;

	process.binding = function (name) {
	    throw new Error('process.binding is not supported');
	};

	process.cwd = function () { return '/' };
	process.chdir = function (dir) {
	    throw new Error('process.chdir is not supported');
	};
	process.umask = function() { return 0; };


/***/ },

/***/ 73:
/***/ function(module, exports) {

	module.exports = function(module) {
		if(!module.webpackPolyfill) {
			module.deprecate = function() {};
			module.paths = [];
			// module.parent = undefined by default
			module.children = [];
			module.webpackPolyfill = 1;
		}
		return module;
	}


/***/ },

/***/ 316:
/***/ function(module, exports) {

	module.exports = function() { throw new Error("define cannot be used indirect"); };


/***/ },

/***/ 839:
/***/ function(module, exports, __webpack_require__) {

	var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_RESULT__;/*!
	 * https://github.com/es-shims/es5-shim
	 * @license es5-shim Copyright 2009-2015 by contributors, MIT License
	 * see https://github.com/es-shims/es5-shim/blob/master/LICENSE
	 */

	// vim: ts=4 sts=4 sw=4 expandtab

	// Add semicolon to prevent IIFE from being passed as argument to concatenated code.
	;

	// UMD (Universal Module Definition)
	// see https://github.com/umdjs/umd/blob/master/templates/returnExports.js
	(function (root, factory) {
	    'use strict';

	    /* global define, exports, module */
	    if (true) {
	        // AMD. Register as an anonymous module.
	        !(__WEBPACK_AMD_DEFINE_FACTORY__ = (factory), __WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ? (__WEBPACK_AMD_DEFINE_FACTORY__.call(exports, __webpack_require__, exports, module)) : __WEBPACK_AMD_DEFINE_FACTORY__), __WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
	    } else if (typeof exports === 'object') {
	        // Node. Does not work with strict CommonJS, but
	        // only CommonJS-like enviroments that support module.exports,
	        // like Node.
	        module.exports = factory();
	    } else {
	        // Browser globals (root is window)
	        root.returnExports = factory();
	    }
	}(this, function () {

	/**
	 * Brings an environment as close to ECMAScript 5 compliance
	 * as is possible with the facilities of erstwhile engines.
	 *
	 * Annotated ES5: http://es5.github.com/ (specific links below)
	 * ES5 Spec: http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf
	 * Required reading: http://javascriptweblog.wordpress.com/2011/12/05/extending-javascript-natives/
	 */

	// Shortcut to an often accessed properties, in order to avoid multiple
	// dereference that costs universally. This also holds a reference to known-good
	// functions.
	var $Array = Array;
	var ArrayPrototype = $Array.prototype;
	var $Object = Object;
	var ObjectPrototype = $Object.prototype;
	var $Function = Function;
	var FunctionPrototype = $Function.prototype;
	var $String = String;
	var StringPrototype = $String.prototype;
	var $Number = Number;
	var NumberPrototype = $Number.prototype;
	var array_slice = ArrayPrototype.slice;
	var array_splice = ArrayPrototype.splice;
	var array_push = ArrayPrototype.push;
	var array_unshift = ArrayPrototype.unshift;
	var array_concat = ArrayPrototype.concat;
	var array_join = ArrayPrototype.join;
	var call = FunctionPrototype.call;
	var apply = FunctionPrototype.apply;
	var max = Math.max;
	var min = Math.min;

	// Having a toString local variable name breaks in Opera so use to_string.
	var to_string = ObjectPrototype.toString;

	/* global Symbol */
	/* eslint-disable one-var-declaration-per-line, no-redeclare, max-statements-per-line */
	var hasToStringTag = typeof Symbol === 'function' && typeof Symbol.toStringTag === 'symbol';
	var isCallable; /* inlined from https://npmjs.com/is-callable */ var fnToStr = Function.prototype.toString, constructorRegex = /^\s*class /, isES6ClassFn = function isES6ClassFn(value) { try { var fnStr = fnToStr.call(value); var singleStripped = fnStr.replace(/\/\/.*\n/g, ''); var multiStripped = singleStripped.replace(/\/\*[.\s\S]*\*\//g, ''); var spaceStripped = multiStripped.replace(/\n/mg, ' ').replace(/ {2}/g, ' '); return constructorRegex.test(spaceStripped); } catch (e) { return false; /* not a function */ } }, tryFunctionObject = function tryFunctionObject(value) { try { if (isES6ClassFn(value)) { return false; } fnToStr.call(value); return true; } catch (e) { return false; } }, fnClass = '[object Function]', genClass = '[object GeneratorFunction]', isCallable = function isCallable(value) { if (!value) { return false; } if (typeof value !== 'function' && typeof value !== 'object') { return false; } if (hasToStringTag) { return tryFunctionObject(value); } if (isES6ClassFn(value)) { return false; } var strClass = to_string.call(value); return strClass === fnClass || strClass === genClass; };

	var isRegex; /* inlined from https://npmjs.com/is-regex */ var regexExec = RegExp.prototype.exec, tryRegexExec = function tryRegexExec(value) { try { regexExec.call(value); return true; } catch (e) { return false; } }, regexClass = '[object RegExp]'; isRegex = function isRegex(value) { if (typeof value !== 'object') { return false; } return hasToStringTag ? tryRegexExec(value) : to_string.call(value) === regexClass; };
	var isString; /* inlined from https://npmjs.com/is-string */ var strValue = String.prototype.valueOf, tryStringObject = function tryStringObject(value) { try { strValue.call(value); return true; } catch (e) { return false; } }, stringClass = '[object String]'; isString = function isString(value) { if (typeof value === 'string') { return true; } if (typeof value !== 'object') { return false; } return hasToStringTag ? tryStringObject(value) : to_string.call(value) === stringClass; };
	/* eslint-enable one-var-declaration-per-line, no-redeclare, max-statements-per-line */

	/* inlined from http://npmjs.com/define-properties */
	var supportsDescriptors = $Object.defineProperty && (function () {
	    try {
	        var obj = {};
	        $Object.defineProperty(obj, 'x', { enumerable: false, value: obj });
	        for (var _ in obj) { return false; }
	        return obj.x === obj;
	    } catch (e) { /* this is ES3 */
	        return false;
	    }
	}());
	var defineProperties = (function (has) {
	  // Define configurable, writable, and non-enumerable props
	  // if they don't exist.
	  var defineProperty;
	  if (supportsDescriptors) {
	      defineProperty = function (object, name, method, forceAssign) {
	          if (!forceAssign && (name in object)) { return; }
	          $Object.defineProperty(object, name, {
	              configurable: true,
	              enumerable: false,
	              writable: true,
	              value: method
	          });
	      };
	  } else {
	      defineProperty = function (object, name, method, forceAssign) {
	          if (!forceAssign && (name in object)) { return; }
	          object[name] = method;
	      };
	  }
	  return function defineProperties(object, map, forceAssign) {
	      for (var name in map) {
	          if (has.call(map, name)) {
	            defineProperty(object, name, map[name], forceAssign);
	          }
	      }
	  };
	}(ObjectPrototype.hasOwnProperty));

	//
	// Util
	// ======
	//

	/* replaceable with https://npmjs.com/package/es-abstract /helpers/isPrimitive */
	var isPrimitive = function isPrimitive(input) {
	    var type = typeof input;
	    return input === null || (type !== 'object' && type !== 'function');
	};

	var isActualNaN = $Number.isNaN || function (x) { return x !== x; };

	var ES = {
	    // ES5 9.4
	    // http://es5.github.com/#x9.4
	    // http://jsperf.com/to-integer
	    /* replaceable with https://npmjs.com/package/es-abstract ES5.ToInteger */
	    ToInteger: function ToInteger(num) {
	        var n = +num;
	        if (isActualNaN(n)) {
	            n = 0;
	        } else if (n !== 0 && n !== (1 / 0) && n !== -(1 / 0)) {
	            n = (n > 0 || -1) * Math.floor(Math.abs(n));
	        }
	        return n;
	    },

	    /* replaceable with https://npmjs.com/package/es-abstract ES5.ToPrimitive */
	    ToPrimitive: function ToPrimitive(input) {
	        var val, valueOf, toStr;
	        if (isPrimitive(input)) {
	            return input;
	        }
	        valueOf = input.valueOf;
	        if (isCallable(valueOf)) {
	            val = valueOf.call(input);
	            if (isPrimitive(val)) {
	                return val;
	            }
	        }
	        toStr = input.toString;
	        if (isCallable(toStr)) {
	            val = toStr.call(input);
	            if (isPrimitive(val)) {
	                return val;
	            }
	        }
	        throw new TypeError();
	    },

	    // ES5 9.9
	    // http://es5.github.com/#x9.9
	    /* replaceable with https://npmjs.com/package/es-abstract ES5.ToObject */
	    ToObject: function (o) {
	        if (o == null) { // this matches both null and undefined
	            throw new TypeError("can't convert " + o + ' to object');
	        }
	        return $Object(o);
	    },

	    /* replaceable with https://npmjs.com/package/es-abstract ES5.ToUint32 */
	    ToUint32: function ToUint32(x) {
	        return x >>> 0;
	    }
	};

	//
	// Function
	// ========
	//

	// ES-5 15.3.4.5
	// http://es5.github.com/#x15.3.4.5

	var Empty = function Empty() {};

	defineProperties(FunctionPrototype, {
	    bind: function bind(that) { // .length is 1
	        // 1. Let Target be the this value.
	        var target = this;
	        // 2. If IsCallable(Target) is false, throw a TypeError exception.
	        if (!isCallable(target)) {
	            throw new TypeError('Function.prototype.bind called on incompatible ' + target);
	        }
	        // 3. Let A be a new (possibly empty) internal list of all of the
	        //   argument values provided after thisArg (arg1, arg2 etc), in order.
	        // XXX slicedArgs will stand in for "A" if used
	        var args = array_slice.call(arguments, 1); // for normal call
	        // 4. Let F be a new native ECMAScript object.
	        // 11. Set the [[Prototype]] internal property of F to the standard
	        //   built-in Function prototype object as specified in 15.3.3.1.
	        // 12. Set the [[Call]] internal property of F as described in
	        //   15.3.4.5.1.
	        // 13. Set the [[Construct]] internal property of F as described in
	        //   15.3.4.5.2.
	        // 14. Set the [[HasInstance]] internal property of F as described in
	        //   15.3.4.5.3.
	        var bound;
	        var binder = function () {

	            if (this instanceof bound) {
	                // 15.3.4.5.2 [[Construct]]
	                // When the [[Construct]] internal method of a function object,
	                // F that was created using the bind function is called with a
	                // list of arguments ExtraArgs, the following steps are taken:
	                // 1. Let target be the value of F's [[TargetFunction]]
	                //   internal property.
	                // 2. If target has no [[Construct]] internal method, a
	                //   TypeError exception is thrown.
	                // 3. Let boundArgs be the value of F's [[BoundArgs]] internal
	                //   property.
	                // 4. Let args be a new list containing the same values as the
	                //   list boundArgs in the same order followed by the same
	                //   values as the list ExtraArgs in the same order.
	                // 5. Return the result of calling the [[Construct]] internal
	                //   method of target providing args as the arguments.

	                var result = apply.call(
	                    target,
	                    this,
	                    array_concat.call(args, array_slice.call(arguments))
	                );
	                if ($Object(result) === result) {
	                    return result;
	                }
	                return this;

	            } else {
	                // 15.3.4.5.1 [[Call]]
	                // When the [[Call]] internal method of a function object, F,
	                // which was created using the bind function is called with a
	                // this value and a list of arguments ExtraArgs, the following
	                // steps are taken:
	                // 1. Let boundArgs be the value of F's [[BoundArgs]] internal
	                //   property.
	                // 2. Let boundThis be the value of F's [[BoundThis]] internal
	                //   property.
	                // 3. Let target be the value of F's [[TargetFunction]] internal
	                //   property.
	                // 4. Let args be a new list containing the same values as the
	                //   list boundArgs in the same order followed by the same
	                //   values as the list ExtraArgs in the same order.
	                // 5. Return the result of calling the [[Call]] internal method
	                //   of target providing boundThis as the this value and
	                //   providing args as the arguments.

	                // equiv: target.call(this, ...boundArgs, ...args)
	                return apply.call(
	                    target,
	                    that,
	                    array_concat.call(args, array_slice.call(arguments))
	                );

	            }

	        };

	        // 15. If the [[Class]] internal property of Target is "Function", then
	        //     a. Let L be the length property of Target minus the length of A.
	        //     b. Set the length own property of F to either 0 or L, whichever is
	        //       larger.
	        // 16. Else set the length own property of F to 0.

	        var boundLength = max(0, target.length - args.length);

	        // 17. Set the attributes of the length own property of F to the values
	        //   specified in 15.3.5.1.
	        var boundArgs = [];
	        for (var i = 0; i < boundLength; i++) {
	            array_push.call(boundArgs, '$' + i);
	        }

	        // XXX Build a dynamic function with desired amount of arguments is the only
	        // way to set the length property of a function.
	        // In environments where Content Security Policies enabled (Chrome extensions,
	        // for ex.) all use of eval or Function costructor throws an exception.
	        // However in all of these environments Function.prototype.bind exists
	        // and so this code will never be executed.
	        bound = $Function('binder', 'return function (' + array_join.call(boundArgs, ',') + '){ return binder.apply(this, arguments); }')(binder);

	        if (target.prototype) {
	            Empty.prototype = target.prototype;
	            bound.prototype = new Empty();
	            // Clean up dangling references.
	            Empty.prototype = null;
	        }

	        // TODO
	        // 18. Set the [[Extensible]] internal property of F to true.

	        // TODO
	        // 19. Let thrower be the [[ThrowTypeError]] function Object (13.2.3).
	        // 20. Call the [[DefineOwnProperty]] internal method of F with
	        //   arguments "caller", PropertyDescriptor {[[Get]]: thrower, [[Set]]:
	        //   thrower, [[Enumerable]]: false, [[Configurable]]: false}, and
	        //   false.
	        // 21. Call the [[DefineOwnProperty]] internal method of F with
	        //   arguments "arguments", PropertyDescriptor {[[Get]]: thrower,
	        //   [[Set]]: thrower, [[Enumerable]]: false, [[Configurable]]: false},
	        //   and false.

	        // TODO
	        // NOTE Function objects created using Function.prototype.bind do not
	        // have a prototype property or the [[Code]], [[FormalParameters]], and
	        // [[Scope]] internal properties.
	        // XXX can't delete prototype in pure-js.

	        // 22. Return F.
	        return bound;
	    }
	});

	// _Please note: Shortcuts are defined after `Function.prototype.bind` as we
	// use it in defining shortcuts.
	var owns = call.bind(ObjectPrototype.hasOwnProperty);
	var toStr = call.bind(ObjectPrototype.toString);
	var arraySlice = call.bind(array_slice);
	var arraySliceApply = apply.bind(array_slice);
	var strSlice = call.bind(StringPrototype.slice);
	var strSplit = call.bind(StringPrototype.split);
	var strIndexOf = call.bind(StringPrototype.indexOf);
	var pushCall = call.bind(array_push);
	var isEnum = call.bind(ObjectPrototype.propertyIsEnumerable);
	var arraySort = call.bind(ArrayPrototype.sort);

	//
	// Array
	// =====
	//

	var isArray = $Array.isArray || function isArray(obj) {
	    return toStr(obj) === '[object Array]';
	};

	// ES5 15.4.4.12
	// http://es5.github.com/#x15.4.4.13
	// Return len+argCount.
	// [bugfix, ielt8]
	// IE < 8 bug: [].unshift(0) === undefined but should be "1"
	var hasUnshiftReturnValueBug = [].unshift(0) !== 1;
	defineProperties(ArrayPrototype, {
	    unshift: function () {
	        array_unshift.apply(this, arguments);
	        return this.length;
	    }
	}, hasUnshiftReturnValueBug);

	// ES5 15.4.3.2
	// http://es5.github.com/#x15.4.3.2
	// https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Array/isArray
	defineProperties($Array, { isArray: isArray });

	// The IsCallable() check in the Array functions
	// has been replaced with a strict check on the
	// internal class of the object to trap cases where
	// the provided function was actually a regular
	// expression literal, which in V8 and
	// JavaScriptCore is a typeof "function".  Only in
	// V8 are regular expression literals permitted as
	// reduce parameters, so it is desirable in the
	// general case for the shim to match the more
	// strict and common behavior of rejecting regular
	// expressions.

	// ES5 15.4.4.18
	// http://es5.github.com/#x15.4.4.18
	// https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/array/forEach

	// Check failure of by-index access of string characters (IE < 9)
	// and failure of `0 in boxedString` (Rhino)
	var boxedString = $Object('a');
	var splitString = boxedString[0] !== 'a' || !(0 in boxedString);

	var properlyBoxesContext = function properlyBoxed(method) {
	    // Check node 0.6.21 bug where third parameter is not boxed
	    var properlyBoxesNonStrict = true;
	    var properlyBoxesStrict = true;
	    var threwException = false;
	    if (method) {
	        try {
	            method.call('foo', function (_, __, context) {
	                if (typeof context !== 'object') {
	                    properlyBoxesNonStrict = false;
	                }
	            });

	            method.call([1], function () {
	                'use strict';

	                properlyBoxesStrict = typeof this === 'string';
	            }, 'x');
	        } catch (e) {
	            threwException = true;
	        }
	    }
	    return !!method && !threwException && properlyBoxesNonStrict && properlyBoxesStrict;
	};

	defineProperties(ArrayPrototype, {
	    forEach: function forEach(callbackfn/*, thisArg*/) {
	        var object = ES.ToObject(this);
	        var self = splitString && isString(this) ? strSplit(this, '') : object;
	        var i = -1;
	        var length = ES.ToUint32(self.length);
	        var T;
	        if (arguments.length > 1) {
	          T = arguments[1];
	        }

	        // If no callback function or if callback is not a callable function
	        if (!isCallable(callbackfn)) {
	            throw new TypeError('Array.prototype.forEach callback must be a function');
	        }

	        while (++i < length) {
	            if (i in self) {
	                // Invoke the callback function with call, passing arguments:
	                // context, property value, property key, thisArg object
	                if (typeof T === 'undefined') {
	                    callbackfn(self[i], i, object);
	                } else {
	                    callbackfn.call(T, self[i], i, object);
	                }
	            }
	        }
	    }
	}, !properlyBoxesContext(ArrayPrototype.forEach));

	// ES5 15.4.4.19
	// http://es5.github.com/#x15.4.4.19
	// https://developer.mozilla.org/en/Core_JavaScript_1.5_Reference/Objects/Array/map
	defineProperties(ArrayPrototype, {
	    map: function map(callbackfn/*, thisArg*/) {
	        var object = ES.ToObject(this);
	        var self = splitString && isString(this) ? strSplit(this, '') : object;
	        var length = ES.ToUint32(self.length);
	        var result = $Array(length);
	        var T;
	        if (arguments.length > 1) {
	            T = arguments[1];
	        }

	        // If no callback function or if callback is not a callable function
	        if (!isCallable(callbackfn)) {
	            throw new TypeError('Array.prototype.map callback must be a function');
	        }

	        for (var i = 0; i < length; i++) {
	            if (i in self) {
	                if (typeof T === 'undefined') {
	                    result[i] = callbackfn(self[i], i, object);
	                } else {
	                    result[i] = callbackfn.call(T, self[i], i, object);
	                }
	            }
	        }
	        return result;
	    }
	}, !properlyBoxesContext(ArrayPrototype.map));

	// ES5 15.4.4.20
	// http://es5.github.com/#x15.4.4.20
	// https://developer.mozilla.org/en/Core_JavaScript_1.5_Reference/Objects/Array/filter
	defineProperties(ArrayPrototype, {
	    filter: function filter(callbackfn/*, thisArg*/) {
	        var object = ES.ToObject(this);
	        var self = splitString && isString(this) ? strSplit(this, '') : object;
	        var length = ES.ToUint32(self.length);
	        var result = [];
	        var value;
	        var T;
	        if (arguments.length > 1) {
	            T = arguments[1];
	        }

	        // If no callback function or if callback is not a callable function
	        if (!isCallable(callbackfn)) {
	            throw new TypeError('Array.prototype.filter callback must be a function');
	        }

	        for (var i = 0; i < length; i++) {
	            if (i in self) {
	                value = self[i];
	                if (typeof T === 'undefined' ? callbackfn(value, i, object) : callbackfn.call(T, value, i, object)) {
	                    pushCall(result, value);
	                }
	            }
	        }
	        return result;
	    }
	}, !properlyBoxesContext(ArrayPrototype.filter));

	// ES5 15.4.4.16
	// http://es5.github.com/#x15.4.4.16
	// https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Array/every
	defineProperties(ArrayPrototype, {
	    every: function every(callbackfn/*, thisArg*/) {
	        var object = ES.ToObject(this);
	        var self = splitString && isString(this) ? strSplit(this, '') : object;
	        var length = ES.ToUint32(self.length);
	        var T;
	        if (arguments.length > 1) {
	            T = arguments[1];
	        }

	        // If no callback function or if callback is not a callable function
	        if (!isCallable(callbackfn)) {
	            throw new TypeError('Array.prototype.every callback must be a function');
	        }

	        for (var i = 0; i < length; i++) {
	            if (i in self && !(typeof T === 'undefined' ? callbackfn(self[i], i, object) : callbackfn.call(T, self[i], i, object))) {
	                return false;
	            }
	        }
	        return true;
	    }
	}, !properlyBoxesContext(ArrayPrototype.every));

	// ES5 15.4.4.17
	// http://es5.github.com/#x15.4.4.17
	// https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Array/some
	defineProperties(ArrayPrototype, {
	    some: function some(callbackfn/*, thisArg */) {
	        var object = ES.ToObject(this);
	        var self = splitString && isString(this) ? strSplit(this, '') : object;
	        var length = ES.ToUint32(self.length);
	        var T;
	        if (arguments.length > 1) {
	            T = arguments[1];
	        }

	        // If no callback function or if callback is not a callable function
	        if (!isCallable(callbackfn)) {
	            throw new TypeError('Array.prototype.some callback must be a function');
	        }

	        for (var i = 0; i < length; i++) {
	            if (i in self && (typeof T === 'undefined' ? callbackfn(self[i], i, object) : callbackfn.call(T, self[i], i, object))) {
	                return true;
	            }
	        }
	        return false;
	    }
	}, !properlyBoxesContext(ArrayPrototype.some));

	// ES5 15.4.4.21
	// http://es5.github.com/#x15.4.4.21
	// https://developer.mozilla.org/en/Core_JavaScript_1.5_Reference/Objects/Array/reduce
	var reduceCoercesToObject = false;
	if (ArrayPrototype.reduce) {
	    reduceCoercesToObject = typeof ArrayPrototype.reduce.call('es5', function (_, __, ___, list) {
	        return list;
	    }) === 'object';
	}
	defineProperties(ArrayPrototype, {
	    reduce: function reduce(callbackfn/*, initialValue*/) {
	        var object = ES.ToObject(this);
	        var self = splitString && isString(this) ? strSplit(this, '') : object;
	        var length = ES.ToUint32(self.length);

	        // If no callback function or if callback is not a callable function
	        if (!isCallable(callbackfn)) {
	            throw new TypeError('Array.prototype.reduce callback must be a function');
	        }

	        // no value to return if no initial value and an empty array
	        if (length === 0 && arguments.length === 1) {
	            throw new TypeError('reduce of empty array with no initial value');
	        }

	        var i = 0;
	        var result;
	        if (arguments.length >= 2) {
	            result = arguments[1];
	        } else {
	            do {
	                if (i in self) {
	                    result = self[i++];
	                    break;
	                }

	                // if array contains no values, no initial value to return
	                if (++i >= length) {
	                    throw new TypeError('reduce of empty array with no initial value');
	                }
	            } while (true);
	        }

	        for (; i < length; i++) {
	            if (i in self) {
	                result = callbackfn(result, self[i], i, object);
	            }
	        }

	        return result;
	    }
	}, !reduceCoercesToObject);

	// ES5 15.4.4.22
	// http://es5.github.com/#x15.4.4.22
	// https://developer.mozilla.org/en/Core_JavaScript_1.5_Reference/Objects/Array/reduceRight
	var reduceRightCoercesToObject = false;
	if (ArrayPrototype.reduceRight) {
	    reduceRightCoercesToObject = typeof ArrayPrototype.reduceRight.call('es5', function (_, __, ___, list) {
	        return list;
	    }) === 'object';
	}
	defineProperties(ArrayPrototype, {
	    reduceRight: function reduceRight(callbackfn/*, initial*/) {
	        var object = ES.ToObject(this);
	        var self = splitString && isString(this) ? strSplit(this, '') : object;
	        var length = ES.ToUint32(self.length);

	        // If no callback function or if callback is not a callable function
	        if (!isCallable(callbackfn)) {
	            throw new TypeError('Array.prototype.reduceRight callback must be a function');
	        }

	        // no value to return if no initial value, empty array
	        if (length === 0 && arguments.length === 1) {
	            throw new TypeError('reduceRight of empty array with no initial value');
	        }

	        var result;
	        var i = length - 1;
	        if (arguments.length >= 2) {
	            result = arguments[1];
	        } else {
	            do {
	                if (i in self) {
	                    result = self[i--];
	                    break;
	                }

	                // if array contains no values, no initial value to return
	                if (--i < 0) {
	                    throw new TypeError('reduceRight of empty array with no initial value');
	                }
	            } while (true);
	        }

	        if (i < 0) {
	            return result;
	        }

	        do {
	            if (i in self) {
	                result = callbackfn(result, self[i], i, object);
	            }
	        } while (i--);

	        return result;
	    }
	}, !reduceRightCoercesToObject);

	// ES5 15.4.4.14
	// http://es5.github.com/#x15.4.4.14
	// https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Array/indexOf
	var hasFirefox2IndexOfBug = ArrayPrototype.indexOf && [0, 1].indexOf(1, 2) !== -1;
	defineProperties(ArrayPrototype, {
	    indexOf: function indexOf(searchElement/*, fromIndex */) {
	        var self = splitString && isString(this) ? strSplit(this, '') : ES.ToObject(this);
	        var length = ES.ToUint32(self.length);

	        if (length === 0) {
	            return -1;
	        }

	        var i = 0;
	        if (arguments.length > 1) {
	            i = ES.ToInteger(arguments[1]);
	        }

	        // handle negative indices
	        i = i >= 0 ? i : max(0, length + i);
	        for (; i < length; i++) {
	            if (i in self && self[i] === searchElement) {
	                return i;
	            }
	        }
	        return -1;
	    }
	}, hasFirefox2IndexOfBug);

	// ES5 15.4.4.15
	// http://es5.github.com/#x15.4.4.15
	// https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Array/lastIndexOf
	var hasFirefox2LastIndexOfBug = ArrayPrototype.lastIndexOf && [0, 1].lastIndexOf(0, -3) !== -1;
	defineProperties(ArrayPrototype, {
	    lastIndexOf: function lastIndexOf(searchElement/*, fromIndex */) {
	        var self = splitString && isString(this) ? strSplit(this, '') : ES.ToObject(this);
	        var length = ES.ToUint32(self.length);

	        if (length === 0) {
	            return -1;
	        }
	        var i = length - 1;
	        if (arguments.length > 1) {
	            i = min(i, ES.ToInteger(arguments[1]));
	        }
	        // handle negative indices
	        i = i >= 0 ? i : length - Math.abs(i);
	        for (; i >= 0; i--) {
	            if (i in self && searchElement === self[i]) {
	                return i;
	            }
	        }
	        return -1;
	    }
	}, hasFirefox2LastIndexOfBug);

	// ES5 15.4.4.12
	// http://es5.github.com/#x15.4.4.12
	var spliceNoopReturnsEmptyArray = (function () {
	    var a = [1, 2];
	    var result = a.splice();
	    return a.length === 2 && isArray(result) && result.length === 0;
	}());
	defineProperties(ArrayPrototype, {
	    // Safari 5.0 bug where .splice() returns undefined
	    splice: function splice(start, deleteCount) {
	        if (arguments.length === 0) {
	            return [];
	        } else {
	            return array_splice.apply(this, arguments);
	        }
	    }
	}, !spliceNoopReturnsEmptyArray);

	var spliceWorksWithEmptyObject = (function () {
	    var obj = {};
	    ArrayPrototype.splice.call(obj, 0, 0, 1);
	    return obj.length === 1;
	}());
	defineProperties(ArrayPrototype, {
	    splice: function splice(start, deleteCount) {
	        if (arguments.length === 0) { return []; }
	        var args = arguments;
	        this.length = max(ES.ToInteger(this.length), 0);
	        if (arguments.length > 0 && typeof deleteCount !== 'number') {
	            args = arraySlice(arguments);
	            if (args.length < 2) {
	                pushCall(args, this.length - start);
	            } else {
	                args[1] = ES.ToInteger(deleteCount);
	            }
	        }
	        return array_splice.apply(this, args);
	    }
	}, !spliceWorksWithEmptyObject);
	var spliceWorksWithLargeSparseArrays = (function () {
	    // Per https://github.com/es-shims/es5-shim/issues/295
	    // Safari 7/8 breaks with sparse arrays of size 1e5 or greater
	    var arr = new $Array(1e5);
	    // note: the index MUST be 8 or larger or the test will false pass
	    arr[8] = 'x';
	    arr.splice(1, 1);
	    // note: this test must be defined *after* the indexOf shim
	    // per https://github.com/es-shims/es5-shim/issues/313
	    return arr.indexOf('x') === 7;
	}());
	var spliceWorksWithSmallSparseArrays = (function () {
	    // Per https://github.com/es-shims/es5-shim/issues/295
	    // Opera 12.15 breaks on this, no idea why.
	    var n = 256;
	    var arr = [];
	    arr[n] = 'a';
	    arr.splice(n + 1, 0, 'b');
	    return arr[n] === 'a';
	}());
	defineProperties(ArrayPrototype, {
	    splice: function splice(start, deleteCount) {
	        var O = ES.ToObject(this);
	        var A = [];
	        var len = ES.ToUint32(O.length);
	        var relativeStart = ES.ToInteger(start);
	        var actualStart = relativeStart < 0 ? max((len + relativeStart), 0) : min(relativeStart, len);
	        var actualDeleteCount = min(max(ES.ToInteger(deleteCount), 0), len - actualStart);

	        var k = 0;
	        var from;
	        while (k < actualDeleteCount) {
	            from = $String(actualStart + k);
	            if (owns(O, from)) {
	                A[k] = O[from];
	            }
	            k += 1;
	        }

	        var items = arraySlice(arguments, 2);
	        var itemCount = items.length;
	        var to;
	        if (itemCount < actualDeleteCount) {
	            k = actualStart;
	            var maxK = len - actualDeleteCount;
	            while (k < maxK) {
	                from = $String(k + actualDeleteCount);
	                to = $String(k + itemCount);
	                if (owns(O, from)) {
	                    O[to] = O[from];
	                } else {
	                    delete O[to];
	                }
	                k += 1;
	            }
	            k = len;
	            var minK = len - actualDeleteCount + itemCount;
	            while (k > minK) {
	                delete O[k - 1];
	                k -= 1;
	            }
	        } else if (itemCount > actualDeleteCount) {
	            k = len - actualDeleteCount;
	            while (k > actualStart) {
	                from = $String(k + actualDeleteCount - 1);
	                to = $String(k + itemCount - 1);
	                if (owns(O, from)) {
	                    O[to] = O[from];
	                } else {
	                    delete O[to];
	                }
	                k -= 1;
	            }
	        }
	        k = actualStart;
	        for (var i = 0; i < items.length; ++i) {
	            O[k] = items[i];
	            k += 1;
	        }
	        O.length = len - actualDeleteCount + itemCount;

	        return A;
	    }
	}, !spliceWorksWithLargeSparseArrays || !spliceWorksWithSmallSparseArrays);

	var originalJoin = ArrayPrototype.join;
	var hasStringJoinBug;
	try {
	    hasStringJoinBug = Array.prototype.join.call('123', ',') !== '1,2,3';
	} catch (e) {
	    hasStringJoinBug = true;
	}
	if (hasStringJoinBug) {
	    defineProperties(ArrayPrototype, {
	        join: function join(separator) {
	            var sep = typeof separator === 'undefined' ? ',' : separator;
	            return originalJoin.call(isString(this) ? strSplit(this, '') : this, sep);
	        }
	    }, hasStringJoinBug);
	}

	var hasJoinUndefinedBug = [1, 2].join(undefined) !== '1,2';
	if (hasJoinUndefinedBug) {
	    defineProperties(ArrayPrototype, {
	        join: function join(separator) {
	            var sep = typeof separator === 'undefined' ? ',' : separator;
	            return originalJoin.call(this, sep);
	        }
	    }, hasJoinUndefinedBug);
	}

	var pushShim = function push(item) {
	    var O = ES.ToObject(this);
	    var n = ES.ToUint32(O.length);
	    var i = 0;
	    while (i < arguments.length) {
	        O[n + i] = arguments[i];
	        i += 1;
	    }
	    O.length = n + i;
	    return n + i;
	};

	var pushIsNotGeneric = (function () {
	    var obj = {};
	    var result = Array.prototype.push.call(obj, undefined);
	    return result !== 1 || obj.length !== 1 || typeof obj[0] !== 'undefined' || !owns(obj, 0);
	}());
	defineProperties(ArrayPrototype, {
	    push: function push(item) {
	        if (isArray(this)) {
	            return array_push.apply(this, arguments);
	        }
	        return pushShim.apply(this, arguments);
	    }
	}, pushIsNotGeneric);

	// This fixes a very weird bug in Opera 10.6 when pushing `undefined
	var pushUndefinedIsWeird = (function () {
	    var arr = [];
	    var result = arr.push(undefined);
	    return result !== 1 || arr.length !== 1 || typeof arr[0] !== 'undefined' || !owns(arr, 0);
	}());
	defineProperties(ArrayPrototype, { push: pushShim }, pushUndefinedIsWeird);

	// ES5 15.2.3.14
	// http://es5.github.io/#x15.4.4.10
	// Fix boxed string bug
	defineProperties(ArrayPrototype, {
	    slice: function (start, end) {
	        var arr = isString(this) ? strSplit(this, '') : this;
	        return arraySliceApply(arr, arguments);
	    }
	}, splitString);

	var sortIgnoresNonFunctions = (function () {
	    try {
	        [1, 2].sort(null);
	        [1, 2].sort({});
	        return true;
	    } catch (e) { /**/ }
	    return false;
	}());
	var sortThrowsOnRegex = (function () {
	    // this is a problem in Firefox 4, in which `typeof /a/ === 'function'`
	    try {
	        [1, 2].sort(/a/);
	        return false;
	    } catch (e) { /**/ }
	    return true;
	}());
	var sortIgnoresUndefined = (function () {
	    // applies in IE 8, for one.
	    try {
	        [1, 2].sort(undefined);
	        return true;
	    } catch (e) { /**/ }
	    return false;
	}());
	defineProperties(ArrayPrototype, {
	    sort: function sort(compareFn) {
	        if (typeof compareFn === 'undefined') {
	            return arraySort(this);
	        }
	        if (!isCallable(compareFn)) {
	            throw new TypeError('Array.prototype.sort callback must be a function');
	        }
	        return arraySort(this, compareFn);
	    }
	}, sortIgnoresNonFunctions || !sortIgnoresUndefined || !sortThrowsOnRegex);

	//
	// Object
	// ======
	//

	// ES5 15.2.3.14
	// http://es5.github.com/#x15.2.3.14

	// http://whattheheadsaid.com/2010/10/a-safer-object-keys-compatibility-implementation
	var hasDontEnumBug = !({ 'toString': null }).propertyIsEnumerable('toString');
	var hasProtoEnumBug = function () {}.propertyIsEnumerable('prototype');
	var hasStringEnumBug = !owns('x', '0');
	var equalsConstructorPrototype = function (o) {
	    var ctor = o.constructor;
	    return ctor && ctor.prototype === o;
	};
	var blacklistedKeys = {
	    $window: true,
	    $console: true,
	    $parent: true,
	    $self: true,
	    $frame: true,
	    $frames: true,
	    $frameElement: true,
	    $webkitIndexedDB: true,
	    $webkitStorageInfo: true,
	    $external: true
	};
	var hasAutomationEqualityBug = (function () {
	    /* globals window */
	    if (typeof window === 'undefined') { return false; }
	    for (var k in window) {
	        try {
	            if (!blacklistedKeys['$' + k] && owns(window, k) && window[k] !== null && typeof window[k] === 'object') {
	                equalsConstructorPrototype(window[k]);
	            }
	        } catch (e) {
	            return true;
	        }
	    }
	    return false;
	}());
	var equalsConstructorPrototypeIfNotBuggy = function (object) {
	    if (typeof window === 'undefined' || !hasAutomationEqualityBug) { return equalsConstructorPrototype(object); }
	    try {
	        return equalsConstructorPrototype(object);
	    } catch (e) {
	        return false;
	    }
	};
	var dontEnums = [
	    'toString',
	    'toLocaleString',
	    'valueOf',
	    'hasOwnProperty',
	    'isPrototypeOf',
	    'propertyIsEnumerable',
	    'constructor'
	];
	var dontEnumsLength = dontEnums.length;

	// taken directly from https://github.com/ljharb/is-arguments/blob/master/index.js
	// can be replaced with require('is-arguments') if we ever use a build process instead
	var isStandardArguments = function isArguments(value) {
	    return toStr(value) === '[object Arguments]';
	};
	var isLegacyArguments = function isArguments(value) {
	    return value !== null &&
	        typeof value === 'object' &&
	        typeof value.length === 'number' &&
	        value.length >= 0 &&
	        !isArray(value) &&
	        isCallable(value.callee);
	};
	var isArguments = isStandardArguments(arguments) ? isStandardArguments : isLegacyArguments;

	defineProperties($Object, {
	    keys: function keys(object) {
	        var isFn = isCallable(object);
	        var isArgs = isArguments(object);
	        var isObject = object !== null && typeof object === 'object';
	        var isStr = isObject && isString(object);

	        if (!isObject && !isFn && !isArgs) {
	            throw new TypeError('Object.keys called on a non-object');
	        }

	        var theKeys = [];
	        var skipProto = hasProtoEnumBug && isFn;
	        if ((isStr && hasStringEnumBug) || isArgs) {
	            for (var i = 0; i < object.length; ++i) {
	                pushCall(theKeys, $String(i));
	            }
	        }

	        if (!isArgs) {
	            for (var name in object) {
	                if (!(skipProto && name === 'prototype') && owns(object, name)) {
	                    pushCall(theKeys, $String(name));
	                }
	            }
	        }

	        if (hasDontEnumBug) {
	            var skipConstructor = equalsConstructorPrototypeIfNotBuggy(object);
	            for (var j = 0; j < dontEnumsLength; j++) {
	                var dontEnum = dontEnums[j];
	                if (!(skipConstructor && dontEnum === 'constructor') && owns(object, dontEnum)) {
	                    pushCall(theKeys, dontEnum);
	                }
	            }
	        }
	        return theKeys;
	    }
	});

	var keysWorksWithArguments = $Object.keys && (function () {
	    // Safari 5.0 bug
	    return $Object.keys(arguments).length === 2;
	}(1, 2));
	var keysHasArgumentsLengthBug = $Object.keys && (function () {
	    var argKeys = $Object.keys(arguments);
	    return arguments.length !== 1 || argKeys.length !== 1 || argKeys[0] !== 1;
	}(1));
	var originalKeys = $Object.keys;
	defineProperties($Object, {
	    keys: function keys(object) {
	        if (isArguments(object)) {
	            return originalKeys(arraySlice(object));
	        } else {
	            return originalKeys(object);
	        }
	    }
	}, !keysWorksWithArguments || keysHasArgumentsLengthBug);

	//
	// Date
	// ====
	//

	var hasNegativeMonthYearBug = new Date(-3509827329600292).getUTCMonth() !== 0;
	var aNegativeTestDate = new Date(-1509842289600292);
	var aPositiveTestDate = new Date(1449662400000);
	var hasToUTCStringFormatBug = aNegativeTestDate.toUTCString() !== 'Mon, 01 Jan -45875 11:59:59 GMT';
	var hasToDateStringFormatBug;
	var hasToStringFormatBug;
	var timeZoneOffset = aNegativeTestDate.getTimezoneOffset();
	if (timeZoneOffset < -720) {
	    hasToDateStringFormatBug = aNegativeTestDate.toDateString() !== 'Tue Jan 02 -45875';
	    hasToStringFormatBug = !(/^Thu Dec 10 2015 \d\d:\d\d:\d\d GMT[-\+]\d\d\d\d(?: |$)/).test(aPositiveTestDate.toString());
	} else {
	    hasToDateStringFormatBug = aNegativeTestDate.toDateString() !== 'Mon Jan 01 -45875';
	    hasToStringFormatBug = !(/^Wed Dec 09 2015 \d\d:\d\d:\d\d GMT[-\+]\d\d\d\d(?: |$)/).test(aPositiveTestDate.toString());
	}

	var originalGetFullYear = call.bind(Date.prototype.getFullYear);
	var originalGetMonth = call.bind(Date.prototype.getMonth);
	var originalGetDate = call.bind(Date.prototype.getDate);
	var originalGetUTCFullYear = call.bind(Date.prototype.getUTCFullYear);
	var originalGetUTCMonth = call.bind(Date.prototype.getUTCMonth);
	var originalGetUTCDate = call.bind(Date.prototype.getUTCDate);
	var originalGetUTCDay = call.bind(Date.prototype.getUTCDay);
	var originalGetUTCHours = call.bind(Date.prototype.getUTCHours);
	var originalGetUTCMinutes = call.bind(Date.prototype.getUTCMinutes);
	var originalGetUTCSeconds = call.bind(Date.prototype.getUTCSeconds);
	var originalGetUTCMilliseconds = call.bind(Date.prototype.getUTCMilliseconds);
	var dayName = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
	var monthName = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
	var daysInMonth = function daysInMonth(month, year) {
	    return originalGetDate(new Date(year, month, 0));
	};

	defineProperties(Date.prototype, {
	    getFullYear: function getFullYear() {
	        if (!this || !(this instanceof Date)) {
	            throw new TypeError('this is not a Date object.');
	        }
	        var year = originalGetFullYear(this);
	        if (year < 0 && originalGetMonth(this) > 11) {
	            return year + 1;
	        }
	        return year;
	    },
	    getMonth: function getMonth() {
	        if (!this || !(this instanceof Date)) {
	            throw new TypeError('this is not a Date object.');
	        }
	        var year = originalGetFullYear(this);
	        var month = originalGetMonth(this);
	        if (year < 0 && month > 11) {
	            return 0;
	        }
	        return month;
	    },
	    getDate: function getDate() {
	        if (!this || !(this instanceof Date)) {
	            throw new TypeError('this is not a Date object.');
	        }
	        var year = originalGetFullYear(this);
	        var month = originalGetMonth(this);
	        var date = originalGetDate(this);
	        if (year < 0 && month > 11) {
	            if (month === 12) {
	                return date;
	            }
	            var days = daysInMonth(0, year + 1);
	            return (days - date) + 1;
	        }
	        return date;
	    },
	    getUTCFullYear: function getUTCFullYear() {
	        if (!this || !(this instanceof Date)) {
	            throw new TypeError('this is not a Date object.');
	        }
	        var year = originalGetUTCFullYear(this);
	        if (year < 0 && originalGetUTCMonth(this) > 11) {
	            return year + 1;
	        }
	        return year;
	    },
	    getUTCMonth: function getUTCMonth() {
	        if (!this || !(this instanceof Date)) {
	            throw new TypeError('this is not a Date object.');
	        }
	        var year = originalGetUTCFullYear(this);
	        var month = originalGetUTCMonth(this);
	        if (year < 0 && month > 11) {
	            return 0;
	        }
	        return month;
	    },
	    getUTCDate: function getUTCDate() {
	        if (!this || !(this instanceof Date)) {
	            throw new TypeError('this is not a Date object.');
	        }
	        var year = originalGetUTCFullYear(this);
	        var month = originalGetUTCMonth(this);
	        var date = originalGetUTCDate(this);
	        if (year < 0 && month > 11) {
	            if (month === 12) {
	                return date;
	            }
	            var days = daysInMonth(0, year + 1);
	            return (days - date) + 1;
	        }
	        return date;
	    }
	}, hasNegativeMonthYearBug);

	defineProperties(Date.prototype, {
	    toUTCString: function toUTCString() {
	        if (!this || !(this instanceof Date)) {
	            throw new TypeError('this is not a Date object.');
	        }
	        var day = originalGetUTCDay(this);
	        var date = originalGetUTCDate(this);
	        var month = originalGetUTCMonth(this);
	        var year = originalGetUTCFullYear(this);
	        var hour = originalGetUTCHours(this);
	        var minute = originalGetUTCMinutes(this);
	        var second = originalGetUTCSeconds(this);
	        return dayName[day] + ', ' +
	            (date < 10 ? '0' + date : date) + ' ' +
	            monthName[month] + ' ' +
	            year + ' ' +
	            (hour < 10 ? '0' + hour : hour) + ':' +
	            (minute < 10 ? '0' + minute : minute) + ':' +
	            (second < 10 ? '0' + second : second) + ' GMT';
	    }
	}, hasNegativeMonthYearBug || hasToUTCStringFormatBug);

	// Opera 12 has `,`
	defineProperties(Date.prototype, {
	    toDateString: function toDateString() {
	        if (!this || !(this instanceof Date)) {
	            throw new TypeError('this is not a Date object.');
	        }
	        var day = this.getDay();
	        var date = this.getDate();
	        var month = this.getMonth();
	        var year = this.getFullYear();
	        return dayName[day] + ' ' +
	            monthName[month] + ' ' +
	            (date < 10 ? '0' + date : date) + ' ' +
	            year;
	    }
	}, hasNegativeMonthYearBug || hasToDateStringFormatBug);

	// can't use defineProperties here because of toString enumeration issue in IE <= 8
	if (hasNegativeMonthYearBug || hasToStringFormatBug) {
	    Date.prototype.toString = function toString() {
	        if (!this || !(this instanceof Date)) {
	            throw new TypeError('this is not a Date object.');
	        }
	        var day = this.getDay();
	        var date = this.getDate();
	        var month = this.getMonth();
	        var year = this.getFullYear();
	        var hour = this.getHours();
	        var minute = this.getMinutes();
	        var second = this.getSeconds();
	        var timezoneOffset = this.getTimezoneOffset();
	        var hoursOffset = Math.floor(Math.abs(timezoneOffset) / 60);
	        var minutesOffset = Math.floor(Math.abs(timezoneOffset) % 60);
	        return dayName[day] + ' ' +
	            monthName[month] + ' ' +
	            (date < 10 ? '0' + date : date) + ' ' +
	            year + ' ' +
	            (hour < 10 ? '0' + hour : hour) + ':' +
	            (minute < 10 ? '0' + minute : minute) + ':' +
	            (second < 10 ? '0' + second : second) + ' GMT' +
	            (timezoneOffset > 0 ? '-' : '+') +
	            (hoursOffset < 10 ? '0' + hoursOffset : hoursOffset) +
	            (minutesOffset < 10 ? '0' + minutesOffset : minutesOffset);
	    };
	    if (supportsDescriptors) {
	        $Object.defineProperty(Date.prototype, 'toString', {
	            configurable: true,
	            enumerable: false,
	            writable: true
	        });
	    }
	}

	// ES5 15.9.5.43
	// http://es5.github.com/#x15.9.5.43
	// This function returns a String value represent the instance in time
	// represented by this Date object. The format of the String is the Date Time
	// string format defined in 15.9.1.15. All fields are present in the String.
	// The time zone is always UTC, denoted by the suffix Z. If the time value of
	// this object is not a finite Number a RangeError exception is thrown.
	var negativeDate = -62198755200000;
	var negativeYearString = '-000001';
	var hasNegativeDateBug = Date.prototype.toISOString && new Date(negativeDate).toISOString().indexOf(negativeYearString) === -1;
	var hasSafari51DateBug = Date.prototype.toISOString && new Date(-1).toISOString() !== '1969-12-31T23:59:59.999Z';

	var getTime = call.bind(Date.prototype.getTime);

	defineProperties(Date.prototype, {
	    toISOString: function toISOString() {
	        if (!isFinite(this) || !isFinite(getTime(this))) {
	            // Adope Photoshop requires the second check.
	            throw new RangeError('Date.prototype.toISOString called on non-finite value.');
	        }

	        var year = originalGetUTCFullYear(this);

	        var month = originalGetUTCMonth(this);
	        // see https://github.com/es-shims/es5-shim/issues/111
	        year += Math.floor(month / 12);
	        month = (month % 12 + 12) % 12;

	        // the date time string format is specified in 15.9.1.15.
	        var result = [month + 1, originalGetUTCDate(this), originalGetUTCHours(this), originalGetUTCMinutes(this), originalGetUTCSeconds(this)];
	        year = (
	            (year < 0 ? '-' : (year > 9999 ? '+' : '')) +
	            strSlice('00000' + Math.abs(year), (0 <= year && year <= 9999) ? -4 : -6)
	        );

	        for (var i = 0; i < result.length; ++i) {
	          // pad months, days, hours, minutes, and seconds to have two digits.
	          result[i] = strSlice('00' + result[i], -2);
	        }
	        // pad milliseconds to have three digits.
	        return (
	            year + '-' + arraySlice(result, 0, 2).join('-') +
	            'T' + arraySlice(result, 2).join(':') + '.' +
	            strSlice('000' + originalGetUTCMilliseconds(this), -3) + 'Z'
	        );
	    }
	}, hasNegativeDateBug || hasSafari51DateBug);

	// ES5 15.9.5.44
	// http://es5.github.com/#x15.9.5.44
	// This function provides a String representation of a Date object for use by
	// JSON.stringify (15.12.3).
	var dateToJSONIsSupported = (function () {
	    try {
	        return Date.prototype.toJSON &&
	            new Date(NaN).toJSON() === null &&
	            new Date(negativeDate).toJSON().indexOf(negativeYearString) !== -1 &&
	            Date.prototype.toJSON.call({ // generic
	                toISOString: function () { return true; }
	            });
	    } catch (e) {
	        return false;
	    }
	}());
	if (!dateToJSONIsSupported) {
	    Date.prototype.toJSON = function toJSON(key) {
	        // When the toJSON method is called with argument key, the following
	        // steps are taken:

	        // 1.  Let O be the result of calling ToObject, giving it the this
	        // value as its argument.
	        // 2. Let tv be ES.ToPrimitive(O, hint Number).
	        var O = $Object(this);
	        var tv = ES.ToPrimitive(O);
	        // 3. If tv is a Number and is not finite, return null.
	        if (typeof tv === 'number' && !isFinite(tv)) {
	            return null;
	        }
	        // 4. Let toISO be the result of calling the [[Get]] internal method of
	        // O with argument "toISOString".
	        var toISO = O.toISOString;
	        // 5. If IsCallable(toISO) is false, throw a TypeError exception.
	        if (!isCallable(toISO)) {
	            throw new TypeError('toISOString property is not callable');
	        }
	        // 6. Return the result of calling the [[Call]] internal method of
	        //  toISO with O as the this value and an empty argument list.
	        return toISO.call(O);

	        // NOTE 1 The argument is ignored.

	        // NOTE 2 The toJSON function is intentionally generic; it does not
	        // require that its this value be a Date object. Therefore, it can be
	        // transferred to other kinds of objects for use as a method. However,
	        // it does require that any such object have a toISOString method. An
	        // object is free to use the argument key to filter its
	        // stringification.
	    };
	}

	// ES5 15.9.4.2
	// http://es5.github.com/#x15.9.4.2
	// based on work shared by Daniel Friesen (dantman)
	// http://gist.github.com/303249
	var supportsExtendedYears = Date.parse('+033658-09-27T01:46:40.000Z') === 1e15;
	var acceptsInvalidDates = !isNaN(Date.parse('2012-04-04T24:00:00.500Z')) || !isNaN(Date.parse('2012-11-31T23:59:59.000Z')) || !isNaN(Date.parse('2012-12-31T23:59:60.000Z'));
	var doesNotParseY2KNewYear = isNaN(Date.parse('2000-01-01T00:00:00.000Z'));
	if (doesNotParseY2KNewYear || acceptsInvalidDates || !supportsExtendedYears) {
	    // XXX global assignment won't work in embeddings that use
	    // an alternate object for the context.
	    /* global Date: true */
	    /* eslint-disable no-undef */
	    var maxSafeUnsigned32Bit = Math.pow(2, 31) - 1;
	    var hasSafariSignedIntBug = isActualNaN(new Date(1970, 0, 1, 0, 0, 0, maxSafeUnsigned32Bit + 1).getTime());
	    /* eslint-disable no-implicit-globals */
	    Date = (function (NativeDate) {
	    /* eslint-enable no-implicit-globals */
	    /* eslint-enable no-undef */
	        // Date.length === 7
	        var DateShim = function Date(Y, M, D, h, m, s, ms) {
	            var length = arguments.length;
	            var date;
	            if (this instanceof NativeDate) {
	                var seconds = s;
	                var millis = ms;
	                if (hasSafariSignedIntBug && length >= 7 && ms > maxSafeUnsigned32Bit) {
	                    // work around a Safari 8/9 bug where it treats the seconds as signed
	                    var msToShift = Math.floor(ms / maxSafeUnsigned32Bit) * maxSafeUnsigned32Bit;
	                    var sToShift = Math.floor(msToShift / 1e3);
	                    seconds += sToShift;
	                    millis -= sToShift * 1e3;
	                }
	                date = length === 1 && $String(Y) === Y ? // isString(Y)
	                    // We explicitly pass it through parse:
	                    new NativeDate(DateShim.parse(Y)) :
	                    // We have to manually make calls depending on argument
	                    // length here
	                    length >= 7 ? new NativeDate(Y, M, D, h, m, seconds, millis) :
	                    length >= 6 ? new NativeDate(Y, M, D, h, m, seconds) :
	                    length >= 5 ? new NativeDate(Y, M, D, h, m) :
	                    length >= 4 ? new NativeDate(Y, M, D, h) :
	                    length >= 3 ? new NativeDate(Y, M, D) :
	                    length >= 2 ? new NativeDate(Y, M) :
	                    length >= 1 ? new NativeDate(Y instanceof NativeDate ? +Y : Y) :
	                                  new NativeDate();
	            } else {
	                date = NativeDate.apply(this, arguments);
	            }
	            if (!isPrimitive(date)) {
	              // Prevent mixups with unfixed Date object
	              defineProperties(date, { constructor: DateShim }, true);
	            }
	            return date;
	        };

	        // 15.9.1.15 Date Time String Format.
	        var isoDateExpression = new RegExp('^' +
	            '(\\d{4}|[+-]\\d{6})' + // four-digit year capture or sign +
	                                      // 6-digit extended year
	            '(?:-(\\d{2})' + // optional month capture
	            '(?:-(\\d{2})' + // optional day capture
	            '(?:' + // capture hours:minutes:seconds.milliseconds
	                'T(\\d{2})' + // hours capture
	                ':(\\d{2})' + // minutes capture
	                '(?:' + // optional :seconds.milliseconds
	                    ':(\\d{2})' + // seconds capture
	                    '(?:(\\.\\d{1,}))?' + // milliseconds capture
	                ')?' +
	            '(' + // capture UTC offset component
	                'Z|' + // UTC capture
	                '(?:' + // offset specifier +/-hours:minutes
	                    '([-+])' + // sign capture
	                    '(\\d{2})' + // hours offset capture
	                    ':(\\d{2})' + // minutes offset capture
	                ')' +
	            ')?)?)?)?' +
	        '$');

	        var months = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365];

	        var dayFromMonth = function dayFromMonth(year, month) {
	            var t = month > 1 ? 1 : 0;
	            return (
	                months[month] +
	                Math.floor((year - 1969 + t) / 4) -
	                Math.floor((year - 1901 + t) / 100) +
	                Math.floor((year - 1601 + t) / 400) +
	                365 * (year - 1970)
	            );
	        };

	        var toUTC = function toUTC(t) {
	            var s = 0;
	            var ms = t;
	            if (hasSafariSignedIntBug && ms > maxSafeUnsigned32Bit) {
	                // work around a Safari 8/9 bug where it treats the seconds as signed
	                var msToShift = Math.floor(ms / maxSafeUnsigned32Bit) * maxSafeUnsigned32Bit;
	                var sToShift = Math.floor(msToShift / 1e3);
	                s += sToShift;
	                ms -= sToShift * 1e3;
	            }
	            return $Number(new NativeDate(1970, 0, 1, 0, 0, s, ms));
	        };

	        // Copy any custom methods a 3rd party library may have added
	        for (var key in NativeDate) {
	            if (owns(NativeDate, key)) {
	                DateShim[key] = NativeDate[key];
	            }
	        }

	        // Copy "native" methods explicitly; they may be non-enumerable
	        defineProperties(DateShim, {
	            now: NativeDate.now,
	            UTC: NativeDate.UTC
	        }, true);
	        DateShim.prototype = NativeDate.prototype;
	        defineProperties(DateShim.prototype, {
	            constructor: DateShim
	        }, true);

	        // Upgrade Date.parse to handle simplified ISO 8601 strings
	        var parseShim = function parse(string) {
	            var match = isoDateExpression.exec(string);
	            if (match) {
	                // parse months, days, hours, minutes, seconds, and milliseconds
	                // provide default values if necessary
	                // parse the UTC offset component
	                var year = $Number(match[1]),
	                    month = $Number(match[2] || 1) - 1,
	                    day = $Number(match[3] || 1) - 1,
	                    hour = $Number(match[4] || 0),
	                    minute = $Number(match[5] || 0),
	                    second = $Number(match[6] || 0),
	                    millisecond = Math.floor($Number(match[7] || 0) * 1000),
	                    // When time zone is missed, local offset should be used
	                    // (ES 5.1 bug)
	                    // see https://bugs.ecmascript.org/show_bug.cgi?id=112
	                    isLocalTime = Boolean(match[4] && !match[8]),
	                    signOffset = match[9] === '-' ? 1 : -1,
	                    hourOffset = $Number(match[10] || 0),
	                    minuteOffset = $Number(match[11] || 0),
	                    result;
	                var hasMinutesOrSecondsOrMilliseconds = minute > 0 || second > 0 || millisecond > 0;
	                if (
	                    hour < (hasMinutesOrSecondsOrMilliseconds ? 24 : 25) &&
	                    minute < 60 && second < 60 && millisecond < 1000 &&
	                    month > -1 && month < 12 && hourOffset < 24 &&
	                    minuteOffset < 60 && // detect invalid offsets
	                    day > -1 &&
	                    day < (dayFromMonth(year, month + 1) - dayFromMonth(year, month))
	                ) {
	                    result = (
	                        (dayFromMonth(year, month) + day) * 24 +
	                        hour +
	                        hourOffset * signOffset
	                    ) * 60;
	                    result = (
	                        (result + minute + minuteOffset * signOffset) * 60 +
	                        second
	                    ) * 1000 + millisecond;
	                    if (isLocalTime) {
	                        result = toUTC(result);
	                    }
	                    if (-8.64e15 <= result && result <= 8.64e15) {
	                        return result;
	                    }
	                }
	                return NaN;
	            }
	            return NativeDate.parse.apply(this, arguments);
	        };
	        defineProperties(DateShim, { parse: parseShim });

	        return DateShim;
	    }(Date));
	    /* global Date: false */
	}

	// ES5 15.9.4.4
	// http://es5.github.com/#x15.9.4.4
	if (!Date.now) {
	    Date.now = function now() {
	        return new Date().getTime();
	    };
	}

	//
	// Number
	// ======
	//

	// ES5.1 15.7.4.5
	// http://es5.github.com/#x15.7.4.5
	var hasToFixedBugs = NumberPrototype.toFixed && (
	  (0.00008).toFixed(3) !== '0.000' ||
	  (0.9).toFixed(0) !== '1' ||
	  (1.255).toFixed(2) !== '1.25' ||
	  (1000000000000000128).toFixed(0) !== '1000000000000000128'
	);

	var toFixedHelpers = {
	  base: 1e7,
	  size: 6,
	  data: [0, 0, 0, 0, 0, 0],
	  multiply: function multiply(n, c) {
	      var i = -1;
	      var c2 = c;
	      while (++i < toFixedHelpers.size) {
	          c2 += n * toFixedHelpers.data[i];
	          toFixedHelpers.data[i] = c2 % toFixedHelpers.base;
	          c2 = Math.floor(c2 / toFixedHelpers.base);
	      }
	  },
	  divide: function divide(n) {
	      var i = toFixedHelpers.size;
	      var c = 0;
	      while (--i >= 0) {
	          c += toFixedHelpers.data[i];
	          toFixedHelpers.data[i] = Math.floor(c / n);
	          c = (c % n) * toFixedHelpers.base;
	      }
	  },
	  numToString: function numToString() {
	      var i = toFixedHelpers.size;
	      var s = '';
	      while (--i >= 0) {
	          if (s !== '' || i === 0 || toFixedHelpers.data[i] !== 0) {
	              var t = $String(toFixedHelpers.data[i]);
	              if (s === '') {
	                  s = t;
	              } else {
	                  s += strSlice('0000000', 0, 7 - t.length) + t;
	              }
	          }
	      }
	      return s;
	  },
	  pow: function pow(x, n, acc) {
	      return (n === 0 ? acc : (n % 2 === 1 ? pow(x, n - 1, acc * x) : pow(x * x, n / 2, acc)));
	  },
	  log: function log(x) {
	      var n = 0;
	      var x2 = x;
	      while (x2 >= 4096) {
	          n += 12;
	          x2 /= 4096;
	      }
	      while (x2 >= 2) {
	          n += 1;
	          x2 /= 2;
	      }
	      return n;
	  }
	};

	var toFixedShim = function toFixed(fractionDigits) {
	    var f, x, s, m, e, z, j, k;

	    // Test for NaN and round fractionDigits down
	    f = $Number(fractionDigits);
	    f = isActualNaN(f) ? 0 : Math.floor(f);

	    if (f < 0 || f > 20) {
	        throw new RangeError('Number.toFixed called with invalid number of decimals');
	    }

	    x = $Number(this);

	    if (isActualNaN(x)) {
	        return 'NaN';
	    }

	    // If it is too big or small, return the string value of the number
	    if (x <= -1e21 || x >= 1e21) {
	        return $String(x);
	    }

	    s = '';

	    if (x < 0) {
	        s = '-';
	        x = -x;
	    }

	    m = '0';

	    if (x > 1e-21) {
	        // 1e-21 < x < 1e21
	        // -70 < log2(x) < 70
	        e = toFixedHelpers.log(x * toFixedHelpers.pow(2, 69, 1)) - 69;
	        z = (e < 0 ? x * toFixedHelpers.pow(2, -e, 1) : x / toFixedHelpers.pow(2, e, 1));
	        z *= 0x10000000000000; // Math.pow(2, 52);
	        e = 52 - e;

	        // -18 < e < 122
	        // x = z / 2 ^ e
	        if (e > 0) {
	            toFixedHelpers.multiply(0, z);
	            j = f;

	            while (j >= 7) {
	                toFixedHelpers.multiply(1e7, 0);
	                j -= 7;
	            }

	            toFixedHelpers.multiply(toFixedHelpers.pow(10, j, 1), 0);
	            j = e - 1;

	            while (j >= 23) {
	                toFixedHelpers.divide(1 << 23);
	                j -= 23;
	            }

	            toFixedHelpers.divide(1 << j);
	            toFixedHelpers.multiply(1, 1);
	            toFixedHelpers.divide(2);
	            m = toFixedHelpers.numToString();
	        } else {
	            toFixedHelpers.multiply(0, z);
	            toFixedHelpers.multiply(1 << (-e), 0);
	            m = toFixedHelpers.numToString() + strSlice('0.00000000000000000000', 2, 2 + f);
	        }
	    }

	    if (f > 0) {
	        k = m.length;

	        if (k <= f) {
	            m = s + strSlice('0.0000000000000000000', 0, f - k + 2) + m;
	        } else {
	            m = s + strSlice(m, 0, k - f) + '.' + strSlice(m, k - f);
	        }
	    } else {
	        m = s + m;
	    }

	    return m;
	};
	defineProperties(NumberPrototype, { toFixed: toFixedShim }, hasToFixedBugs);

	var hasToPrecisionUndefinedBug = (function () {
	    try {
	        return 1.0.toPrecision(undefined) === '1';
	    } catch (e) {
	        return true;
	    }
	}());
	var originalToPrecision = NumberPrototype.toPrecision;
	defineProperties(NumberPrototype, {
	    toPrecision: function toPrecision(precision) {
	        return typeof precision === 'undefined' ? originalToPrecision.call(this) : originalToPrecision.call(this, precision);
	    }
	}, hasToPrecisionUndefinedBug);

	//
	// String
	// ======
	//

	// ES5 15.5.4.14
	// http://es5.github.com/#x15.5.4.14

	// [bugfix, IE lt 9, firefox 4, Konqueror, Opera, obscure browsers]
	// Many browsers do not split properly with regular expressions or they
	// do not perform the split correctly under obscure conditions.
	// See http://blog.stevenlevithan.com/archives/cross-browser-split
	// I've tested in many browsers and this seems to cover the deviant ones:
	//    'ab'.split(/(?:ab)*/) should be ["", ""], not [""]
	//    '.'.split(/(.?)(.?)/) should be ["", ".", "", ""], not ["", ""]
	//    'tesst'.split(/(s)*/) should be ["t", undefined, "e", "s", "t"], not
	//       [undefined, "t", undefined, "e", ...]
	//    ''.split(/.?/) should be [], not [""]
	//    '.'.split(/()()/) should be ["."], not ["", "", "."]

	if (
	    'ab'.split(/(?:ab)*/).length !== 2 ||
	    '.'.split(/(.?)(.?)/).length !== 4 ||
	    'tesst'.split(/(s)*/)[1] === 't' ||
	    'test'.split(/(?:)/, -1).length !== 4 ||
	    ''.split(/.?/).length ||
	    '.'.split(/()()/).length > 1
	) {
	    (function () {
	        var compliantExecNpcg = typeof (/()??/).exec('')[1] === 'undefined'; // NPCG: nonparticipating capturing group
	        var maxSafe32BitInt = Math.pow(2, 32) - 1;

	        StringPrototype.split = function (separator, limit) {
	            var string = String(this);
	            if (typeof separator === 'undefined' && limit === 0) {
	                return [];
	            }

	            // If `separator` is not a regex, use native split
	            if (!isRegex(separator)) {
	                return strSplit(this, separator, limit);
	            }

	            var output = [];
	            var flags = (separator.ignoreCase ? 'i' : '') +
	                        (separator.multiline ? 'm' : '') +
	                        (separator.unicode ? 'u' : '') + // in ES6
	                        (separator.sticky ? 'y' : ''), // Firefox 3+ and ES6
	                lastLastIndex = 0,
	                // Make `global` and avoid `lastIndex` issues by working with a copy
	                separator2, match, lastIndex, lastLength;
	            var separatorCopy = new RegExp(separator.source, flags + 'g');
	            if (!compliantExecNpcg) {
	                // Doesn't need flags gy, but they don't hurt
	                separator2 = new RegExp('^' + separatorCopy.source + '$(?!\\s)', flags);
	            }
	            /* Values for `limit`, per the spec:
	             * If undefined: 4294967295 // maxSafe32BitInt
	             * If 0, Infinity, or NaN: 0
	             * If positive number: limit = Math.floor(limit); if (limit > 4294967295) limit -= 4294967296;
	             * If negative number: 4294967296 - Math.floor(Math.abs(limit))
	             * If other: Type-convert, then use the above rules
	             */
	            var splitLimit = typeof limit === 'undefined' ? maxSafe32BitInt : ES.ToUint32(limit);
	            match = separatorCopy.exec(string);
	            while (match) {
	                // `separatorCopy.lastIndex` is not reliable cross-browser
	                lastIndex = match.index + match[0].length;
	                if (lastIndex > lastLastIndex) {
	                    pushCall(output, strSlice(string, lastLastIndex, match.index));
	                    // Fix browsers whose `exec` methods don't consistently return `undefined` for
	                    // nonparticipating capturing groups
	                    if (!compliantExecNpcg && match.length > 1) {
	                        /* eslint-disable no-loop-func */
	                        match[0].replace(separator2, function () {
	                            for (var i = 1; i < arguments.length - 2; i++) {
	                                if (typeof arguments[i] === 'undefined') {
	                                    match[i] = void 0;
	                                }
	                            }
	                        });
	                        /* eslint-enable no-loop-func */
	                    }
	                    if (match.length > 1 && match.index < string.length) {
	                        array_push.apply(output, arraySlice(match, 1));
	                    }
	                    lastLength = match[0].length;
	                    lastLastIndex = lastIndex;
	                    if (output.length >= splitLimit) {
	                        break;
	                    }
	                }
	                if (separatorCopy.lastIndex === match.index) {
	                    separatorCopy.lastIndex++; // Avoid an infinite loop
	                }
	                match = separatorCopy.exec(string);
	            }
	            if (lastLastIndex === string.length) {
	                if (lastLength || !separatorCopy.test('')) {
	                    pushCall(output, '');
	                }
	            } else {
	                pushCall(output, strSlice(string, lastLastIndex));
	            }
	            return output.length > splitLimit ? arraySlice(output, 0, splitLimit) : output;
	        };
	    }());

	// [bugfix, chrome]
	// If separator is undefined, then the result array contains just one String,
	// which is the this value (converted to a String). If limit is not undefined,
	// then the output array is truncated so that it contains no more than limit
	// elements.
	// "0".split(undefined, 0) -> []
	} else if ('0'.split(void 0, 0).length) {
	    StringPrototype.split = function split(separator, limit) {
	        if (typeof separator === 'undefined' && limit === 0) { return []; }
	        return strSplit(this, separator, limit);
	    };
	}

	var str_replace = StringPrototype.replace;
	var replaceReportsGroupsCorrectly = (function () {
	    var groups = [];
	    'x'.replace(/x(.)?/g, function (match, group) {
	        pushCall(groups, group);
	    });
	    return groups.length === 1 && typeof groups[0] === 'undefined';
	}());

	if (!replaceReportsGroupsCorrectly) {
	    StringPrototype.replace = function replace(searchValue, replaceValue) {
	        var isFn = isCallable(replaceValue);
	        var hasCapturingGroups = isRegex(searchValue) && (/\)[*?]/).test(searchValue.source);
	        if (!isFn || !hasCapturingGroups) {
	            return str_replace.call(this, searchValue, replaceValue);
	        } else {
	            var wrappedReplaceValue = function (match) {
	                var length = arguments.length;
	                var originalLastIndex = searchValue.lastIndex;
	                searchValue.lastIndex = 0;
	                var args = searchValue.exec(match) || [];
	                searchValue.lastIndex = originalLastIndex;
	                pushCall(args, arguments[length - 2], arguments[length - 1]);
	                return replaceValue.apply(this, args);
	            };
	            return str_replace.call(this, searchValue, wrappedReplaceValue);
	        }
	    };
	}

	// ECMA-262, 3rd B.2.3
	// Not an ECMAScript standard, although ECMAScript 3rd Edition has a
	// non-normative section suggesting uniform semantics and it should be
	// normalized across all browsers
	// [bugfix, IE lt 9] IE < 9 substr() with negative value not working in IE
	var string_substr = StringPrototype.substr;
	var hasNegativeSubstrBug = ''.substr && '0b'.substr(-1) !== 'b';
	defineProperties(StringPrototype, {
	    substr: function substr(start, length) {
	        var normalizedStart = start;
	        if (start < 0) {
	            normalizedStart = max(this.length + start, 0);
	        }
	        return string_substr.call(this, normalizedStart, length);
	    }
	}, hasNegativeSubstrBug);

	// ES5 15.5.4.20
	// whitespace from: http://es5.github.io/#x15.5.4.20
	var ws = '\x09\x0A\x0B\x0C\x0D\x20\xA0\u1680\u180E\u2000\u2001\u2002\u2003' +
	    '\u2004\u2005\u2006\u2007\u2008\u2009\u200A\u202F\u205F\u3000\u2028' +
	    '\u2029\uFEFF';
	var zeroWidth = '\u200b';
	var wsRegexChars = '[' + ws + ']';
	var trimBeginRegexp = new RegExp('^' + wsRegexChars + wsRegexChars + '*');
	var trimEndRegexp = new RegExp(wsRegexChars + wsRegexChars + '*$');
	var hasTrimWhitespaceBug = StringPrototype.trim && (ws.trim() || !zeroWidth.trim());
	defineProperties(StringPrototype, {
	    // http://blog.stevenlevithan.com/archives/faster-trim-javascript
	    // http://perfectionkills.com/whitespace-deviations/
	    trim: function trim() {
	        if (typeof this === 'undefined' || this === null) {
	            throw new TypeError("can't convert " + this + ' to object');
	        }
	        return $String(this).replace(trimBeginRegexp, '').replace(trimEndRegexp, '');
	    }
	}, hasTrimWhitespaceBug);
	var trim = call.bind(String.prototype.trim);

	var hasLastIndexBug = StringPrototype.lastIndexOf && 'abcあい'.lastIndexOf('あい', 2) !== -1;
	defineProperties(StringPrototype, {
	    lastIndexOf: function lastIndexOf(searchString) {
	        if (typeof this === 'undefined' || this === null) {
	            throw new TypeError("can't convert " + this + ' to object');
	        }
	        var S = $String(this);
	        var searchStr = $String(searchString);
	        var numPos = arguments.length > 1 ? $Number(arguments[1]) : NaN;
	        var pos = isActualNaN(numPos) ? Infinity : ES.ToInteger(numPos);
	        var start = min(max(pos, 0), S.length);
	        var searchLen = searchStr.length;
	        var k = start + searchLen;
	        while (k > 0) {
	            k = max(0, k - searchLen);
	            var index = strIndexOf(strSlice(S, k, start + searchLen), searchStr);
	            if (index !== -1) {
	                return k + index;
	            }
	        }
	        return -1;
	    }
	}, hasLastIndexBug);

	var originalLastIndexOf = StringPrototype.lastIndexOf;
	defineProperties(StringPrototype, {
	    lastIndexOf: function lastIndexOf(searchString) {
	        return originalLastIndexOf.apply(this, arguments);
	    }
	}, StringPrototype.lastIndexOf.length !== 1);

	// ES-5 15.1.2.2
	/* eslint-disable radix */
	if (parseInt(ws + '08') !== 8 || parseInt(ws + '0x16') !== 22) {
	/* eslint-enable radix */
	    /* global parseInt: true */
	    parseInt = (function (origParseInt) {
	        var hexRegex = /^[\-+]?0[xX]/;
	        return function parseInt(str, radix) {
	            var string = trim(str);
	            var defaultedRadix = $Number(radix) || (hexRegex.test(string) ? 16 : 10);
	            return origParseInt(string, defaultedRadix);
	        };
	    }(parseInt));
	}

	// https://es5.github.io/#x15.1.2.3
	if (1 / parseFloat('-0') !== -Infinity) {
	    /* global parseFloat: true */
	    parseFloat = (function (origParseFloat) {
	        return function parseFloat(string) {
	            var inputString = trim(string);
	            var result = origParseFloat(inputString);
	            return result === 0 && strSlice(inputString, 0, 1) === '-' ? -0 : result;
	        };
	    }(parseFloat));
	}

	if (String(new RangeError('test')) !== 'RangeError: test') {
	    var errorToStringShim = function toString() {
	        if (typeof this === 'undefined' || this === null) {
	            throw new TypeError("can't convert " + this + ' to object');
	        }
	        var name = this.name;
	        if (typeof name === 'undefined') {
	            name = 'Error';
	        } else if (typeof name !== 'string') {
	            name = $String(name);
	        }
	        var msg = this.message;
	        if (typeof msg === 'undefined') {
	            msg = '';
	        } else if (typeof msg !== 'string') {
	            msg = $String(msg);
	        }
	        if (!name) {
	            return msg;
	        }
	        if (!msg) {
	            return name;
	        }
	        return name + ': ' + msg;
	    };
	    // can't use defineProperties here because of toString enumeration issue in IE <= 8
	    Error.prototype.toString = errorToStringShim;
	}

	if (supportsDescriptors) {
	    var ensureNonEnumerable = function (obj, prop) {
	        if (isEnum(obj, prop)) {
	            var desc = Object.getOwnPropertyDescriptor(obj, prop);
	            if (desc.configurable) {
	              desc.enumerable = false;
	              Object.defineProperty(obj, prop, desc);
	            }
	        }
	    };
	    ensureNonEnumerable(Error.prototype, 'message');
	    if (Error.prototype.message !== '') {
	      Error.prototype.message = '';
	    }
	    ensureNonEnumerable(Error.prototype, 'name');
	}

	if (String(/a/mig) !== '/a/gim') {
	    var regexToString = function toString() {
	        var str = '/' + this.source + '/';
	        if (this.global) {
	            str += 'g';
	        }
	        if (this.ignoreCase) {
	            str += 'i';
	        }
	        if (this.multiline) {
	            str += 'm';
	        }
	        return str;
	    };
	    // can't use defineProperties here because of toString enumeration issue in IE <= 8
	    RegExp.prototype.toString = regexToString;
	}

	}));


/***/ },

/***/ 840:
/***/ function(module, exports, __webpack_require__) {

	var require;var __WEBPACK_AMD_DEFINE_RESULT__;/* WEBPACK VAR INJECTION */(function(process, global, module) {/*!
	 * @overview es6-promise - a tiny implementation of Promises/A+.
	 * @copyright Copyright (c) 2014 Yehuda Katz, Tom Dale, Stefan Penner and contributors (Conversion to ES6 API by Jake Archibald)
	 * @license   Licensed under MIT license
	 *            See https://raw.githubusercontent.com/jakearchibald/es6-promise/master/LICENSE
	 * @version   3.1.2
	 */

	(function() {
	    "use strict";
	    function lib$es6$promise$utils$$objectOrFunction(x) {
	      return typeof x === 'function' || (typeof x === 'object' && x !== null);
	    }

	    function lib$es6$promise$utils$$isFunction(x) {
	      return typeof x === 'function';
	    }

	    function lib$es6$promise$utils$$isMaybeThenable(x) {
	      return typeof x === 'object' && x !== null;
	    }

	    var lib$es6$promise$utils$$_isArray;
	    if (!Array.isArray) {
	      lib$es6$promise$utils$$_isArray = function (x) {
	        return Object.prototype.toString.call(x) === '[object Array]';
	      };
	    } else {
	      lib$es6$promise$utils$$_isArray = Array.isArray;
	    }

	    var lib$es6$promise$utils$$isArray = lib$es6$promise$utils$$_isArray;
	    var lib$es6$promise$asap$$len = 0;
	    var lib$es6$promise$asap$$vertxNext;
	    var lib$es6$promise$asap$$customSchedulerFn;

	    var lib$es6$promise$asap$$asap = function asap(callback, arg) {
	      lib$es6$promise$asap$$queue[lib$es6$promise$asap$$len] = callback;
	      lib$es6$promise$asap$$queue[lib$es6$promise$asap$$len + 1] = arg;
	      lib$es6$promise$asap$$len += 2;
	      if (lib$es6$promise$asap$$len === 2) {
	        // If len is 2, that means that we need to schedule an async flush.
	        // If additional callbacks are queued before the queue is flushed, they
	        // will be processed by this flush that we are scheduling.
	        if (lib$es6$promise$asap$$customSchedulerFn) {
	          lib$es6$promise$asap$$customSchedulerFn(lib$es6$promise$asap$$flush);
	        } else {
	          lib$es6$promise$asap$$scheduleFlush();
	        }
	      }
	    }

	    function lib$es6$promise$asap$$setScheduler(scheduleFn) {
	      lib$es6$promise$asap$$customSchedulerFn = scheduleFn;
	    }

	    function lib$es6$promise$asap$$setAsap(asapFn) {
	      lib$es6$promise$asap$$asap = asapFn;
	    }

	    var lib$es6$promise$asap$$browserWindow = (typeof window !== 'undefined') ? window : undefined;
	    var lib$es6$promise$asap$$browserGlobal = lib$es6$promise$asap$$browserWindow || {};
	    var lib$es6$promise$asap$$BrowserMutationObserver = lib$es6$promise$asap$$browserGlobal.MutationObserver || lib$es6$promise$asap$$browserGlobal.WebKitMutationObserver;
	    var lib$es6$promise$asap$$isNode = typeof process !== 'undefined' && {}.toString.call(process) === '[object process]';

	    // test for web worker but not in IE10
	    var lib$es6$promise$asap$$isWorker = typeof Uint8ClampedArray !== 'undefined' &&
	      typeof importScripts !== 'undefined' &&
	      typeof MessageChannel !== 'undefined';

	    // node
	    function lib$es6$promise$asap$$useNextTick() {
	      // node version 0.10.x displays a deprecation warning when nextTick is used recursively
	      // see https://github.com/cujojs/when/issues/410 for details
	      return function() {
	        process.nextTick(lib$es6$promise$asap$$flush);
	      };
	    }

	    // vertx
	    function lib$es6$promise$asap$$useVertxTimer() {
	      return function() {
	        lib$es6$promise$asap$$vertxNext(lib$es6$promise$asap$$flush);
	      };
	    }

	    function lib$es6$promise$asap$$useMutationObserver() {
	      var iterations = 0;
	      var observer = new lib$es6$promise$asap$$BrowserMutationObserver(lib$es6$promise$asap$$flush);
	      var node = document.createTextNode('');
	      observer.observe(node, { characterData: true });

	      return function() {
	        node.data = (iterations = ++iterations % 2);
	      };
	    }

	    // web worker
	    function lib$es6$promise$asap$$useMessageChannel() {
	      var channel = new MessageChannel();
	      channel.port1.onmessage = lib$es6$promise$asap$$flush;
	      return function () {
	        channel.port2.postMessage(0);
	      };
	    }

	    function lib$es6$promise$asap$$useSetTimeout() {
	      return function() {
	        setTimeout(lib$es6$promise$asap$$flush, 1);
	      };
	    }

	    var lib$es6$promise$asap$$queue = new Array(1000);
	    function lib$es6$promise$asap$$flush() {
	      for (var i = 0; i < lib$es6$promise$asap$$len; i+=2) {
	        var callback = lib$es6$promise$asap$$queue[i];
	        var arg = lib$es6$promise$asap$$queue[i+1];

	        callback(arg);

	        lib$es6$promise$asap$$queue[i] = undefined;
	        lib$es6$promise$asap$$queue[i+1] = undefined;
	      }

	      lib$es6$promise$asap$$len = 0;
	    }

	    function lib$es6$promise$asap$$attemptVertx() {
	      try {
	        var r = require;
	        var vertx = __webpack_require__(868);
	        lib$es6$promise$asap$$vertxNext = vertx.runOnLoop || vertx.runOnContext;
	        return lib$es6$promise$asap$$useVertxTimer();
	      } catch(e) {
	        return lib$es6$promise$asap$$useSetTimeout();
	      }
	    }

	    var lib$es6$promise$asap$$scheduleFlush;
	    // Decide what async method to use to triggering processing of queued callbacks:
	    if (lib$es6$promise$asap$$isNode) {
	      lib$es6$promise$asap$$scheduleFlush = lib$es6$promise$asap$$useNextTick();
	    } else if (lib$es6$promise$asap$$BrowserMutationObserver) {
	      lib$es6$promise$asap$$scheduleFlush = lib$es6$promise$asap$$useMutationObserver();
	    } else if (lib$es6$promise$asap$$isWorker) {
	      lib$es6$promise$asap$$scheduleFlush = lib$es6$promise$asap$$useMessageChannel();
	    } else if (lib$es6$promise$asap$$browserWindow === undefined && "function" === 'function') {
	      lib$es6$promise$asap$$scheduleFlush = lib$es6$promise$asap$$attemptVertx();
	    } else {
	      lib$es6$promise$asap$$scheduleFlush = lib$es6$promise$asap$$useSetTimeout();
	    }
	    function lib$es6$promise$then$$then(onFulfillment, onRejection) {
	      var parent = this;
	      var state = parent._state;

	      if (state === lib$es6$promise$$internal$$FULFILLED && !onFulfillment || state === lib$es6$promise$$internal$$REJECTED && !onRejection) {
	        return this;
	      }

	      var child = new this.constructor(lib$es6$promise$$internal$$noop);
	      var result = parent._result;

	      if (state) {
	        var callback = arguments[state - 1];
	        lib$es6$promise$asap$$asap(function(){
	          lib$es6$promise$$internal$$invokeCallback(state, child, callback, result);
	        });
	      } else {
	        lib$es6$promise$$internal$$subscribe(parent, child, onFulfillment, onRejection);
	      }

	      return child;
	    }
	    var lib$es6$promise$then$$default = lib$es6$promise$then$$then;
	    function lib$es6$promise$promise$resolve$$resolve(object) {
	      /*jshint validthis:true */
	      var Constructor = this;

	      if (object && typeof object === 'object' && object.constructor === Constructor) {
	        return object;
	      }

	      var promise = new Constructor(lib$es6$promise$$internal$$noop);
	      lib$es6$promise$$internal$$resolve(promise, object);
	      return promise;
	    }
	    var lib$es6$promise$promise$resolve$$default = lib$es6$promise$promise$resolve$$resolve;

	    function lib$es6$promise$$internal$$noop() {}

	    var lib$es6$promise$$internal$$PENDING   = void 0;
	    var lib$es6$promise$$internal$$FULFILLED = 1;
	    var lib$es6$promise$$internal$$REJECTED  = 2;

	    var lib$es6$promise$$internal$$GET_THEN_ERROR = new lib$es6$promise$$internal$$ErrorObject();

	    function lib$es6$promise$$internal$$selfFulfillment() {
	      return new TypeError("You cannot resolve a promise with itself");
	    }

	    function lib$es6$promise$$internal$$cannotReturnOwn() {
	      return new TypeError('A promises callback cannot return that same promise.');
	    }

	    function lib$es6$promise$$internal$$getThen(promise) {
	      try {
	        return promise.then;
	      } catch(error) {
	        lib$es6$promise$$internal$$GET_THEN_ERROR.error = error;
	        return lib$es6$promise$$internal$$GET_THEN_ERROR;
	      }
	    }

	    function lib$es6$promise$$internal$$tryThen(then, value, fulfillmentHandler, rejectionHandler) {
	      try {
	        then.call(value, fulfillmentHandler, rejectionHandler);
	      } catch(e) {
	        return e;
	      }
	    }

	    function lib$es6$promise$$internal$$handleForeignThenable(promise, thenable, then) {
	       lib$es6$promise$asap$$asap(function(promise) {
	        var sealed = false;
	        var error = lib$es6$promise$$internal$$tryThen(then, thenable, function(value) {
	          if (sealed) { return; }
	          sealed = true;
	          if (thenable !== value) {
	            lib$es6$promise$$internal$$resolve(promise, value);
	          } else {
	            lib$es6$promise$$internal$$fulfill(promise, value);
	          }
	        }, function(reason) {
	          if (sealed) { return; }
	          sealed = true;

	          lib$es6$promise$$internal$$reject(promise, reason);
	        }, 'Settle: ' + (promise._label || ' unknown promise'));

	        if (!sealed && error) {
	          sealed = true;
	          lib$es6$promise$$internal$$reject(promise, error);
	        }
	      }, promise);
	    }

	    function lib$es6$promise$$internal$$handleOwnThenable(promise, thenable) {
	      if (thenable._state === lib$es6$promise$$internal$$FULFILLED) {
	        lib$es6$promise$$internal$$fulfill(promise, thenable._result);
	      } else if (thenable._state === lib$es6$promise$$internal$$REJECTED) {
	        lib$es6$promise$$internal$$reject(promise, thenable._result);
	      } else {
	        lib$es6$promise$$internal$$subscribe(thenable, undefined, function(value) {
	          lib$es6$promise$$internal$$resolve(promise, value);
	        }, function(reason) {
	          lib$es6$promise$$internal$$reject(promise, reason);
	        });
	      }
	    }

	    function lib$es6$promise$$internal$$handleMaybeThenable(promise, maybeThenable, then) {
	      if (maybeThenable.constructor === promise.constructor &&
	          then === lib$es6$promise$then$$default &&
	          constructor.resolve === lib$es6$promise$promise$resolve$$default) {
	        lib$es6$promise$$internal$$handleOwnThenable(promise, maybeThenable);
	      } else {
	        if (then === lib$es6$promise$$internal$$GET_THEN_ERROR) {
	          lib$es6$promise$$internal$$reject(promise, lib$es6$promise$$internal$$GET_THEN_ERROR.error);
	        } else if (then === undefined) {
	          lib$es6$promise$$internal$$fulfill(promise, maybeThenable);
	        } else if (lib$es6$promise$utils$$isFunction(then)) {
	          lib$es6$promise$$internal$$handleForeignThenable(promise, maybeThenable, then);
	        } else {
	          lib$es6$promise$$internal$$fulfill(promise, maybeThenable);
	        }
	      }
	    }

	    function lib$es6$promise$$internal$$resolve(promise, value) {
	      if (promise === value) {
	        lib$es6$promise$$internal$$reject(promise, lib$es6$promise$$internal$$selfFulfillment());
	      } else if (lib$es6$promise$utils$$objectOrFunction(value)) {
	        lib$es6$promise$$internal$$handleMaybeThenable(promise, value, lib$es6$promise$$internal$$getThen(value));
	      } else {
	        lib$es6$promise$$internal$$fulfill(promise, value);
	      }
	    }

	    function lib$es6$promise$$internal$$publishRejection(promise) {
	      if (promise._onerror) {
	        promise._onerror(promise._result);
	      }

	      lib$es6$promise$$internal$$publish(promise);
	    }

	    function lib$es6$promise$$internal$$fulfill(promise, value) {
	      if (promise._state !== lib$es6$promise$$internal$$PENDING) { return; }

	      promise._result = value;
	      promise._state = lib$es6$promise$$internal$$FULFILLED;

	      if (promise._subscribers.length !== 0) {
	        lib$es6$promise$asap$$asap(lib$es6$promise$$internal$$publish, promise);
	      }
	    }

	    function lib$es6$promise$$internal$$reject(promise, reason) {
	      if (promise._state !== lib$es6$promise$$internal$$PENDING) { return; }
	      promise._state = lib$es6$promise$$internal$$REJECTED;
	      promise._result = reason;

	      lib$es6$promise$asap$$asap(lib$es6$promise$$internal$$publishRejection, promise);
	    }

	    function lib$es6$promise$$internal$$subscribe(parent, child, onFulfillment, onRejection) {
	      var subscribers = parent._subscribers;
	      var length = subscribers.length;

	      parent._onerror = null;

	      subscribers[length] = child;
	      subscribers[length + lib$es6$promise$$internal$$FULFILLED] = onFulfillment;
	      subscribers[length + lib$es6$promise$$internal$$REJECTED]  = onRejection;

	      if (length === 0 && parent._state) {
	        lib$es6$promise$asap$$asap(lib$es6$promise$$internal$$publish, parent);
	      }
	    }

	    function lib$es6$promise$$internal$$publish(promise) {
	      var subscribers = promise._subscribers;
	      var settled = promise._state;

	      if (subscribers.length === 0) { return; }

	      var child, callback, detail = promise._result;

	      for (var i = 0; i < subscribers.length; i += 3) {
	        child = subscribers[i];
	        callback = subscribers[i + settled];

	        if (child) {
	          lib$es6$promise$$internal$$invokeCallback(settled, child, callback, detail);
	        } else {
	          callback(detail);
	        }
	      }

	      promise._subscribers.length = 0;
	    }

	    function lib$es6$promise$$internal$$ErrorObject() {
	      this.error = null;
	    }

	    var lib$es6$promise$$internal$$TRY_CATCH_ERROR = new lib$es6$promise$$internal$$ErrorObject();

	    function lib$es6$promise$$internal$$tryCatch(callback, detail) {
	      try {
	        return callback(detail);
	      } catch(e) {
	        lib$es6$promise$$internal$$TRY_CATCH_ERROR.error = e;
	        return lib$es6$promise$$internal$$TRY_CATCH_ERROR;
	      }
	    }

	    function lib$es6$promise$$internal$$invokeCallback(settled, promise, callback, detail) {
	      var hasCallback = lib$es6$promise$utils$$isFunction(callback),
	          value, error, succeeded, failed;

	      if (hasCallback) {
	        value = lib$es6$promise$$internal$$tryCatch(callback, detail);

	        if (value === lib$es6$promise$$internal$$TRY_CATCH_ERROR) {
	          failed = true;
	          error = value.error;
	          value = null;
	        } else {
	          succeeded = true;
	        }

	        if (promise === value) {
	          lib$es6$promise$$internal$$reject(promise, lib$es6$promise$$internal$$cannotReturnOwn());
	          return;
	        }

	      } else {
	        value = detail;
	        succeeded = true;
	      }

	      if (promise._state !== lib$es6$promise$$internal$$PENDING) {
	        // noop
	      } else if (hasCallback && succeeded) {
	        lib$es6$promise$$internal$$resolve(promise, value);
	      } else if (failed) {
	        lib$es6$promise$$internal$$reject(promise, error);
	      } else if (settled === lib$es6$promise$$internal$$FULFILLED) {
	        lib$es6$promise$$internal$$fulfill(promise, value);
	      } else if (settled === lib$es6$promise$$internal$$REJECTED) {
	        lib$es6$promise$$internal$$reject(promise, value);
	      }
	    }

	    function lib$es6$promise$$internal$$initializePromise(promise, resolver) {
	      try {
	        resolver(function resolvePromise(value){
	          lib$es6$promise$$internal$$resolve(promise, value);
	        }, function rejectPromise(reason) {
	          lib$es6$promise$$internal$$reject(promise, reason);
	        });
	      } catch(e) {
	        lib$es6$promise$$internal$$reject(promise, e);
	      }
	    }

	    function lib$es6$promise$promise$all$$all(entries) {
	      return new lib$es6$promise$enumerator$$default(this, entries).promise;
	    }
	    var lib$es6$promise$promise$all$$default = lib$es6$promise$promise$all$$all;
	    function lib$es6$promise$promise$race$$race(entries) {
	      /*jshint validthis:true */
	      var Constructor = this;

	      var promise = new Constructor(lib$es6$promise$$internal$$noop);

	      if (!lib$es6$promise$utils$$isArray(entries)) {
	        lib$es6$promise$$internal$$reject(promise, new TypeError('You must pass an array to race.'));
	        return promise;
	      }

	      var length = entries.length;

	      function onFulfillment(value) {
	        lib$es6$promise$$internal$$resolve(promise, value);
	      }

	      function onRejection(reason) {
	        lib$es6$promise$$internal$$reject(promise, reason);
	      }

	      for (var i = 0; promise._state === lib$es6$promise$$internal$$PENDING && i < length; i++) {
	        lib$es6$promise$$internal$$subscribe(Constructor.resolve(entries[i]), undefined, onFulfillment, onRejection);
	      }

	      return promise;
	    }
	    var lib$es6$promise$promise$race$$default = lib$es6$promise$promise$race$$race;
	    function lib$es6$promise$promise$reject$$reject(reason) {
	      /*jshint validthis:true */
	      var Constructor = this;
	      var promise = new Constructor(lib$es6$promise$$internal$$noop);
	      lib$es6$promise$$internal$$reject(promise, reason);
	      return promise;
	    }
	    var lib$es6$promise$promise$reject$$default = lib$es6$promise$promise$reject$$reject;

	    var lib$es6$promise$promise$$counter = 0;

	    function lib$es6$promise$promise$$needsResolver() {
	      throw new TypeError('You must pass a resolver function as the first argument to the promise constructor');
	    }

	    function lib$es6$promise$promise$$needsNew() {
	      throw new TypeError("Failed to construct 'Promise': Please use the 'new' operator, this object constructor cannot be called as a function.");
	    }

	    var lib$es6$promise$promise$$default = lib$es6$promise$promise$$Promise;
	    /**
	      Promise objects represent the eventual result of an asynchronous operation. The
	      primary way of interacting with a promise is through its `then` method, which
	      registers callbacks to receive either a promise's eventual value or the reason
	      why the promise cannot be fulfilled.

	      Terminology
	      -----------

	      - `promise` is an object or function with a `then` method whose behavior conforms to this specification.
	      - `thenable` is an object or function that defines a `then` method.
	      - `value` is any legal JavaScript value (including undefined, a thenable, or a promise).
	      - `exception` is a value that is thrown using the throw statement.
	      - `reason` is a value that indicates why a promise was rejected.
	      - `settled` the final resting state of a promise, fulfilled or rejected.

	      A promise can be in one of three states: pending, fulfilled, or rejected.

	      Promises that are fulfilled have a fulfillment value and are in the fulfilled
	      state.  Promises that are rejected have a rejection reason and are in the
	      rejected state.  A fulfillment value is never a thenable.

	      Promises can also be said to *resolve* a value.  If this value is also a
	      promise, then the original promise's settled state will match the value's
	      settled state.  So a promise that *resolves* a promise that rejects will
	      itself reject, and a promise that *resolves* a promise that fulfills will
	      itself fulfill.


	      Basic Usage:
	      ------------

	      ```js
	      var promise = new Promise(function(resolve, reject) {
	        // on success
	        resolve(value);

	        // on failure
	        reject(reason);
	      });

	      promise.then(function(value) {
	        // on fulfillment
	      }, function(reason) {
	        // on rejection
	      });
	      ```

	      Advanced Usage:
	      ---------------

	      Promises shine when abstracting away asynchronous interactions such as
	      `XMLHttpRequest`s.

	      ```js
	      function getJSON(url) {
	        return new Promise(function(resolve, reject){
	          var xhr = new XMLHttpRequest();

	          xhr.open('GET', url);
	          xhr.onreadystatechange = handler;
	          xhr.responseType = 'json';
	          xhr.setRequestHeader('Accept', 'application/json');
	          xhr.send();

	          function handler() {
	            if (this.readyState === this.DONE) {
	              if (this.status === 200) {
	                resolve(this.response);
	              } else {
	                reject(new Error('getJSON: `' + url + '` failed with status: [' + this.status + ']'));
	              }
	            }
	          };
	        });
	      }

	      getJSON('/posts.json').then(function(json) {
	        // on fulfillment
	      }, function(reason) {
	        // on rejection
	      });
	      ```

	      Unlike callbacks, promises are great composable primitives.

	      ```js
	      Promise.all([
	        getJSON('/posts'),
	        getJSON('/comments')
	      ]).then(function(values){
	        values[0] // => postsJSON
	        values[1] // => commentsJSON

	        return values;
	      });
	      ```

	      @class Promise
	      @param {function} resolver
	      Useful for tooling.
	      @constructor
	    */
	    function lib$es6$promise$promise$$Promise(resolver) {
	      this._id = lib$es6$promise$promise$$counter++;
	      this._state = undefined;
	      this._result = undefined;
	      this._subscribers = [];

	      if (lib$es6$promise$$internal$$noop !== resolver) {
	        typeof resolver !== 'function' && lib$es6$promise$promise$$needsResolver();
	        this instanceof lib$es6$promise$promise$$Promise ? lib$es6$promise$$internal$$initializePromise(this, resolver) : lib$es6$promise$promise$$needsNew();
	      }
	    }

	    lib$es6$promise$promise$$Promise.all = lib$es6$promise$promise$all$$default;
	    lib$es6$promise$promise$$Promise.race = lib$es6$promise$promise$race$$default;
	    lib$es6$promise$promise$$Promise.resolve = lib$es6$promise$promise$resolve$$default;
	    lib$es6$promise$promise$$Promise.reject = lib$es6$promise$promise$reject$$default;
	    lib$es6$promise$promise$$Promise._setScheduler = lib$es6$promise$asap$$setScheduler;
	    lib$es6$promise$promise$$Promise._setAsap = lib$es6$promise$asap$$setAsap;
	    lib$es6$promise$promise$$Promise._asap = lib$es6$promise$asap$$asap;

	    lib$es6$promise$promise$$Promise.prototype = {
	      constructor: lib$es6$promise$promise$$Promise,

	    /**
	      The primary way of interacting with a promise is through its `then` method,
	      which registers callbacks to receive either a promise's eventual value or the
	      reason why the promise cannot be fulfilled.

	      ```js
	      findUser().then(function(user){
	        // user is available
	      }, function(reason){
	        // user is unavailable, and you are given the reason why
	      });
	      ```

	      Chaining
	      --------

	      The return value of `then` is itself a promise.  This second, 'downstream'
	      promise is resolved with the return value of the first promise's fulfillment
	      or rejection handler, or rejected if the handler throws an exception.

	      ```js
	      findUser().then(function (user) {
	        return user.name;
	      }, function (reason) {
	        return 'default name';
	      }).then(function (userName) {
	        // If `findUser` fulfilled, `userName` will be the user's name, otherwise it
	        // will be `'default name'`
	      });

	      findUser().then(function (user) {
	        throw new Error('Found user, but still unhappy');
	      }, function (reason) {
	        throw new Error('`findUser` rejected and we're unhappy');
	      }).then(function (value) {
	        // never reached
	      }, function (reason) {
	        // if `findUser` fulfilled, `reason` will be 'Found user, but still unhappy'.
	        // If `findUser` rejected, `reason` will be '`findUser` rejected and we're unhappy'.
	      });
	      ```
	      If the downstream promise does not specify a rejection handler, rejection reasons will be propagated further downstream.

	      ```js
	      findUser().then(function (user) {
	        throw new PedagogicalException('Upstream error');
	      }).then(function (value) {
	        // never reached
	      }).then(function (value) {
	        // never reached
	      }, function (reason) {
	        // The `PedgagocialException` is propagated all the way down to here
	      });
	      ```

	      Assimilation
	      ------------

	      Sometimes the value you want to propagate to a downstream promise can only be
	      retrieved asynchronously. This can be achieved by returning a promise in the
	      fulfillment or rejection handler. The downstream promise will then be pending
	      until the returned promise is settled. This is called *assimilation*.

	      ```js
	      findUser().then(function (user) {
	        return findCommentsByAuthor(user);
	      }).then(function (comments) {
	        // The user's comments are now available
	      });
	      ```

	      If the assimliated promise rejects, then the downstream promise will also reject.

	      ```js
	      findUser().then(function (user) {
	        return findCommentsByAuthor(user);
	      }).then(function (comments) {
	        // If `findCommentsByAuthor` fulfills, we'll have the value here
	      }, function (reason) {
	        // If `findCommentsByAuthor` rejects, we'll have the reason here
	      });
	      ```

	      Simple Example
	      --------------

	      Synchronous Example

	      ```javascript
	      var result;

	      try {
	        result = findResult();
	        // success
	      } catch(reason) {
	        // failure
	      }
	      ```

	      Errback Example

	      ```js
	      findResult(function(result, err){
	        if (err) {
	          // failure
	        } else {
	          // success
	        }
	      });
	      ```

	      Promise Example;

	      ```javascript
	      findResult().then(function(result){
	        // success
	      }, function(reason){
	        // failure
	      });
	      ```

	      Advanced Example
	      --------------

	      Synchronous Example

	      ```javascript
	      var author, books;

	      try {
	        author = findAuthor();
	        books  = findBooksByAuthor(author);
	        // success
	      } catch(reason) {
	        // failure
	      }
	      ```

	      Errback Example

	      ```js

	      function foundBooks(books) {

	      }

	      function failure(reason) {

	      }

	      findAuthor(function(author, err){
	        if (err) {
	          failure(err);
	          // failure
	        } else {
	          try {
	            findBoooksByAuthor(author, function(books, err) {
	              if (err) {
	                failure(err);
	              } else {
	                try {
	                  foundBooks(books);
	                } catch(reason) {
	                  failure(reason);
	                }
	              }
	            });
	          } catch(error) {
	            failure(err);
	          }
	          // success
	        }
	      });
	      ```

	      Promise Example;

	      ```javascript
	      findAuthor().
	        then(findBooksByAuthor).
	        then(function(books){
	          // found books
	      }).catch(function(reason){
	        // something went wrong
	      });
	      ```

	      @method then
	      @param {Function} onFulfilled
	      @param {Function} onRejected
	      Useful for tooling.
	      @return {Promise}
	    */
	      then: lib$es6$promise$then$$default,

	    /**
	      `catch` is simply sugar for `then(undefined, onRejection)` which makes it the same
	      as the catch block of a try/catch statement.

	      ```js
	      function findAuthor(){
	        throw new Error('couldn't find that author');
	      }

	      // synchronous
	      try {
	        findAuthor();
	      } catch(reason) {
	        // something went wrong
	      }

	      // async with promises
	      findAuthor().catch(function(reason){
	        // something went wrong
	      });
	      ```

	      @method catch
	      @param {Function} onRejection
	      Useful for tooling.
	      @return {Promise}
	    */
	      'catch': function(onRejection) {
	        return this.then(null, onRejection);
	      }
	    };
	    var lib$es6$promise$enumerator$$default = lib$es6$promise$enumerator$$Enumerator;
	    function lib$es6$promise$enumerator$$Enumerator(Constructor, input) {
	      this._instanceConstructor = Constructor;
	      this.promise = new Constructor(lib$es6$promise$$internal$$noop);

	      if (Array.isArray(input)) {
	        this._input     = input;
	        this.length     = input.length;
	        this._remaining = input.length;

	        this._result = new Array(this.length);

	        if (this.length === 0) {
	          lib$es6$promise$$internal$$fulfill(this.promise, this._result);
	        } else {
	          this.length = this.length || 0;
	          this._enumerate();
	          if (this._remaining === 0) {
	            lib$es6$promise$$internal$$fulfill(this.promise, this._result);
	          }
	        }
	      } else {
	        lib$es6$promise$$internal$$reject(this.promise, this._validationError());
	      }
	    }

	    lib$es6$promise$enumerator$$Enumerator.prototype._validationError = function() {
	      return new Error('Array Methods must be provided an Array');
	    };

	    lib$es6$promise$enumerator$$Enumerator.prototype._enumerate = function() {
	      var length  = this.length;
	      var input   = this._input;

	      for (var i = 0; this._state === lib$es6$promise$$internal$$PENDING && i < length; i++) {
	        this._eachEntry(input[i], i);
	      }
	    };

	    lib$es6$promise$enumerator$$Enumerator.prototype._eachEntry = function(entry, i) {
	      var c = this._instanceConstructor;
	      var resolve = c.resolve;

	      if (resolve === lib$es6$promise$promise$resolve$$default) {
	        var then = lib$es6$promise$$internal$$getThen(entry);

	        if (then === lib$es6$promise$then$$default &&
	            entry._state !== lib$es6$promise$$internal$$PENDING) {
	          this._settledAt(entry._state, i, entry._result);
	        } else if (typeof then !== 'function') {
	          this._remaining--;
	          this._result[i] = entry;
	        } else if (c === lib$es6$promise$promise$$default) {
	          var promise = new c(lib$es6$promise$$internal$$noop);
	          lib$es6$promise$$internal$$handleMaybeThenable(promise, entry, then);
	          this._willSettleAt(promise, i);
	        } else {
	          this._willSettleAt(new c(function(resolve) { resolve(entry); }), i);
	        }
	      } else {
	        this._willSettleAt(resolve(entry), i);
	      }
	    };

	    lib$es6$promise$enumerator$$Enumerator.prototype._settledAt = function(state, i, value) {
	      var promise = this.promise;

	      if (promise._state === lib$es6$promise$$internal$$PENDING) {
	        this._remaining--;

	        if (state === lib$es6$promise$$internal$$REJECTED) {
	          lib$es6$promise$$internal$$reject(promise, value);
	        } else {
	          this._result[i] = value;
	        }
	      }

	      if (this._remaining === 0) {
	        lib$es6$promise$$internal$$fulfill(promise, this._result);
	      }
	    };

	    lib$es6$promise$enumerator$$Enumerator.prototype._willSettleAt = function(promise, i) {
	      var enumerator = this;

	      lib$es6$promise$$internal$$subscribe(promise, undefined, function(value) {
	        enumerator._settledAt(lib$es6$promise$$internal$$FULFILLED, i, value);
	      }, function(reason) {
	        enumerator._settledAt(lib$es6$promise$$internal$$REJECTED, i, reason);
	      });
	    };
	    function lib$es6$promise$polyfill$$polyfill() {
	      var local;

	      if (typeof global !== 'undefined') {
	          local = global;
	      } else if (typeof self !== 'undefined') {
	          local = self;
	      } else {
	          try {
	              local = Function('return this')();
	          } catch (e) {
	              throw new Error('polyfill failed because global object is unavailable in this environment');
	          }
	      }

	      var P = local.Promise;

	      if (P && Object.prototype.toString.call(P.resolve()) === '[object Promise]' && !P.cast) {
	        return;
	      }

	      local.Promise = lib$es6$promise$promise$$default;
	    }
	    var lib$es6$promise$polyfill$$default = lib$es6$promise$polyfill$$polyfill;

	    var lib$es6$promise$umd$$ES6Promise = {
	      'Promise': lib$es6$promise$promise$$default,
	      'polyfill': lib$es6$promise$polyfill$$default
	    };

	    /* global define:true module:true window: true */
	    if ("function" === 'function' && __webpack_require__(316)['amd']) {
	      !(__WEBPACK_AMD_DEFINE_RESULT__ = function() { return lib$es6$promise$umd$$ES6Promise; }.call(exports, __webpack_require__, exports, module), __WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
	    } else if (typeof module !== 'undefined' && module['exports']) {
	      module['exports'] = lib$es6$promise$umd$$ES6Promise;
	    } else if (typeof this !== 'undefined') {
	      this['ES6Promise'] = lib$es6$promise$umd$$ES6Promise;
	    }

	    lib$es6$promise$polyfill$$default();
	}).call(this);


	/* WEBPACK VAR INJECTION */}.call(exports, __webpack_require__(1), (function() { return this; }()), __webpack_require__(73)(module)))

/***/ },

/***/ 841:
/***/ function(module, exports) {

	/** @license
	 * eventsource.js
	 * Available under MIT License (MIT)
	 * https://github.com/Yaffle/EventSource/
	 */

	/*jslint indent: 2, vars: true, plusplus: true */
	/*global setTimeout, clearTimeout */

	(function (global) {
	  "use strict";

	  var setTimeout = global.setTimeout;
	  var clearTimeout = global.clearTimeout;

	  function Map() {
	    this.data = {};
	  }

	  Map.prototype.get = function (key) {
	    return this.data[key + "~"];
	  };
	  Map.prototype.set = function (key, value) {
	    this.data[key + "~"] = value;
	  };
	  Map.prototype["delete"] = function (key) {
	    delete this.data[key + "~"];
	  };

	  function EventTarget() {
	    this.listeners = new Map();
	  }

	  function throwError(e) {
	    setTimeout(function () {
	      throw e;
	    }, 0);
	  }

	  EventTarget.prototype.dispatchEvent = function (event) {
	    event.target = this;
	    var type = event.type.toString();
	    var listeners = this.listeners;
	    var typeListeners = listeners.get(type);
	    if (typeListeners == undefined) {
	      return;
	    }
	    var length = typeListeners.length;
	    var i = -1;
	    var listener = undefined;
	    while (++i < length) {
	      listener = typeListeners[i];
	      try {
	        listener.call(this, event);
	      } catch (e) {
	        throwError(e);
	      }
	    }
	  };
	  EventTarget.prototype.addEventListener = function (type, callback) {
	    type = type.toString();
	    var listeners = this.listeners;
	    var typeListeners = listeners.get(type);
	    if (typeListeners == undefined) {
	      typeListeners = [];
	      listeners.set(type, typeListeners);
	    }
	    var i = typeListeners.length;
	    while (--i >= 0) {
	      if (typeListeners[i] === callback) {
	        return;
	      }
	    }
	    typeListeners.push(callback);
	  };
	  EventTarget.prototype.removeEventListener = function (type, callback) {
	    type = type.toString();
	    var listeners = this.listeners;
	    var typeListeners = listeners.get(type);
	    if (typeListeners == undefined) {
	      return;
	    }
	    var length = typeListeners.length;
	    var filtered = [];
	    var i = -1;
	    while (++i < length) {
	      if (typeListeners[i] !== callback) {
	        filtered.push(typeListeners[i]);
	      }
	    }
	    if (filtered.length === 0) {
	      listeners["delete"](type);
	    } else {
	      listeners.set(type, filtered);
	    }
	  };

	  function Event(type) {
	    this.type = type;
	    this.target = undefined;
	  }

	  function MessageEvent(type, options) {
	    Event.call(this, type);
	    this.data = options.data;
	    this.lastEventId = options.lastEventId;
	  }

	  MessageEvent.prototype = Event.prototype;

	  var XHR = global.XMLHttpRequest;
	  var XDR = global.XDomainRequest;
	  var isCORSSupported = XHR != undefined && (new XHR()).withCredentials != undefined;
	  var Transport = isCORSSupported || (XHR != undefined && XDR == undefined) ? XHR : XDR;

	  var WAITING = -1;
	  var CONNECTING = 0;
	  var OPEN = 1;
	  var CLOSED = 2;
	  var AFTER_CR = 3;
	  var FIELD_START = 4;
	  var FIELD = 5;
	  var VALUE_START = 6;
	  var VALUE = 7;
	  var contentTypeRegExp = /^text\/event\-stream;?(\s*charset\=utf\-8)?$/i;

	  var MINIMUM_DURATION = 1000;
	  var MAXIMUM_DURATION = 18000000;

	  function getDuration(value, def) {
	    var n = value;
	    if (n !== n) {
	      n = def;
	    }
	    return (n < MINIMUM_DURATION ? MINIMUM_DURATION : (n > MAXIMUM_DURATION ? MAXIMUM_DURATION : n));
	  }

	  function fire(that, f, event) {
	    try {
	      if (typeof f === "function") {
	        f.call(that, event);
	      }
	    } catch (e) {
	      throwError(e);
	    }
	  }

	  function EventSource(url, options) {
	    url = url.toString();

	    var withCredentials = isCORSSupported && options != undefined && Boolean(options.withCredentials);
	    var initialRetry = getDuration(1000, 0);
	    var heartbeatTimeout = getDuration(45000, 0);

	    var lastEventId = "";
	    var that = this;
	    var retry = initialRetry;
	    var wasActivity = false;
	    var CurrentTransport = options != undefined && options.Transport != undefined ? options.Transport : Transport;
	    var xhr = new CurrentTransport();
	    var timeout = 0;
	    var timeout0 = 0;
	    var charOffset = 0;
	    var currentState = WAITING;
	    var dataBuffer = [];
	    var lastEventIdBuffer = "";
	    var eventTypeBuffer = "";
	    var onTimeout = undefined;

	    var state = FIELD_START;
	    var field = "";
	    var value = "";

	    function close() {
	      currentState = CLOSED;
	      if (xhr != undefined) {
	        xhr.abort();
	        xhr = undefined;
	      }
	      if (timeout !== 0) {
	        clearTimeout(timeout);
	        timeout = 0;
	      }
	      if (timeout0 !== 0) {
	        clearTimeout(timeout0);
	        timeout0 = 0;
	      }
	      that.readyState = CLOSED;
	    }

	    function onEvent(type) {
	      var responseText = "";
	      if (currentState === OPEN || currentState === CONNECTING) {
	        try {
	          responseText = xhr.responseText;
	        } catch (error) {
	          // IE 8 - 9 with XMLHttpRequest
	        }
	      }
	      var event = undefined;
	      var isWrongStatusCodeOrContentType = false;

	      if (currentState === CONNECTING) {
	        var status = 0;
	        var statusText = "";
	        var contentType = undefined;
	        if (!("contentType" in xhr)) {
	          try {
	            status = xhr.status;
	            statusText = xhr.statusText;
	            contentType = xhr.getResponseHeader("Content-Type");
	          } catch (error) {
	            // https://bugs.webkit.org/show_bug.cgi?id=29121
	            status = 0;
	            statusText = "";
	            contentType = undefined;
	            // FF < 14, WebKit
	            // https://bugs.webkit.org/show_bug.cgi?id=29658
	            // https://bugs.webkit.org/show_bug.cgi?id=77854
	          }
	        } else if (type !== "" && type !== "error") {
	          status = 200;
	          statusText = "OK";
	          contentType = xhr.contentType;
	        }
	        if (contentType == undefined) {
	          contentType = "";
	        }
	        if (status === 0 && statusText === "" && type === "load" && responseText !== "") {
	          status = 200;
	          statusText = "OK";
	          if (contentType === "") { // Opera 12
	            var tmp = (/^data\:([^,]*?)(?:;base64)?,[\S]*$/).exec(url);
	            if (tmp != undefined) {
	              contentType = tmp[1];
	            }
	          }
	        }
	        if (status === 200 && contentTypeRegExp.test(contentType)) {
	          currentState = OPEN;
	          wasActivity = true;
	          retry = initialRetry;
	          that.readyState = OPEN;
	          event = new Event("open");
	          that.dispatchEvent(event);
	          fire(that, that.onopen, event);
	          if (currentState === CLOSED) {
	            return;
	          }
	        } else {
	          // Opera 12
	          if (status !== 0 && (status !== 200 || contentType !== "")) {
	            var message = "";
	            if (status !== 200) {
	              message = "EventSource's response has a status " + status + " " + statusText.replace(/\s+/g, " ") + " that is not 200. Aborting the connection.";
	            } else {
	              message = "EventSource's response has a Content-Type specifying an unsupported type: " + contentType.replace(/\s+/g, " ") + ". Aborting the connection.";
	            }
	            setTimeout(function () {
	              throw new Error(message);
	            }, 0);
	            isWrongStatusCodeOrContentType = true;
	          }
	        }
	      }

	      if (currentState === OPEN) {
	        if (responseText.length > charOffset) {
	          wasActivity = true;
	        }
	        var i = charOffset - 1;
	        var length = responseText.length;
	        var c = "\n";
	        while (++i < length) {
	          c = responseText.charAt(i);
	          if (state === AFTER_CR && c === "\n") {
	            state = FIELD_START;
	          } else {
	            if (state === AFTER_CR) {
	              state = FIELD_START;
	            }
	            if (c === "\r" || c === "\n") {
	              if (field === "data") {
	                dataBuffer.push(value);
	              } else if (field === "id") {
	                lastEventIdBuffer = value;
	              } else if (field === "event") {
	                eventTypeBuffer = value;
	              } else if (field === "retry") {
	                initialRetry = getDuration(Number(value), initialRetry);
	                retry = initialRetry;
	              } else if (field === "heartbeatTimeout") {
	                heartbeatTimeout = getDuration(Number(value), heartbeatTimeout);
	                if (timeout !== 0) {
	                  clearTimeout(timeout);
	                  timeout = setTimeout(onTimeout, heartbeatTimeout);
	                }
	              }
	              value = "";
	              field = "";
	              if (state === FIELD_START) {
	                if (dataBuffer.length !== 0) {
	                  lastEventId = lastEventIdBuffer;
	                  if (eventTypeBuffer === "") {
	                    eventTypeBuffer = "message";
	                  }
	                  event = new MessageEvent(eventTypeBuffer, {
	                    data: dataBuffer.join("\n"),
	                    lastEventId: lastEventIdBuffer
	                  });
	                  that.dispatchEvent(event);
	                  if (eventTypeBuffer === "message") {
	                    fire(that, that.onmessage, event);
	                  }
	                  if (currentState === CLOSED) {
	                    return;
	                  }
	                }
	                dataBuffer.length = 0;
	                eventTypeBuffer = "";
	              }
	              state = c === "\r" ? AFTER_CR : FIELD_START;
	            } else {
	              if (state === FIELD_START) {
	                state = FIELD;
	              }
	              if (state === FIELD) {
	                if (c === ":") {
	                  state = VALUE_START;
	                } else {
	                  field += c;
	                }
	              } else if (state === VALUE_START) {
	                if (c !== " ") {
	                  value += c;
	                }
	                state = VALUE;
	              } else if (state === VALUE) {
	                value += c;
	              }
	            }
	          }
	        }
	        charOffset = length;
	      }

	      if ((currentState === OPEN || currentState === CONNECTING) &&
	          (type === "load" || type === "error" || isWrongStatusCodeOrContentType || (charOffset > 1024 * 1024) || (timeout === 0 && !wasActivity))) {
	        if (isWrongStatusCodeOrContentType) {
	          close();
	        } else {
	          if (type === "" && timeout === 0 && !wasActivity) {
	            setTimeout(function () {
	              throw new Error("No activity within " + heartbeatTimeout + " milliseconds. Reconnecting.");
	            }, 0);
	          }
	          currentState = WAITING;
	          xhr.abort();
	          if (timeout !== 0) {
	            clearTimeout(timeout);
	            timeout = 0;
	          }
	          if (retry > initialRetry * 16) {
	            retry = initialRetry * 16;
	          }
	          if (retry > MAXIMUM_DURATION) {
	            retry = MAXIMUM_DURATION;
	          }
	          timeout = setTimeout(onTimeout, retry);
	          retry = retry * 2 + 1;

	          that.readyState = CONNECTING;
	        }
	        event = new Event("error");
	        that.dispatchEvent(event);
	        fire(that, that.onerror, event);
	      } else {
	        if (timeout === 0) {
	          wasActivity = false;
	          timeout = setTimeout(onTimeout, heartbeatTimeout);
	        }
	      }
	    }

	    function onProgress() {
	      onEvent("progress");
	    }

	    function onLoad() {
	      onEvent("load");
	    }

	    function onError() {
	      onEvent("error");
	    }

	    function onReadyStateChange() {
	      if (xhr.readyState === 4) {
	        if (xhr.status === 0) {
	          onEvent("error");
	        } else {
	          onEvent("load");
	        }
	      } else {
	        onEvent("progress");
	      }
	    }

	    if (("readyState" in xhr) && global.opera != undefined) {
	      // workaround for Opera issue with "progress" events
	      timeout0 = setTimeout(function f() {
	        if (xhr.readyState === 3) {
	          onEvent("progress");
	        }
	        timeout0 = setTimeout(f, 500);
	      }, 0);
	    }

	    onTimeout = function () {
	      timeout = 0;
	      if (currentState !== WAITING) {
	        onEvent("");
	        return;
	      }

	      // loading indicator in Safari, Chrome < 14
	      // loading indicator in Firefox
	      // https://bugzilla.mozilla.org/show_bug.cgi?id=736723
	      if ((!("ontimeout" in xhr) || ("sendAsBinary" in xhr) || ("mozAnon" in xhr)) && global.document != undefined && global.document.readyState != undefined && global.document.readyState !== "complete") {
	        timeout = setTimeout(onTimeout, 4);
	        return;
	      }

	      // XDomainRequest#abort removes onprogress, onerror, onload
	      xhr.onload = onLoad;
	      xhr.onerror = onError;

	      if ("onabort" in xhr) {
	        // improper fix to match Firefox behaviour, but it is better than just ignore abort
	        // see https://bugzilla.mozilla.org/show_bug.cgi?id=768596
	        // https://bugzilla.mozilla.org/show_bug.cgi?id=880200
	        // https://code.google.com/p/chromium/issues/detail?id=153570
	        xhr.onabort = onError;
	      }

	      if ("onprogress" in xhr) {
	        xhr.onprogress = onProgress;
	      }
	      // IE 8-9 (XMLHTTPRequest)
	      // Firefox 3.5 - 3.6 - ? < 9.0
	      // onprogress is not fired sometimes or delayed
	      // see also #64
	      if ("onreadystatechange" in xhr) {
	        xhr.onreadystatechange = onReadyStateChange;
	      }

	      wasActivity = false;
	      timeout = setTimeout(onTimeout, heartbeatTimeout);

	      charOffset = 0;
	      currentState = CONNECTING;
	      dataBuffer.length = 0;
	      eventTypeBuffer = "";
	      lastEventIdBuffer = lastEventId;
	      value = "";
	      field = "";
	      state = FIELD_START;

	      var s = url.slice(0, 5);
	      if (s !== "data:" && s !== "blob:") {
	        s = url + ((url.indexOf("?", 0) === -1 ? "?" : "&") + "lastEventId=" + encodeURIComponent(lastEventId) + "&r=" + (Math.random() + 1).toString().slice(2));
	      } else {
	        s = url;
	      }
	      xhr.open("GET", s, true);

	      if ("withCredentials" in xhr) {
	        // withCredentials should be set after "open" for Safari and Chrome (< 19 ?)
	        xhr.withCredentials = withCredentials;
	      }

	      if ("responseType" in xhr) {
	        xhr.responseType = "text";
	      }

	      if ("setRequestHeader" in xhr) {
	        // Request header field Cache-Control is not allowed by Access-Control-Allow-Headers.
	        // "Cache-control: no-cache" are not honored in Chrome and Firefox
	        // https://bugzilla.mozilla.org/show_bug.cgi?id=428916
	        //xhr.setRequestHeader("Cache-Control", "no-cache");
	        xhr.setRequestHeader("Accept", "text/event-stream");
	        // Request header field Last-Event-ID is not allowed by Access-Control-Allow-Headers.
	        //xhr.setRequestHeader("Last-Event-ID", lastEventId);
	      }

	      xhr.send(undefined);
	    };

	    EventTarget.call(this);
	    this.close = close;
	    this.url = url;
	    this.readyState = CONNECTING;
	    this.withCredentials = withCredentials;

	    this.onopen = undefined;
	    this.onmessage = undefined;
	    this.onerror = undefined;

	    onTimeout();
	  }

	  function F() {
	    this.CONNECTING = CONNECTING;
	    this.OPEN = OPEN;
	    this.CLOSED = CLOSED;
	  }
	  F.prototype = EventTarget.prototype;

	  EventSource.prototype = new F();
	  F.call(EventSource);
	  if (isCORSSupported) {
	    EventSource.prototype.withCredentials = undefined;
	  }

	  var isEventSourceSupported = function () {
	    // Opera 12 fails this test, but this is fine.
	    return global.EventSource != undefined && ("withCredentials" in global.EventSource.prototype);
	  };

	  if (Transport != undefined && (global.EventSource == undefined || (isCORSSupported && !isEventSourceSupported()))) {
	    // Why replace a native EventSource ?
	    // https://bugzilla.mozilla.org/show_bug.cgi?id=444328
	    // https://bugzilla.mozilla.org/show_bug.cgi?id=831392
	    // https://code.google.com/p/chromium/issues/detail?id=260144
	    // https://code.google.com/p/chromium/issues/detail?id=225654
	    // ...
	    global.NativeEventSource = global.EventSource;
	    global.EventSource = EventSource;
	  }

	}(typeof window !== 'undefined' ? window : this));


/***/ },

/***/ 868:
/***/ function(module, exports) {

	/* (ignored) */

/***/ }

/******/ });