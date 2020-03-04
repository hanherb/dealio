const db = require('./db-connect.js');

exports.query = function(query, callback) {
	db.connect(function(err) {
	  if (err) throw err;
	  db.query(query, function (err, result, fields) {
	    if (err) throw err;
	    if (callback) {
	    	return callback(result);
	    	db.end();
	    }
	  });
	});
}