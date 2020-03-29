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

router.route('/get-one-merchant').get(function(req, res) {rf.getOneMerchant(req, res)});

router.route('/get-merchant').get(function(req, res) {rf.getMerchant(req, res)});

router.route('/add-merchant').post(function(req, res) {rf.addMerchant(req, res)});

router.route('/edit-merchant').post(function(req, res) {rf.editMerchant(req, res)});

router.route('/get-one-deals').get(function(req, res) {rf.getOneDeals(req, res)});

router.route('/get-deals').get(function(req, res) {rf.getDeals(req, res)});

router.route('/add-deals').post(function(req, res) {rf.addDeals(req, res)});

router.route('/edit-deals').post(function(req, res) {rf.editDeals(req, res)});

router.route('/get-one-earn').get(function(req, res) {rf.getOneEarn(req, res)});

router.route('/get-earn').get(function(req, res) {rf.getEarn(req, res)});

router.route('/add-earn').post(function(req, res) {rf.addEarn(req, res)});

router.route('/edit-earn').post(function(req, res) {rf.editEarn(req, res)});

router.route('/get-one-win').get(function(req, res) {rf.getOneWin(req, res)});

router.route('/get-win').get(function(req, res) {rf.getWin(req, res)});

router.route('/add-win').post(function(req, res) {rf.addWin(req, res)});

router.route('/edit-win').post(function(req, res) {rf.editWin(req, res)});

router.route('/get-one-product-deals').get(function(req, res) {rf.getOneProductDeals(req, res)});

router.route('/get-product-deals').get(function(req, res) {rf.getProductDeals(req, res)});

router.route('/add-product-deals').post(function(req, res) {rf.addProductDeals(req, res)});

router.route('/edit-product-deals').post(function(req, res) {rf.editProductDeals(req, res)});

router.route('/get-one-audience').get(function(req, res) {rf.getOneAudience(req, res)});

router.route('/get-audience').get(function(req, res) {rf.getAudience(req, res)});

router.route('/add-audience').post(function(req, res) {rf.addAudience(req, res)});

router.route('/edit-audience').post(function(req, res) {rf.editAudience(req, res)});

router.route('/get-one-news').get(function(req, res) {rf.getOneNews(req, res)});

router.route('/get-news').get(function(req, res) {rf.getNews(req, res)});

router.route('/add-news').post(function(req, res) {rf.addNews(req, res)});

router.route('/edit-news').post(function(req, res) {rf.editNews(req, res)});

router.route('/get-one-stream').get(function(req, res) {rf.getOneStream(req, res)});

router.route('/get-stream').get(function(req, res) {rf.getStream(req, res)});

router.route('/add-stream').post(function(req, res) {rf.addStream(req, res)});

router.route('/edit-stream').post(function(req, res) {rf.editStream(req, res)});

router.route('/get-one-event').get(function(req, res) {rf.getOneEvent(req, res)});

router.route('/get-event').get(function(req, res) {rf.getEvent(req, res)});

router.route('/add-event').post(function(req, res) {rf.addEvent(req, res)});

router.route('/edit-event').post(function(req, res) {rf.editEvent(req, res)});

router.route('/get-one-horoscope').get(function(req, res) {rf.getOneHoroscope(req, res)});

router.route('/get-horoscope').get(function(req, res) {rf.getHoroscope(req, res)});

router.route('/add-horoscope').post(function(req, res) {rf.addHoroscope(req, res)});

router.route('/edit-horoscope').post(function(req, res) {rf.editHoroscope(req, res)});

router.route('/post-image').post(upload.single('image'), function(req, res) {rf.postImage(req, res)});

router.route('/post-banner').post(upload.single('banner'), function(req, res) {rf.postBanner(req, res)});

router.route('/post-merchant-image').post(upload.single('merchant'), function(req, res) {rf.postMerchantImage(req, res)});

router.route('/get-otp').get(function(req, res) {rf.getOtp(req, res)});

router.route('/post-otp').post(function(req, res) {rf.postOtp(req, res)});

router.route('/logout').get(function(req, res) {rf.logout(req, res)});

module.exports = router;