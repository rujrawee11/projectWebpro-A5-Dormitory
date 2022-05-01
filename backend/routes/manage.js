const express = require("express");
const path = require("path");
const pool = require("../config");
const fs = require("fs");
const multer = require("multer");
var bodyParser = require('body-parser');
const { isLoggedIn } = require('../middlewares')


router = express.Router();

const blogOwner = async (req, res, next) => {
  if (req.user.role === 'admin') {
    return next()
  }
  const [[blog]] = await pool.query('SELECT * FROM blogs WHERE id=?', [req.params.id])

  if (blog.create_by_id !== req.user.id) {
    return res.status(403).send('You do not have permission to perform this action')
  }

  next()
}


// SET STORAGE
const storage = multer.diskStorage({
  destination: function (req, file, callback) {
    callback(null, "./static/uploads");
  },
  filename: function (req, file, callback) {
    callback(
      null,
      file.fieldname + "-" + Date.now() + path.extname(file.originalname)
    );
  },
});
const upload = multer({ storage: storage });

/* router.get("/manage", async function (req, res, next) {
  const [rows, fields] = await pool.query('SELECT * FROM users WHERE id = ?', [req.params.id])
  res.render("manage_account", { data: JSON.stringify(rows) })

}) */

router.get("/manage", isLoggedIn, async function (req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction();

  try {
    const [rows2, fields2] = await conn.query(
      'SELECT * FROM `users` WHERE `id` = ?',
      [req.user.id]
    )
    await conn.commit()
    return res.json({ blog: rows2[0], error: null })
  } catch (err) {
    await conn.rollback();
    return res.status(500).json(err)
  } finally {
    console.log('finally')
    conn.release();
  }
});

router.put("/updateProfile", isLoggedIn, async function (req, res, next) {
  // Your code here
  console.log(req.body)
  const name = req.body.name
  const surname = req.body.surname
  const tel1 = req.body.tel1
  const tel2 = req.body.tel2

  //transaction
  const conn = await pool.getConnection()

  await conn.beginTransaction()

  try {
    const [rows1, fields1] = await conn.query("UPDATE users SET first_name=?, last_name=?, mobile=?, phone2=? WHERE id=?", [
      name, surname, tel1, tel2, req.user.id,
    ]);

    //console.log(blogs.insertId)
    //console.log(file.path)
    res.json({
      name: name,
      surname: surname,
      tel1: tel1,
      tel2: tel2,
    })
    await conn.commit()
  } catch (err) {
    console.log(err)
    await conn.rollback()
    return next(error)
  } finally {
    console.log('finally')
    await conn.release()
  }


});

router.put("/updateEmail", isLoggedIn, async function (req, res, next) {
  // Your code here
  console.log(req.body)
  const email = req.body.email

  //transaction
  const conn = await pool.getConnection()

  await conn.beginTransaction()

  try {
    const [rows1, fields1] = await conn.query("UPDATE users SET email=? WHERE id=?", [
      email, req.user.id,
    ]);

    //console.log(blogs.insertId)
    //console.log(file.path)
    res.json({ email: email })
    await conn.commit()
  } catch (err) {
    console.log(err)
    await conn.rollback()
    return next(error)
  } finally {
    console.log('finally')
    await conn.release()
  }


});

router.get("/manageInvoice", isLoggedIn, async function (req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction();

  try {
    /* const [rows1, fields1] = await conn.query(
      'SELECT * FROM `rent_detail` '
    ) */
    const [rows1, fields] = await pool.query('SELECT * FROM rent_detail')

    const [rows2, fields2] = await pool.query('SELECT * FROM rent_detail AS a LEFT JOIN invoice AS b ON a.tenant_id = b.tenant_id')

    const [rows3, fields3] = await conn.query(
      'SELECT build, count(room_id) AS count FROM `rent_detail` GROUP BY `build`'
    )

    const [rows4, fields4] = await conn.query(
      'SELECT floor FROM `rent_detail` GROUP BY `floor`'
    )
    console.log(rows2)
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

router.get("/showInvoice/:id", isLoggedIn, async function (req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction();

  try {

    const [rows, fields] = await pool.query('SELECT a.*, b.* FROM users AS a LEFT JOIN invoice AS b ON a.id = b.tenant_id WHERE a.id = ?',
    [req.params.id])

    console.log(rows)
    await conn.commit()
    return res.json({ blog: rows[0], error: null })
  } catch (err) {
    await conn.rollback();
    return res.status(500).json(err)
  } finally {
    console.log('finally')
    conn.release();
  }
});

router.get("/Manageinvoice/sendInvoice/:id", isLoggedIn, async function (req, res, next) {
  const conn = await pool.getConnection()
  await conn.beginTransaction();

  try {
    const [rows, fields] = await conn.query(
      'SELECT a.*, b.* FROM users AS a LEFT JOIN meter AS b ON a.id = b.tenant_id WHERE a.room_id LIKE ?',
      [req.params.id])
    
    const [rows2, fields2] = await conn.query(
      'SELECT expenses, status, note, discount FROM `invoice` WHERE room_number LIKE ?', [req.params.id]
    )
  
    const [rows1, fields1] = await pool.query('SELECT a.*, b.* FROM users AS a LEFT JOIN rent_detail AS b ON a.id = b.tenant_id WHERE a.room_id LIKE ?',
    [req.params.id])
    console.log('checkme')
    console.log(rows1[0])
    await conn.commit()
    return res.json({meter: rows, dorm: rows1[0], invoice: rows2, error: null })
  } catch (err) {
    await conn.rollback();
    return res.send('not data')
  } finally {
    console.log('finally')
    conn.release();
  }
});

router.post("/sendBill", isLoggedIn, async function (req, res, next) {
  const month = req.body.month;
  const room_number = req.body.room_number;
  const year = req.body.year;
  const common_fee = req.body.common_fee;
  const dorm_fee = req.body.dorm_fee;
  const electricity_fee = req.body.electricity_fee;
  const water_fee = req.body.water_fee;
  const expenses = req.body.expenses;
  const discount = req.body.discount;
  const total = req.body.total;
  const note = req.body.note;
  const status = req.body.status;
  const tenant_id = req.body.tenant_id;

  // Begin transaction
  const conn = await pool.getConnection();
  await conn.beginTransaction();

  try {
    const [rows1, fields1] = await conn.query(
      'INSERT INTO `invoice` (`month`, `room_number`, `year`, `common_fee`, `dorm_fee`, `electricity_fee`, `water_fee`, `expenses`, `discount`, `total`, `note`, `status`, `tenant_id`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [month, room_number, year, common_fee, dorm_fee, electricity_fee, water_fee, expenses, discount, total, note, status, tenant_id]
  )
  const [rows2, fields2] = await conn.query(
    'SELECT * FROM `invoice` WHERE `invoice_number` = ?',
    [rows1.insertId]
)

    await conn.commit()
    console.log(rows2[0])
    res.json(rows2[0])
  } catch (err) {
    await conn.rollback();
     res.status(400).json('ไม่มีหมายเลขห้องนี้ กรุณากรอกใหม่อีกครั้ง'.toString())
  } finally {
    conn.release();
  }
});

router.put("/updateBill", isLoggedIn, async function (req, res, next) {
  const expenses = req.body.expenses;
  const total = req.body.total;
  const discount = req.body.discount;
  const note = req.body.note;
  const tenant_id = req.body.tenant_id;

  // Begin transaction
  const conn = await pool.getConnection();
  await conn.beginTransaction();

  try {
    const [rows1, fields1] = await conn.query(
      'UPDATE invoice SET expenses=?, discount=?, total=?, note=? WHERE tenant_id=?', [expenses,  discount, total, note, tenant_id]
  )

    await conn.commit()
    console.log('update')
    //console.log(rows1[0])
    res.json({total : req.body.total})
  } catch (err) {
    await conn.rollback();
     res.status(400).json('อัปเดตไม่สำเร็จ'.toString())
  } finally {
    conn.release();
  }
});
exports.router = router;
