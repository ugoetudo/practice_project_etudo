const db = require('../db.js')
const mysql = require('mysql')
var express = require('express');
var cors = require("cors");

router = express.Router()
var router = express.Router();
const connection = mysql.createConnection(db.conn_info)
connection.connect()

var corsOptions = {
  origin: "*",
}

const time_left = (result) => {
    const tn = new Date()
    const day_names = ['m', 't', 'w', 'tr', 'f']
    const dtw = tn.getDay()
    const yr = tn.getFullYear()
    const dt = tn.getDate()
    const mnt = tn.getMonth()
    const dow = day_names[dtw - 1]

    var final_result = []
    result.forEach((r, ix) => {
        var is_today = false
        switch (dow) {
            case 'm':
                if (r.m == 1) {
                    is_today = true
                    break
                }
            case 't':
                if (r.t == 1) {
                    is_today = true
                    break
                }
            case 'w':
                if (r.w == 1) {
                    is_today = true
                    break
                }
            case 'tr':
                if (r.tr == 1) {
                    is_today = true
                    break
                }
            case 'f':
                if (r.f == 1) {
                    is_today = true
                    break
                }
        }
        if (is_today) {
            var time_parts = r.time_of_day.split(":")
            var mins_left = (new Date(yr, mnt, dt, time_parts[0], time_parts[1], time_parts[2]) - new Date())/60000
            final_result[ix] = [r, mins_left]
        }
    })
    return final_result.filter( Boolean ) // list of [result, mins_left]
    
        //case expression to match the day of the week
        //check times as well
}


router.get("/", cors(corsOptions), (req, res, next) => {
    const vnum = req.query.vnum
    if (vnum)
    {
        connection.query('select * from enrollment e, course_section cs, course c ' +
                     'where e.section_no = cs.section_no and e.course_no and c.course_no = cs.course_no '+
                     'and vnum = ?', [vnum], (e,r,f) => {
                        if (!e) {
                            frs = time_left(r)
                            res.json(frs)
                        }
                        else {
                            next(e)
                        }
                     })
    }
    else
    {
        res.render("error", {message: "no request sent. please ask me to do something", 
                             error: {status:500, message:"better luck next time"}})
    }
})

module.exports = router