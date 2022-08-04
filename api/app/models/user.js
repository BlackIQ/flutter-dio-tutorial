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
        required: false,
        default: null,
    },
    bio: {
        type: String,
        required: false,
        default: null,
    },
}, {timestamps: true});

const User = mongoose.model('user', userModule);

module.exports = User;