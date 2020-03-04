const express = require('express');
const app = express();
const rf = require('./src/route-function');

const router = express.Router();

router.route('/').get(function(req, res) {rf.index(req, res)});

router.route('/login').get(function(req, res) {rf.login(req, res)});

router.route('/session').get(function(req, res) {rf.session(req, res)});

router.route('/admin').get(function(req, res) {rf.admin(req, res)});

router.route('/get-otp').get(function(req, res) {rf.getOtp(req, res)});

router.route('/post-otp').post(function(req, res) {rf.postOtp(req, res)});

router.route('/initiate-lock').post(function(req, res) {rf.initiateLock(req, res)});

module.exports = router;