const express = require('express');
const app = express();
const rf = require('./src/route-function');
const multer = require('multer');

const router = express.Router();

const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, __dirname + '/public/images');
    },
    filename: function(req, file, cb) {
        cb(null, file.originalname + '.png');
    }
});

const upload = multer({storage});

router.route('/').get(function(req, res) {rf.index(req, res)});

router.route('/register-admin').post(function(req, res) {rf.registerAdmin(req, res)});

router.route('/login-admin').post(function(req, res) {rf.loginAdmin(req, res)});

router.route('/get-one-deals').get(function(req, res) {rf.getOneDeals(req, res)});

router.route('/get-deals').get(function(req, res) {rf.getDeals(req, res)});

router.route('/add-deals').post(function(req, res) {rf.addDeals(req, res)});

router.route('/edit-deals').post(function(req, res) {rf.editDeals(req, res)});

router.route('/get-one-earn').get(function(req, res) {rf.getOneEarn(req, res)});

router.route('/get-earn').get(function(req, res) {rf.getEarn(req, res)});

router.route('/add-earn').post(function(req, res) {rf.addEarn(req, res)});

router.route('/edit-earn').post(function(req, res) {rf.editEarn(req, res)});

router.route('/get-one-loyalty').get(function(req, res) {rf.getOneLoyalty(req, res)});

router.route('/get-loyalty').get(function(req, res) {rf.getLoyalty(req, res)});

router.route('/add-loyalty').post(function(req, res) {rf.addLoyalty(req, res)});

router.route('/edit-loyalty').post(function(req, res) {rf.editLoyalty(req, res)});

router.route('/get-one-deal-of-the-month').get(function(req, res) {rf.getOneDealOfTheMonth(req, res)});

router.route('/get-deal-of-the-month').get(function(req, res) {rf.getDealOfTheMonth(req, res)});

router.route('/add-deal-of-the-month').post(function(req, res) {rf.addDealOfTheMonth(req, res)});

router.route('/edit-deal-of-the-month').post(function(req, res) {rf.editDealOfTheMonth(req, res)});

router.route('/get-one-deal-of-the-week').get(function(req, res) {rf.getOneDealOfTheWeek(req, res)});

router.route('/get-deal-of-the-week').get(function(req, res) {rf.getDealOfTheWeek(req, res)});

router.route('/add-deal-of-the-week').post(function(req, res) {rf.addDealOfTheWeek(req, res)});

router.route('/edit-deal-of-the-week').post(function(req, res) {rf.editDealOfTheWeek(req, res)});

router.route('/post-image').post(upload.single('image'), function(req, res) {rf.postImage(req, res)});

router.route('/get-otp').get(function(req, res) {rf.getOtp(req, res)});

router.route('/post-otp').post(function(req, res) {rf.postOtp(req, res)});

router.route('/logout').get(function(req, res) {rf.logout(req, res)});

module.exports = router;