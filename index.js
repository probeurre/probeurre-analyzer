var fs = require('fs');

// file list
var params = process.argv.slice(2);

// json with all comments
var source = params[0];

var filetext = fs.readFileSync(source, 'utf8');
var comments = JSON.parse(filetext);

var output = {};

// all files
for (var file in comments) {
	output[file] = {};
	
	// all comments
	for (var commentLine in comments[file]) {
		var comment = comments[file][commentLine];
		
		if (/\s*TODO\W*\s+/gi.test(comment.content)) {
			output[file][commentLine] = comment;
		}
	}
}

console.log(JSON.stringify(output))