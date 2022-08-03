const User = require('../models/user');

const login = (req, res) => {
    res.header("Access-Control-Allow-Origin", "*");

    User.findOne(req.body)
        .then((user) => {
            if (user === null) {
                const data = {
                    message: "User is not found"
                };

                res.status(401);
                res.send(data);
            } else {
                const data = {
                    user
                };

                res.status(200);
                res.send(data);
            }
        })
        .catch((error) => {
            const data = {
                error
            };

            res.status(500);
            res.send(data);
        });
}

module.exports = {
    login,
}