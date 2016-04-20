module.exports = function() {};
module.exports.pitch = function(req) {
	this.cacheable();
	x = "require(" + JSON.stringify(require.resolve("./style-collector")) + ").add(require(" + JSON.stringify("!!" + req) + "));\n" +
		"delete require.cache[module.id];";
	console.log("\n\nmy cool css loader ran\n\n");
	console.log(x);
	return x;
}