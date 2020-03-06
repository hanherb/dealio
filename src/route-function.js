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

exports.getOneDeal = function(req, res) {
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
    var image = req.body.image;

	db.query("INSERT INTO deals (id, name, audience, start_date, end_date, description, image, vendor) VALUES ('', '"+name+"', '"+audience+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+image+"', '"+vendor+"')", function(result) {	
		res.json(1);
	});
}

exports.editDeals = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var image = req.body.image;

	db.query("UPDATE deals SET name = '"+name+"', audience = '"+audience+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', image = '"+image+"', vendor = '"+vendor+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(1);
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
    var image = req.body.image;

	db.query("INSERT INTO earn (id, name, audience, start_date, end_date, description, image, vendor) VALUES ('', '"+name+"', '"+audience+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+image+"', '"+vendor+"')", function(result) {	
		res.json(1);
	});
}

exports.editEarn = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var image = req.body.image;

	db.query("UPDATE earn SET name = '"+name+"', audience = '"+audience+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', image = '"+image+"', vendor = '"+vendor+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(1);
	});
}

exports.getOneLoyalty = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date FROM loyalty WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getLoyalty = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date FROM loyalty", function(result) {
		res.json(result);
	});
}

exports.addLoyalty = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var image = req.body.image;

	db.query("INSERT INTO loyalty (id, name, audience, start_date, end_date, description, image, vendor) VALUES ('', '"+name+"', '"+audience+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+image+"', '"+vendor+"')", function(result) {	
		res.json(1);
	});
}

exports.editLoyalty = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var image = req.body.image;

	db.query("UPDATE loyalty SET name = '"+name+"', audience = '"+audience+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', image = '"+image+"', vendor = '"+vendor+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(1);
	});
}

exports.getOneDealOfTheMonth = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date FROM deal_of_the_month WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getDealOfTheMonth = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date FROM deal_of_the_month", function(result) {
		res.json(result);
	});
}

exports.addDealOfTheMonth = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var image = req.body.image;

	db.query("INSERT INTO deal_of_the_month (id, name, audience, start_date, end_date, description, image, vendor) VALUES ('', '"+name+"', '"+audience+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+image+"', '"+vendor+"')", function(result) {	
		res.json(1);
	});
}

exports.editDealOfTheMonth = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var image = req.body.image;

	db.query("UPDATE deal_of_the_month SET name = '"+name+"', audience = '"+audience+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', image = '"+image+"', vendor = '"+vendor+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(1);
	});
}

exports.getOneDealOfTheWeek = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date FROM deal_of_the_week WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getDealOfTheWeek = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date FROM deal_of_the_week", function(result) {
		res.json(result);
	});
}

exports.addDealOfTheWeek = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var image = req.body.image;

	db.query("INSERT INTO deal_of_the_week (id, name, audience, start_date, end_date, description, image, vendor) VALUES ('', '"+name+"', '"+audience+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+image+"', '"+vendor+"')", function(result) {	
		res.json(1);
	});
}

exports.editDealOfTheWeek = function(req, res) {
	var name = req.body.name;
    var vendor = req.body.vendor;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience = req.body.audience;
    var description = req.body.description;
    var image = req.body.image;

	db.query("UPDATE deal_of_the_week SET name = '"+name+"', audience = '"+audience+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', image = '"+image+"', vendor = '"+vendor+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(1);
	});
}

exports.admin = function(req, res) {
	res.sendFile(path.join(__dirname, '../public', 'admin.html'));
}

exports.client = function(req, res) {
	res.sendFile(path.join(__dirname, '../public', 'client.html'));
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