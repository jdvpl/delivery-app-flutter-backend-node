const {Router}=require('express');
const { getAll, register, login } = require('../controllers/usersController');


const router=Router();

    // / TRAER DATOS
    router.get('/getAll', getAll);

    // GUARDAR DATOS
    router.post('/create', register);
    router.post('/login', login);


module.exports =router;