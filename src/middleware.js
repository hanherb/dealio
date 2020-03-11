const jwt = require('jsonwebtoken');

function getFirstPath(path) {
	return '/' + path.split('/')[1].split('/')[0];
}

exports.getDate = function() {
	let currentdate = new Date();
	let day = currentdate.getDate();
	let month = currentdate.getMonth();
	let year = currentdate.getFullYear();
	let second = currentdate.getSeconds();
    let minute = currentdate.getMinutes();
    let hour = currentdate.getHours();

    let dateformat = year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
	return dateformat;
}

exports.beforeEndPoint = function(req, res, next) { //JWT verification goes here
	if(req.path != '/login-admin' && 
		req.path != '/register-admin' && 
		getFirstPath(req.path) != '/images' && 
		req.path != '/logout') {
		const bearerHeader = req.headers['authorization'];
		if(typeof bearerHeader !== 'undefined') {
			const bearer = bearerHeader.split(' ');
			const bearerToken = bearer[1];

			req.token = bearerToken;
			jwt.verify(req.token, 'kuda', (err, authData) => {
				if(err) {
					res.sendStatus(403);
				}
				else {
					// logger(req, res, next);
					next();
				}
			});
		}
		else {
			res.sendStatus(403);
		}
	}
	else {
		next();
	}
}