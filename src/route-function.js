const express = require('express');
const app = express();
const path = require('path');
const db = require('./db-connect.js');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const session = require('express-session');
// const SendOtp = require('sendotp');

app.use(cookieParser());

const sess = {
	secret: 'hehe',
	cookie: {}
}

app.use(session(sess));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

exports.index = function(req, res) {
	res.json("Works");
}

exports.login = function(req, res) {
	var username = "dyo";
	var password = "123";

	db.query("SELECT * FROM users WHERE username = '"+username+"' AND password = '"+password+"'", function(result) {
		if(result.length) {
			session.username = result[0].username;
			console.log("Welcome " + session.username);
			res.json("Welcome " + session.username);
		}
		else {
			console.log(404);
			res.json(404);
		}
	});
}

exports.session = function(req, res) {
	res.json(session.username);
}

exports.admin = function(req, res) {
	res.sendFile(path.join(__dirname, '../public', 'admin.html'));
}

exports.getOtp = function(req, res) {
	var otp =  Math.floor(1000 + Math.random() * 9000);

	db.query("INSERT INTO otp (id, otp_code, status, user_id) VALUES('', '"+otp+"', 1, 2)");
	//status 0 = inactive, 1 = active(default), 2 = finished

	res.json(otp);

	// --Send the otp to admin's phone number

	// const sendOtp = new SendOtp('1111');
	// sendOtp.send("+6282299392596", "PRIIND", function (error, data) {
	// 	console.log(data);
	// 	res.json(data);
	// });
}

exports.postOtp = function(req, res) {
	var username = req.body.username;
	var password = req.body.password;
	var otp = req.body.otp;

	db.query("SELECT * FROM users WHERE username = '"+username+"' AND password = '"+password+"'", function(result) {
		if(result.length) {
			var user_id = result[0].id;
		}
		else {
			console.log(404);
		}
	});

	var dbOtp = db.query("SELECT * FROM otp WHERE user_id = "+user_id);

	if(otp == dbOtp) {
		res.json(1);
	}
	else {
		res.json(403);
	}
}