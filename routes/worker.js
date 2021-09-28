const express = require('express');
const router = express.Router();

const pool = require('../db')
const metaphone = require('metaphone')

const logger = require('../middleware/logger')
const authorize = require('../middleware/authorize')

router.route('/search/:query').post(async(req,res) => {
    res.locals.user = 1;
    var params = req.params.query
    params = params.split(" ")
    var meta = "";
    for(param in params){
        params[param] = metaphone(params[param])
        meta += params[param]
    }

    var designation = req.body.designation
    var edulevel = req.body.edulevel
    var exptime = req.body.exptime
    var minsalary = req.body.minsalary
    var pincode = req.body.pincode


    if(edulevel == "")
        edulevel = 4;
    if(exptime == "")
        exptime = 50;
    if(minsalary == "")
        minsalary = 0;
    if(pincode == "")
        pincode = 572101

    const search_query = (index) => {
        return new Promise((resolve,reject) => {
            var order_clause = "ORDER BY CASE WHEN edulevel <= ? THEN -50 ELSE 0 END + CASE WHEN exptime <= ? THEN -40 ELSE 0 END "
            var filter_clause = "WHERE indexing LIKE CONCAT('%', ? , '%') AND designation LIKE CONCAT('%', ? , '%') AND edulevel <= ? AND exptime <= ? AND minsalary > ? "
            pool.query("SELECT *,ABS(pincode - ?) AS difference FROM ads INNER JOIN ads_address ON ads.address_code = ads_address.address_code " + filter_clause + order_clause + " + difference",[pincode,index,designation,edulevel,exptime,minsalary,edulevel,exptime], (err,rows) => {
                if(err){
                    console.log(err)
                    return reject(err)
                }
                return resolve(rows)
            })
        })
    }
    
    try {
        var data = await search_query(meta);
        if(data.length == 0){
            data = [];
            var single;
            for(param in params){
                single = await search_query(params[param]);
                if(single.length > 0){
                    data.push(single)
                }
            }
            res.json(data[0])
        }
        else
            res.json(data)
    } catch (error) {
        console.log(error)
        res.json(error)
    }
})

router.route('/indexing').get((req,res) => {
    try {
        var sql = "SELECT * FROM work_details"
        var works = "";
        var roles = "";
        pool.query(sql,(err,rows) => {
            if(err){
                console.log(err)
            }
            else{
                works = rows;
                sql = "SELECT * FROM designation"
                pool.query(sql,(err,rows) => {
                    if(err){
                        console.log(err)
                    }
                    else{
                        roles = rows;
                        var index = "";
                        for(work in works){
                            index = "";
                            for(role in roles){
                                if(roles[role].work_id == works[work].id){
                                    index += metaphone(roles[role].designation) + " "
                                }
                            }
                            index += metaphone(works[work].username) + " "
                            index += metaphone(works[work].experience)
                            sql = "UPDATE work_details SET indexing = ? WHERE id = ? "
                            pool.query(sql,[index,works[work].id], (err,rows) => {
                                if(err) {
                                    console.log(err)
                                }
                                else{
                                    console.log(rows)
                                }
                            })
                        }
                        res.json({index: index})
                    }
                })
            }
        })

    } catch (error) {
        console.log(error)
        res.json(error)
    }
})


module.exports = router;
