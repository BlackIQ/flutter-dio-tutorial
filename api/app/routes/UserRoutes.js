const express = require('express');

const controllers = require('../controllers/UserControllers');

const router = express.Router();

router.post('/login', controllers.login);
router.get('/test', controllers.test);

module.exports = router;