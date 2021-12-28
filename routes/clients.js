const express = require('express');
const router = express.Router()
const pool = require('../db')
const metaphone = require('metaphone')

const logger = require('../middleware/logger')
const authorize = require('../middleware/authorize')

router.route('/search/:query').post(async (req,res) => {
    res.locals.user = 1;
    var params = req.params.query;
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
        edulevel = 0;
    if(exptime == "")
        exptime = 0;
    if(minsalary == "")
        minsalary = 10000000;
    if(pincode == "")
        pincode = 572101
    
    console.log(params)
    console.log(req.body)


    const roles_query = (id) => {
        return new Promise((resolve,reject) => {
            pool.query("SELECT designation FROM designation WHERE work_id = ?",[id],(err,rows) => {
                if(err){
                    console.log(err)
                    return reject(err)
                }
                return resolve(rows)
            })
        })
    }

    const search_query = (query) => {
        return new Promise((resolve,reject) => {
            var order_clause = "ORDER BY CASE WHEN edulevel >= ? THEN -50 ELSE 0 END + CASE WHEN exptime >= ? THEN -40 ELSE 0 END + CASE WHEN account_verification = 1 AND difference < 20 THEN -200 ELSE 0 END"
            var filter_clause = "AND edulevel >= ? AND exptime >= ? AND minsalary <= ? AND work_status = 1 "
            if(designation != ""){
                pool.query("SELECT *, ABS(pincode - ?) AS difference FROM work_details INNER JOIN designation ON work_details.id = designation.work_id WHERE indexing LIKE CONCAT('%', ? , '%') AND designation = ? " + filter_clause + order_clause + " + difference"  ,[pincode,query,designation,edulevel,exptime,minsalary,edulevel,exptime], async(err, rows) => {
                    if(err){
                        console.log(err)
                        return reject(err)
                    }
                    var data = rows
                    return resolve(data)
                })
            }
            else{
                
                pool.query("SELECT *, ABS(pincode - ?) AS difference FROM work_details WHERE indexing LIKE CONCAT('%', ? , '%') " + filter_clause + order_clause + " + difference",[pincode,query,edulevel,exptime,minsalary,edulevel,exptime], async(err, rows) => {
                    if(err){
                        console.log(err)
                        return reject(err)
                    }
                    var data = rows
                    for(single in data){
                        try {
                            var roles = await roles_query(data[single].id)
                            data[single].roles = roles;
                        } catch (error) {
                            console.log(error)
                            res.json(error)
                        }
                        
                    }
                    return resolve(data)
                    
                })
            }
            
        })
    }


    
    if(res.locals.user){
        try {
            var present;
            if(designation == "")
                present = false;
            else 
                present = true;
            var data = await search_query(meta);
            if(data.length == 0){
                var single;
                data = []
                for(param in params){
                    single = await search_query(params[param])
                    if(single.length > 0)
                        data.push(single)
                }
                res.json({success: true, rows: data[0], role: present})
            }
            else{
                res.json({success:true,rows: data, role: present})
            }
        } catch (error) {
            console.log(error)
            res.json({success: false, error: error})
        }
    }
    else{
        res.json(res.locals.error)
    }
        
})

router.route('/indexing').get((req,res) => {
    try {
        var sql = "SELECT * FROM ads";
        var index = "";
        pool.query(sql,(err,rows) => {
            if(err){
                console.log(err)
                res.json(err)
            }
            else{
                for(row in rows){
                    index = "";
                    index += metaphone(rows[row].job_title) + " " 
                    index += metaphone(rows[row].designation) + " "
                    index += metaphone(rows[row].description) + " "
                    index += metaphone(rows[row].username) 
                    sql = "UPDATE ads SET indexing = ? WHERE id = ?";
                    pool.query(sql,[index,rows[row].id],(err,cols) => {
                        if(err){
                            console.log(err)
                        }
                        else
                            console.log(cols)
                    })
                }
                res.json({index: index})
            }
        })
    } catch (error) {
        console.log(error)
        res.json(error)
    }
})

router.route('/postad').post( async (req,res) => {
    res.locals.user = 16;
    var details = req.body;
    console.log(req.body)
    var job_title = "Need Urgent " + details.designation;
    var job_type = "permanent";

    const personal_query = () => {
        return new Promise((resolve,reject) => {
            pool.query("SELECT username FROM accounts WHERE id = ? ", [res.locals.user], (err,rows) => {
                if(err){
                    console.log(err)
                    return reject(err)
                }
                else{
                    return resolve(rows[0].username)
                }
            })
        })
    }

    // const address_query = () => {
    //     return new Promise((resolve, reject) => {
    //         var code = Math.floor(Math.random*100000 + 1)
    //         pool.query(
    //             "INSERT INTO ads_address(user_id,address_code,housename,streetname,area,city,pincode) VALUES(?,?,?,?,?,?,?)",
    //             [res.locals.user,code,details.address.housename,details.address.streetname,details.address.area,details.address.city,details.address.pincode],
    //             (err,rows) => {
    //                 if(err){
    //                     console.log(err)
    //                     return reject(err)
    //                 }
    //                 else{
    //                     return resolve(rows)
    //                 }
    //             }
    //         )
    //     })
    // }

    const postad_query = () => {
        return new Promise((resolve,reject) => {
            pool.query(
                "INSERT INTO ads(user_id,job_title,designation,jobtype,exptime,edulevel,address_code,description,username,maxsalary,indexing,created_date) VALUES(?,?,?,?,?,?,?,?,?,?,?,?) ",
                [res.locals.user,job_title,details.designation,job_type,details.exptime,details.edulevel,details.pincode,details.description,username,details.maxsalary,index,now],
                (err,rows) => {
                    if(err){
                        console.log(err)
                        return reject(err)
                    }
                    else{
                        return resolve(rows)
                    }
                }
            )
        })
    }

    if(res.locals.user){
        try {
            var username = await personal_query();
            // if(!details.address_code){
            //     details.address_code = await address_query();
            // }
            var now = new Date();
            var index = ""
            index += metaphone(job_title) + " " 
            index += metaphone(details.designation) + " "
            index += metaphone(details.description) + " "
            index += metaphone(username)


            var data = await postad_query();

            res.json(data)
        } catch (error) {
            console.log(error);
        }
    }
    else{
        console.log("Please enter your credentials")
    }
})

router.route('/getads').get(async(req,res) => {
    res.locals.user = 16;

    const ads = () => {
        return new Promise((resolve,reject) => {
            pool.query("SELECT * FROM ads WHERE user_id = ?",[res.locals.user],(err,rows) => {
                if(err){
                    console.log(err)
                    return reject(err)
                }
                else{
                    return resolve(rows)
                }
            })
        })
    }
    if(res.locals.user){
        try {
            const ad = await ads()
            res.json(ad)
        } catch (error) {
            console.log(error)
            res.json(error)
        }
    }
    else{
        console.log(res.locals.error)
        res.json(res.locals.error)
    }
})

router.route('/getaddress').get(async(req,res) => {
    res.locals.user = 16;

    const address_query = () => {
        return new Promise((resolve, reject) => {
            pool.query("SELECT * FROM ads_address WHERE user_id = ?", [res.locals.user],(err,rows) => {
                if(err){
                    console.log(err)
                    return reject(err)
                }
                else{
                    return resolve(rows)
                }
            })
        })
    }

    if(res.locals.user){
        try {
            const address = await address_query()
            res.json(address)
        } catch (error) {
            console.log(error)
            res.json(error)
        }
    }
    else{
        console.log(res.locals.error)
        res.json(res.locals.error)
    }
})

router.route('/bookedworkers').get(async(req,res) => {
    res.locals.user = 16;

    const get_pinged_query = () => {
        return new Promise((resolve,reject) => {
            pool.query("SELECT * FROM pinged_workers INNER JOIN work_details ON pinged_workers.worker_id = work_details.user_id INNER JOIN designation ON work_details.user_id = designation.work_id WHERE client_id = ? ORDER BY pinged_workers.id DESC;",[res.locals.user], (err,rows) => {
                if(err){
                    console.log(err)
                    return reject(err)
                }
                else{
                    console.log(rows)
                    return resolve(rows)
                }
            })
        })
    }

    if(res.locals.user){
        try {
            const ping = await get_pinged_query()
            res.json(ping)
        } catch (error) {
            console.log(error)
            res.json(error)
        }
    }
    else{
        console.log(res.locals.error)
        res.json(res.locals.error)
    }
})

router.route('/bookjob').post(async(req,res) => {
    res.locals.user = 16;

    var details = req.body;
    console.log(details);

    const ping_query = () => {
        return new Promise((resolve, reject) => {
            pool.query("INSERT INTO pinged_workers(client_id,worker_id,ad_id) VALUES(?,?,?);",[res.locals.user,details.worker_id,details.ad_id],(err,rows)=>{
                if(err){
                    console.log(err)
                    return reject(err)
                }
                else{
                    console.log(rows)
                    return resolve(rows)
                }
            })
        })
    }
    if(res.locals.user){
        try {
            const ping = await ping_query()
            res.json(ping)
        } catch (error) {
            console.log(error)
            res.json(error)
        }
    }
    else{
        console.log(res.locals.error)
        res.json(res.locals.error)
    }
})

module.exports = router;