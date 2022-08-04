const express = require('express');

const controllers = require('../controllers/UserControllers');

const router = express.Router();

router.post('/login', controllers.login);
router.post('/register', controllers.register);
router.put('/change', controllers.update);
router.get('/get/users', controllers.users);
router.get('/get/user/:user_id', controllers.user);

module.exports = router;