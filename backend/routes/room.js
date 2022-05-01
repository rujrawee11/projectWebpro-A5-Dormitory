const express = require("express");
const path = require("path");
const pool = require("../config");
const fs = require("fs");
const multer = require("multer");
var bodyParser = require('body-parser');
const { isLoggedIn } = require('../middlewares')


router = express.Router();

router.get("/checkRoom", isLoggedIn, async function (req, res, next) {
    const conn = await pool.getConnection()
    await conn.beginTransaction();
  
    try {
      /* const [rows1, fields1] = await conn.query(
        'SELECT * FROM `rent_detail` '
      ) */
      const [rows1, fields] = await pool.query('SELECT * FROM rent_detail')
  
      const [rows2, fields2] = await pool.query('SELECT * FROM rent_detail AS a LEFT JOIN invoice AS b ON a.tenant_id = b.tenant_id')
  
      const [rows3, fields3] = await conn.query(
        'SELECT build, count(room_id), tenant_id AS count FROM `rent_detail` GROUP BY `build`'
      )
  
      const [rows4, fields4] = await conn.query(
        'SELECT floor FROM `rent_detail` GROUP BY `floor`'
      )
      console.log(rows3)
      await conn.commit()
      return res.json({ blog: rows3, room: rows1, floor: rows4, invoice: rows2, error: null })
    } catch (err) {
      await conn.rollback();
      return res.status(500).json(err)
    } finally {
      console.log('finally')
      conn.release();
    }
  });

  router.get("/checkRoom/profile/:id", isLoggedIn, async function (req, res, next) {
    const conn = await pool.getConnection()
    await conn.beginTransaction();
  
    try {
      const [rows, fields] = await conn.query(
        'SELECT a.*, b.* FROM users AS a LEFT JOIN vehicle AS b ON a.id = b.tenant_id WHERE a.room_id LIKE ?',
    [req.params.id]
      )
      
      const [rows2, fields2] = await pool.query('SELECT a.*, b.* FROM rent_detail AS a LEFT JOIN users AS b ON b.id = a.tenant_id WHERE a.room_number LIKE ?',
    [req.params.id])

      const [rows3, fields3] = await conn.query(
        'SELECT * FROM `contract` WHERE `room_number` LIKE ?',
        [req.params.id]
      )
      console.log('checkme')
      console.log(rows2)
      await conn.commit()
      return res.json({vehicle: rows, users: rows2[0], contract: rows3[0], error: null })
    } catch (err) {
      await conn.rollback();
      return res.send('not')
    } finally {
      console.log('finally')
      conn.release();
    }
  });
  exports.router = router;