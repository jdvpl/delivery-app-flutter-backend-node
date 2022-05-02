const express = require('express');
const cors = require('cors');
const http = require('http');
const logger = require('morgan');

class Server{
  constructor(){
    this.app = express();
    this.port = process.env.PORT || 4000;

    this.paths={
      users:'/api/users/',
    }
    // middleware: son funcionalidads para el webserver
    this.middlewares();
    // rutas de mi app
    this.routes();

  }

  routes() {
    this.app.use(this.paths.users, require('../routes/usersRoutes'))
  }

  listen() {
    this.app.listen(this.port, () => {
      console.log(`Corriendo http://localhost:${this.port}`)
    });
  }

  middlewares() {
    // usar cors
    this.app.use(cors());
    // parseo de la info del body
    this.app.use(express.json())

  }
}

module.exports = Server;