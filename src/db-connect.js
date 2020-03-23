var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "dealio"
});

exports.query = function(query, callback) {
  con.query(query, function (err, result, fields) {
    if (err) 
    	throw err;
    if (callback)
    	return callback(result);
  });
}