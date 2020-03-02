var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var route = require('./route.js');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use('/', route);

app.use(express.static(__dirname + '/public',{ redirect : false }));

var server = app.listen(3000, function () {
  var port = server.address().port;
	var address = server.address().address;

  	console.log('App listening at port:', address + port);
});