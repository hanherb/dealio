const express = require('express');
const app = express();
const cors = require('cors');
const bodyParser = require('body-parser');
const route = require('./route.js');
const middle = require('./src/middleware');

app.use(cors());

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE, navPlugin');
    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Access-Control-Allow-Headers, Accept, Authorization');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});

app.all('*', middle.beforeEndPoint);

app.use('/', route);

app.use(express.static(__dirname + '/public',{ redirect : false }));

var server = app.listen(3000, function () {
  var port = server.address().port;
	var address = server.address().address;

  	console.log('App listening at port:', address + port);
});