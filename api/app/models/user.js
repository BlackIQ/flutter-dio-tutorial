const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const userModule = new Schema({
    username: {
        type: String,
        required: true
    },
    password: {
        type: String,
        required: true
    },
    name: {
        type: String,
        required: false
    },
    bio: {
        type: String,
        required: false
    },
}, {timestamps: true});

const User = mongoose.model('user', userModule);

module.exports = User;