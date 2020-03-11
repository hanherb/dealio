const express = require('express');
const app = express();
const path = require('path');
const db = require('./db-connect.js');
const middle = require('./middleware.js');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');
const Nexmo = require('nexmo');
// const SendOtp = require('sendotp');

const nexmo = new Nexmo({
	apiKey: '438024ea',
  	apiSecret: '7JHAmXh4xWPyyG8V',
});

app.use(cookieParser());

app.use(session({
	secret: '123456',
	saveUninitialized : true, 
	resave : true,
	cookie: { 
		secure: false,
		maxAge: 24 * 60 * 60 * 1000
	},
}));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

var sess = session;

exports.index = function(req, res) {
	res.json("Works");
}

exports.registerAdmin = function(req, res) {
	var username = req.body.username;
	var password = req.body.password;

	db.query("INSERT INTO users (id, username, password, role_id) VALUES ('', '"+username+"', '"+password+"', 1)", function(result) {	
		res.json(1);
	});
}

exports.loginAdmin = function(req, res) {
	var username = req.body.username;
	var password = req.body.password;

	db.query("SELECT * FROM users WHERE username = '"+username+"' AND password = '"+password+"'", function(result) {
		if(result.length) {
			sess.user = result[0];

			db.query("UPDATE users SET last_logged_in = '"+middle.getDate()+"' WHERE id = "+sess.user.id, function(result) {
				console.log("Logged in at " + middle.getDate());
			});
			jwt.sign({
				id: result[0].id,
				username: result[0].username
			},'kuda', {expiresIn: '24h'}, (err, token) => {
	    		res.json({token, response: result[0]});
	      	});
		}
		else {
			console.log(404);
			res.json(404);
		}
	});
}

exports.getOneMerchant = function(req, res) {
	db.query("SELECT * FROM merchant WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getMerchant = function(req, res) {
	db.query("SELECT * FROM merchant", function(result) {
		res.json(result);
	});
}

exports.addMerchant = function(req, res) {
	var name = req.body.name;
    var search_name = req.body.search_name;

	db.query("INSERT INTO merchant (id, name, search_name) VALUES ('', '"+name+"', '"+search_name+"')", function(result) {	
		res.json(result);
	});
}

exports.editMerchant = function(req, res) {
	var name = req.body.name;
    var search_name = req.body.search_name;

	db.query("UPDATE merchant SET name = '"+name+"', search_name = '"+search_name+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneDeals = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date FROM deals WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getDeals = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date FROM deals", function(result) {
		res.json(result);
	});
}

exports.addDeals = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var image = req.body.image;

	db.query("INSERT INTO deals (id, name, audience, start_date, end_date, description, image, action, action_link, vendor) VALUES ('', '"+name+"', '"+audience+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+image+"', '"+action+"', '"+action_link+"', '"+vendor+"')", function(result) {	
		res.json(result);
	});
}

exports.editDeals = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var image = req.body.image;

	db.query("UPDATE deals SET name = '"+name+"', audience = '"+audience+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', action = '"+action+"', action_link = '"+action_link+"', image = '"+image+"', vendor = '"+vendor+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneEarn = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date FROM earn WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getEarn = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date FROM earn", function(result) {
		res.json(result);
	});
}

exports.addEarn = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var image = req.body.image;

	db.query("INSERT INTO earn (id, name, audience, start_date, end_date, description, image, action, action_link, vendor) VALUES ('', '"+name+"', '"+audience+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+image+"', '"+action+"', '"+action_link+"', '"+vendor+"')", function(result) {	
		res.json(result);
	});
}

exports.editEarn = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var image = req.body.image;

	db.query("UPDATE earn SET name = '"+name+"', audience = '"+audience+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', action = '"+action+"', action_link = '"+action_link+"', image = '"+image+"', vendor = '"+vendor+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneWin = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date FROM win WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getWin = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date FROM win", function(result) {
		res.json(result);
	});
}

exports.addWin = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var image = req.body.image;

	db.query("INSERT INTO win (id, name, audience, start_date, end_date, description, image, action, action_link, vendor) VALUES ('', '"+name+"', '"+audience+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+image+"', '"+action+"', '"+action_link+"', '"+vendor+"')", function(result) {	
		res.json(result);
	});
}

exports.editWin = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var image = req.body.image;

	db.query("UPDATE win SET name = '"+name+"', audience = '"+audience+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', action = '"+action+"', action_link = '"+action_link+"', image = '"+image+"', vendor = '"+vendor+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.postImage = function(req, res) {
	if(req.file) {
		res.json(req.file);
	}
	else {
		res.json(404);
	}
}

exports.getOtp = function(req, res) {
	var otp =  Math.floor(1000 + Math.random() * 9000);

	db.query("INSERT INTO otp (id, otp_code, status, user_id) VALUES('', '"+otp+"', 1, "+session.user.id+")");
	//status 0 = inactive, 1 = active(default), 2 = finished

	const from = 'Dealio';
	const to = session.user.phone_number;
	const text = 'Your One-time Password (OTP) is: ' + otp +'. Do not share this code to anyone.';

	// This function require 0.02 euro
	// nexmo.message.sendSms(from, to, text, {type: "unicode"}, (err, responseData) => {
 //  		if (err) {
	//     	console.log(err);
	//   	} 
	//   	else {
	//     	if (responseData.messages[0]['status'] === "0") {
	//       		console.log("Message sent successfully.");
	//     	}
	//     	else {
	//       		console.log(`Message failed with error: ${responseData.messages[0]['error-text']}`);
	//     	}
	//   	}
	// });

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

exports.logout = function(req, res) {
	db.query("UPDATE users SET last_logged_out = '"+middle.getDate()+"' WHERE id = "+sess.user.id, function(result) {
		console.log("Logged out at " + middle.getDate());
		sess = session;
		res.json(1);
	});
}