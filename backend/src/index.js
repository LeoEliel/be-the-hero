const express = require('express');
const cors = require('cors');
const routes = require('./routes');

const app = express();
 
app.use(cors());
app.use(express.json());
app.use(routes);
/**
 * Rota / Recursos 
 */

 /**
  * Metodos HTTP
  * 
  * GET: Buscar/listar informações do backend
  * POST: Criar uma informação no backend
  * PUT: Alterar uma informação no backend
  * DELETE: Deletar uma informação no backend 
  */

/**
 * Tipos de Parâmetros:
 * 
 * Query Params: Parametros nomeados enviados na rota 
 * após "?"" (Filtros, paginação)
 * 
 * Route: Params: Parâmetros utilizados 
 * para identificar recursos
 * 
 * Request Body: Corpo da requisição, utilizado para
 * criar ou alterar recursos
 */

 /**
  * SQL: MySQL, SQLite, PostgreSQL, Oracle, Microsoft SQL Server
  * NoSQL: MongoDB, CouchDB, etc...
  */
 /**
  * Driver: SELECT * FROM users
  * Query Builder: table('users').select('*').where()
  * 
  * Entidades: ONG, Caso (incident)
  * 
  * Funcionalidades: Login de ONG, Logout de ONG,
  * Cadastro de ONG, Cadastrar novos casos, 
  * Deletar casos, Listar casos específicos de uma ONG,
  * Listar todos os casos, Entrar em Contato com a ONG
  */ 
app.listen(3333);