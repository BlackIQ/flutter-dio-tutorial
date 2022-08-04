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
                res.status(200);
                res.send(user);
            }
        })
        .catch((error) => {
            const data = {
                message: "Server error"
            };

            res.status(500);
            res.send(data);
        });
}

const register = (req, res) => {
    res.header("Access-Control-Allow-Origin", "*");

    const user = new User(req.body);
    user.save()
        .then((user) => {
            res.status(200);
            res.send(user);
        })
        .catch((error) => {
            const data = {
                message: "Server error"
            };

            res.status(500);
            res.send(data);
        });
}

const update = (req, res) => {
    res.send({message: "hi"});
}

const users = (req, res) => {
    User.find()
        .then((users) => {
            res.status(200);
            res.send(users);
        })
        .catch((error) => {
            const data = {
                message: "Server error"
            };

            res.status(500);
            res.send(data);
        });
}

const user = (req, res) => {
    User.findById(req.params.user_id)
        .then((user) => {
            res.status(200);
            res.send(user);
        })
        .catch((error) => {
            const data = {
                message: "Server error"
            };

            res.status(500);
            res.send(data);
        });
}

module.exports = {
    login,
    register,
    update,
    users,
    user,
}