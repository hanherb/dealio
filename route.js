const express = require('express');
const app = express();
const rf = require('./src/route-function');

const router = express.Router();

router.route('/').get(function(req, res) {rf.index(req, res)});

router.route('/admin').get(function(req, res) {rf.admin(req, res)});

router.route('/send-otp').get(function(req, res) {rf.send(req, res)});

module.exports = router;