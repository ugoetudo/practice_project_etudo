const db = require('../db.js')
const mysql = require('mysql')
var express = require('express');
var router = express.Router();
var https = require("https");
var cors = require("cors");

/* GET users listing. */
/* npm install cors */
/* to start mysql "..\..\Program Files\MySQL\MySQL Server 8.0\bin\mysql" -uroot -p  ==> this will prompt for a password which should be "password" at first*/
/* mysql> status; ==> shows connection information which you'll need later */
/* insert into student_user values (120, 'ugo', 'etudo', 'etudouo@vcu.edu', now()); */

const connection = mysql.createConnection(db.conn_info)

connection.connect()

var corsOptions = {
  origin: "*",
}

router.get('/', cors(corsOptions), function(req, res, next) {
  const vnum = req.query.vnum
  connection.query('select first_name, last_name from student_user where vnum = ?', [vnum], (e, r, f) => {
    if (!e) {
      res.json(r[0])
    }
    else {
      next(e)
    }
  })
});

module.exports = router;
