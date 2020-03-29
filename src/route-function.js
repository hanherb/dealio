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

	db.query("INSERT INTO admin (id, username, password, role_id) VALUES ('', '"+username+"', '"+password+"', 1)", function(result) {	
		res.json(1);
	});
}

exports.loginAdmin = function(req, res) {
	var username = req.body.username;
	var password = req.body.password;

	db.query("SELECT * FROM admin WHERE username = '"+username+"' AND password = '"+password+"'", function(result) {
		if(result.length) {
			sess.user = result[0];

			db.query("UPDATE admin SET date_login = '"+middle.getDate()+"', time_login = '"+middle.getTime()+"' WHERE id = "+sess.user.id, function(result) {
				console.log("Logged in at " + middle.getDate() + " " + middle.getTime());
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
    var category_id = req.body.category_id;

	db.query("INSERT INTO merchant (id, name, category_id) VALUES ('', '"+name+"', '"+category_id+"')", function(result) {	
		res.json(result);
	});
}

exports.editMerchant = function(req, res) {
	var name = req.body.name;
    var category_id = req.body.category_id;
    var image = req.body.image;

	db.query("UPDATE merchant SET name = '"+name+"', category_id = '"+category_id+"', image = '"+image+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneDeals = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM deals WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getDeals = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM deals", function(result) {
		res.json(result);
	});
}

exports.addDeals = function(req, res) {
	var name = req.body.name;
    var merchant_id = req.body.merchant_id;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var date = req.body.date;
    var time = req.body.time;

	db.query("INSERT INTO deals (id, name, audience_id, start_date, end_date, description, action, action_link, merchant_id, date, time) VALUES ('', '"+name+"', '"+audience_id+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+action+"', '"+action_link+"', '"+merchant_id+"', '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editDeals = function(req, res) {
	var name = req.body.name;
    var merchant_id = req.body.merchant_id;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE deals SET name = '"+name+"', audience_id = '"+audience_id+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', action = '"+action+"', action_link = '"+action_link+"', image = '"+image+"', banner = '"+banner+"', merchant_id = "+merchant_id+" WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneEarn = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM earn WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getEarn = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM earn", function(result) {
		res.json(result);
	});
}

exports.addEarn = function(req, res) {
	var name = req.body.name;
    var merchant_id = req.body.merchant_id;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var date = req.body.date;
    var time = req.body.time;

	db.query("INSERT INTO earn (id, name, audience_id, start_date, end_date, description, action, action_link, merchant_id, date, time) VALUES ('', '"+name+"', '"+audience_id+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+action+"', '"+action_link+"', "+merchant_id+", '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editEarn = function(req, res) {
	var name = req.body.name;
    var merchant_id = req.body.merchant_id;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var action = req.body.action;
    var action_link = req.body.action_link;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE earn SET name = '"+name+"', audience_id = '"+audience_id+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', action = '"+action+"', action_link = '"+action_link+"', image = '"+image+"', banner = '"+banner+"', merchant_id = "+merchant_id+" WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneWin = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM win WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getWin = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM win", function(result) {
		res.json(result);
	});
}

exports.addWin = function(req, res) {
	var name = req.body.name;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var point_redeem = req.body.point_redeem;
    var date = req.body.date;
    var time = req.body.time;

	db.query("INSERT INTO win (id, name, audience_id, start_date, end_date, description, point_redeem, date, time) VALUES ('', '"+name+"', '"+audience_id+"', '"+start_date+"', '"+end_date+"', '"+description+"', "+point_redeem+", '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editWin = function(req, res) {
	var name = req.body.name;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var point_redeem = req.body.point_redeem;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE win SET name = '"+name+"', audience_id = '"+audience_id+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', image = '"+image+"', banner = '"+banner+"', point_redeem = "+point_redeem+" WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneProductDeals = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM product_deals WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getProductDeals = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM product_deals", function(result) {
		res.json(result);
	});
}

exports.addProductDeals = function(req, res) {
	var name = req.body.name;
    var merchant_id = req.body.merchant_id;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var price = req.body.price;
    var discount = req.body.discount;
    var date = req.body.date;
    var time = req.body.time;

	db.query("INSERT INTO product_deals (id, name, audience_id, start_date, end_date, description, price, discount, merchant_id, date, time) VALUES ('', '"+name+"', '"+audience_id+"', '"+start_date+"', '"+end_date+"', '"+description+"', "+price+", "+discount+", "+merchant_id+", '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editProductDeals = function(req, res) {
	var name = req.body.name;
    var merchant_id = req.body.merchant_id;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var audience_id = req.body.audience_id;
    var description = req.body.description;
    var price = req.body.price;
    var discount = req.body.discount;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE product_deals SET name = '"+name+"', audience_id = '"+audience_id+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', price = "+price+", discount = "+discount+", image = '"+image+"', banner = '"+banner+"', merchant_id = "+merchant_id+" WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneAudience = function(req, res) {
	db.query("SELECT * FROM audience WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getAudience = function(req, res) {
	db.query("SELECT * FROM audience", function(result) {
		res.json(result);
	});
}

exports.addAudience = function(req, res) {
	var name = req.body.name;
    var city = req.body.city;
    var gender = req.body.gender;
    var age_start = req.body.age_start;
    var age_end = req.body.age_end;

	db.query("INSERT INTO audience (id, name, city, gender, age_start, age_end) VALUES ('', '"+name+"', '"+city+"', '"+gender+"', '"+age_start+"', '"+age_end+"')", function(result) {	
		res.json(result);
	});
}

exports.editAudience = function(req, res) {
	var name = req.body.name;
    var city = req.body.city;
    var gender = req.body.gender;
    var age_start = req.body.age_start;
    var age_end = req.body.age_end;

	db.query("UPDATE audience SET name = '"+name+"', city = '"+city+"', gender = '"+gender+"', age_start = '"+age_start+"', age_end = '"+age_end+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneNews = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM news WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getNews = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM news", function(result) {
		res.json(result);
	});
}

exports.addNews = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var source = req.body.source;
    var description = req.body.description;
    var date = req.body.date;
    var time = req.body.time;

	db.query("INSERT INTO news (id, title, start_date, end_date, source, description, date, time) VALUES ('', '"+title+"', '"+start_date+"', '"+end_date+"', '"+source+"', '"+description+"', '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editNews = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var source = req.body.source;
    var description = req.body.description;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE news SET title = '"+title+"', start_date = '"+start_date+"', end_date = '"+end_date+"', source = '"+source+"', description = '"+description+"', image = '"+image+"', banner = '"+banner+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneStream = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM stream WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getStream = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM stream", function(result) {
		res.json(result);
	});
}

exports.addStream = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var video_url = req.body.video_url;
    var date = req.body.date;
    var time = req.body.time;

	db.query("INSERT INTO stream (id, title, start_date, end_date, video_url, date, time) VALUES ('', '"+title+"', '"+start_date+"', '"+end_date+"', '"+video_url+"', '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editStream = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var video_url = req.body.video_url;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE stream SET title = '"+title+"', start_date = '"+start_date+"', end_date = '"+end_date+"', video_url = '"+video_url+"', image = '"+image+"', banner = '"+banner+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneEvent = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM event WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getEvent = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM event", function(result) {
		res.json(result);
	});
}

exports.addEvent = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var description = req.body.description;
    var date = req.body.date;
    var time = req.body.time;

	db.query("INSERT INTO event (id, title, start_date, end_date, description, date, time) VALUES ('', '"+title+"', '"+start_date+"', '"+end_date+"', '"+description+"', '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editEvent = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var description = req.body.description;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE event SET title = '"+title+"', start_date = '"+start_date+"', end_date = '"+end_date+"', description = '"+description+"', image = '"+image+"', banner = '"+banner+"' WHERE id = "+ req.body.id, function(result) {	
		res.json(result);
	});
}

exports.getOneHoroscope = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM horoscope WHERE id = "+req.query.id, function(result) {
		res.json(result);
	});
}

exports.getHoroscope = function(req, res) {
	db.query("SELECT *, date_format(start_date, '%Y-%m-%d') AS start_date, date_format(end_date, '%Y-%m-%d') AS end_date, date_format(date, '%Y-%m-%d') AS date, date_format(time, '%H:%i:%s') AS time FROM horoscope", function(result) {
		res.json(result);
	});
}

exports.addHoroscope = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var zodiac_sign = req.body.zodiac_sign;
    var description = req.body.description;
    var date = req.body.date;
    var time = req.body.time;

	db.query("INSERT INTO horoscope (id, title, start_date, end_date, zodiac_sign, description, date, time) VALUES ('', '"+title+"', '"+start_date+"', '"+end_date+"', '"+zodiac_sign+"', '"+description+"', '"+date+"', '"+time+"')", function(result) {	
		res.json(result);
	});
}

exports.editHoroscope = function(req, res) {
	var title = req.body.title;
    var start_date = req.body.start_date;
    var end_date = req.body.end_date;
    var zodiac_sign = req.body.zodiac_sign;
    var description = req.body.description;
    var image = req.body.image;
    var banner = req.body.banner;

	db.query("UPDATE horoscope SET title = '"+title+"', start_date = '"+start_date+"', end_date = '"+end_date+"', zodiac_sign = '"+zodiac_sign+"', description = '"+description+"', image = '"+image+"', banner = '"+banner+"' WHERE id = "+ req.body.id, function(result) {	
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

exports.postBanner = function(req, res) {
	if(req.file) {
		res.json(req.file);
	}
	else {
		res.json(404);
	}
}

exports.postMerchantImage = function(req, res) {
	if(req.file) {
		res.json(req.file);
	}
	else {
		res.json(404);
	}
}

exports.getOtp = function(req, res) {
	var otp =  Math.floor(1000 + Math.random() * 9000);

	db.query("INSERT INTO otp (id, otp_code, status, user_id) VALUES('', '"+otp+"', 1, "+sess.user.id+")");
	//status 0 = inactive, 1 = active(default), 2 = finished

	const from = 'Dealio';
	const to = sess.user.phone_number;
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

	db.query("SELECT * FROM admin WHERE username = '"+username+"' AND password = '"+password+"'", function(result) {
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
	db.query("UPDATE admin SET date_logout = '"+middle.getDate()+"', time_logout = '"+middle.getTime()+"' WHERE id = "+sess.user.id, function(result) {
		console.log("Logged out at " + middle.getDate() + " " + middle.getTime());
		sess = session;
		res.json(1);
	});
}