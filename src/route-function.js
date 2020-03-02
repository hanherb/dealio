const express = require('express');
const app = express();
const path = require('path');
// const SendOtp = require('sendotp');

exports.index = function(req, res) {
	console.log("Works");
	res.json("Works");
}

exports.admin = function(req, res) {
	res.sendFile(path.join(__dirname, '../public', 'admin.html'));
}

exports.adminOtp = function(req, res) {
	// const sendOtp = new SendOtp('1111');

	var otp =  Math.floor(1000 + Math.random() * 9000);

	res.json(otp); // --Next, store in db with active flag. After a certain amount of time, change flag to inactive

	// --Send the otp to admin's phone number

	// sendOtp.send("+6282299392596", "PRIIND", function (error, data) {
	// 	console.log(data);
	// 	res.json(data);
	// });
}