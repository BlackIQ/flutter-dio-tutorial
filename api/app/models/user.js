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
        default: "",
    },
    bio: {
        type: String,
        required: false,
        default: "",
    },
}, {timestamps: true});

const User = mongoose.model('user', userModule);

module.exports = User;