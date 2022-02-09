const express = require("express");
const router = express.Router();
const pool = require("../db");
const metaphone = require("metaphone");
var admin = require("firebase-admin");
var serviceAccount = require("../serviceAccount.json");

const logger = require("../middleware/logger");
const authorize = require("../middleware/authorize");

// admin.initializeApp({
//     credential: admin.credential.cert(serviceAccount),
// });

const sendNotification = (device, payload) => {
    // const device = "eXNbzI-tSfavGCgv_YJiDZ:APA91bGipEddhF3a47mR_E8RdNuKHzqpU_SQFMMuXyf4bUIs3fSbMIQKTINnCRP3qoaZ5GG4KMDh2pLC1_CrsYQZQuqk45VQ2qaMIwKK_TkCznJNe_9-SJJJ5_HglEtQ8enStn-L30cF"
    // const payload = {
    //     notification: {
    //         title: "This is a notification from node js",
    //         body: "Yo i have sent it"
    //     },
    //     data:{
    //         route: "client"
    //     }
    // };
    const option = { priority: "high", timeToLive: 60 * 60 * 24 };
    try {
        admin.messaging().sendToDevice(device, payload, option);
        return true;
    } catch (error) {
        console.log(error);
        return false;
    }
};

router.route("/search/:query").post(async (req, res) => {
    res.locals.user = 1;
    var params = req.params.query;
    params = params.split(" ");
    var meta = "";
    for (param in params) {
        params[param] = metaphone(params[param]);
        meta += params[param];
    }

    var designation = req.body.designation;
    var edulevel = req.body.edulevel;
    var exptime = req.body.exptime;
    var minsalary = req.body.minsalary;
    var pincode = req.body.pincode;

    if (edulevel == "") edulevel = 0;
    if (exptime == "") exptime = 0;
    if (minsalary == "") minsalary = 10000000;
    if (pincode == "") pincode = 572101;

    console.log(params);
    console.log(req.body);

    const roles_query = (id) => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT designation FROM designation WHERE work_id = ?",
                [id],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    }
                    return resolve(rows);
                }
            );
        });
    };

    const search_query = (query) => {
        return new Promise((resolve, reject) => {
            var order_clause =
                "ORDER BY CASE WHEN edulevel >= ? THEN -50 ELSE 0 END + CASE WHEN exptime >= ? THEN -40 ELSE 0 END + CASE WHEN account_verification = 1 AND difference < 20 THEN -200 ELSE 0 END";
            var filter_clause =
                "AND edulevel >= ? AND exptime >= ? AND minsalary <= ? AND work_status = 1 ";
            var not_in_clause = "work_details.user_id NOT IN (SELECT worker_id FROM pinged_workers WHERE client_id = ?) AND user_id NOT IN (SELECT worker_id FROM applied_ads WHERE client_id = ?) AND" ;
            if (designation != "") {
                pool.query(
                    "SELECT *, ABS(pincode - ?) AS difference FROM work_details INNER JOIN designation ON work_details.id = designation.work_id WHERE " + not_in_clause + "  indexing LIKE CONCAT('%', ? , '%') AND designation = ? " +
                        filter_clause +
                        order_clause +
                        " + difference",
                    [
                        pincode,
                        res.locals.user,
                        res.locals.user,
                        query,
                        designation,
                        edulevel,
                        exptime,
                        minsalary,
                        edulevel,
                        exptime,
                    ],
                    async (err, rows) => {
                        if (err) {
                            console.log(err);
                            return reject(err);
                        }
                        var data = rows;
                        return resolve(data);
                    }
                );
            } else {
                pool.query(
                    "SELECT *, ABS(pincode - ?) AS difference FROM work_details WHERE indexing LIKE CONCAT('%', ? , '%') " +
                        filter_clause +
                        order_clause +
                        " + difference",
                    [
                        pincode,
                        query,
                        edulevel,
                        exptime,
                        minsalary,
                        edulevel,
                        exptime,
                    ],
                    async (err, rows) => {
                        if (err) {
                            console.log(err);
                            return reject(err);
                        }
                        var data = rows;
                        for (single in data) {
                            try {
                                var roles = await roles_query(data[single].id);
                                data[single].roles = roles;
                            } catch (error) {
                                console.log(error);
                                res.json(error);
                            }
                        }
                        return resolve(data);
                    }
                );
            }
        });
    };

    if (res.locals.user) {
        try {
            var present;
            if (designation == "") present = false;
            else present = true;
            var data = await search_query(meta);
            if (data.length == 0) {
                var single;
                data = [];
                for (param in params) {
                    single = await search_query(params[param]);
                    if (single.length > 0) data.push(single);
                }
                res.json({ success: true, rows: data[0], role: present });
            } else {
                res.json({ success: true, rows: data, role: present });
            }
        } catch (error) {
            console.log(error);
            res.json({ success: false, error: error });
        }
    } else {
        res.json(res.locals.error);
    }
});

router.route("/indexing").get((req, res) => {
    try {
        var sql = "SELECT * FROM ads";
        var index = "";
        pool.query(sql, (err, rows) => {
            if (err) {
                console.log(err);
                res.json(err);
            } else {
                for (row in rows) {
                    index = "";
                    index += metaphone(rows[row].job_title) + " ";
                    index += metaphone(rows[row].designation) + " ";
                    index += metaphone(rows[row].description) + " ";
                    index += metaphone(rows[row].username);
                    sql = "UPDATE ads SET indexing = ? WHERE id = ?";
                    pool.query(sql, [index, rows[row].id], (err, cols) => {
                        if (err) {
                            console.log(err);
                        } else console.log(cols);
                    });
                }
                res.json({ index: index });
            }
        });
    } catch (error) {
        console.log(error);
        res.json(error);
    }
});

router.route("/postad").post(async (req, res) => {
    res.locals.user = 16;
    var details = req.body;
    console.log(req.body);
    var job_title = "Need Urgent " + details.designation;
    var job_type = "permanent";

    const personal_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT username FROM accounts WHERE id = ? ",
                [res.locals.user],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        return resolve(rows[0].username);
                    }
                }
            );
        });
    };

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
        return new Promise((resolve, reject) => {
            pool.query(
                "INSERT INTO ads(user_id,job_title,designation,jobtype,exptime,edulevel,address_code,description,username,maxsalary,indexing,created_date) VALUES(?,?,?,?,?,?,?,?,?,?,?,?) ",
                [
                    res.locals.user,
                    job_title,
                    details.designation,
                    job_type,
                    details.exptime,
                    details.edulevel,
                    details.pincode,
                    details.description,
                    username,
                    details.maxsalary,
                    index,
                    now,
                ],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        return resolve(rows);
                    }
                }
            );
        });
    };

    if (res.locals.user) {
        try {
            var username = await personal_query();
            // if(!details.address_code){
            //     details.address_code = await address_query();
            // }
            var now = new Date();
            var index = "";
            index += metaphone(job_title) + " ";
            index += metaphone(details.designation) + " ";
            index += metaphone(details.description) + " ";
            index += metaphone(username);

            var data = await postad_query();

            res.json(data);
        } catch (error) {
            console.log(error);
        }
    } else {
        console.log("Please enter your credentials");
    }
});

router.route("/getads").get(async (req, res) => {
    res.locals.user = 16;

    const ads = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT * FROM ads WHERE user_id = ?",
                [res.locals.user],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        return resolve(rows);
                    }
                }
            );
        });
    };
    if (res.locals.user) {
        try {
            const ad = await ads();
            res.json(ad);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/getaddress").get(async (req, res) => {
    res.locals.user = 16;

    const address_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT * FROM ads_address WHERE user_id = ?",
                [res.locals.user],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        return resolve(rows);
                    }
                }
            );
        });
    };

    if (res.locals.user) {
        try {
            const address = await address_query();
            res.json(address);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/appliedworkers").get(async (req, res) => {
    res.locals.user = 16;

    const get_applied_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT *, applied_ads.id AS apply_id FROM applied_ads INNER JOIN work_details ON applied_ads.worker_id = work_details.user_id INNER JOIN ads ON applied_ads.ad_id = ads.id WHERE client_id = ? ORDER BY applied_ads.id DESC;",
                [res.locals.user],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        console.log(rows);
                        return resolve(rows);
                    }
                }
            );
        });
    };

    if (res.locals.user) {
        try {
            const applied = await get_applied_query();
            res.json(applied);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/bookedworkers").get(async (req, res) => {
    res.locals.user = 16;

    const get_pinged_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT * FROM pinged_workers INNER JOIN work_details ON pinged_workers.worker_id = work_details.user_id INNER JOIN designation ON work_details.user_id = designation.work_id WHERE client_id = ? ORDER BY pinged_workers.id DESC;",
                [res.locals.user],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        console.log(rows);
                        return resolve(rows);
                    }
                }
            );
        });
    };

    if (res.locals.user) {
        try {
            const ping = await get_pinged_query();
            res.json(ping);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/bookjob").post(async (req, res) => {
    res.locals.user = 16;

    var details = req.body;
    console.log(details);

    const ping_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "INSERT INTO pinged_workers(client_id,worker_id,ad_id) VALUES(?,?,?);",
                [res.locals.user, details.worker_id, details.ad_id],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        console.log(rows);
                        return resolve(rows);
                    }
                }
            );
        });
    };
    if (res.locals.user) {
        try {
            const ping = await ping_query();
            res.json(ping);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/bookcontractjob").post(async(req, res) => {
    res.locals.user = 16;

    var details = req.body;
    console.log(details);

    const postad_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "INSERT INTO contract_jobs(designation,description,latitude,longitude,status,user_id,created_date) VALUES(?,?,?,?,?,?,?);",
                [details.designation,details.description,details.latitude,details.longitude,0,res.locals.user,now],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        console.log(rows);
                        return resolve(rows);
                    }
                }
            );
        });
    };
    if (res.locals.user) {
        try {
            var now = new Date();
            const ping = await postad_query();
            res.json(ping);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/getamount/:id").get(async (req, res) => {
    res.locals.user = 16;

    var id = req.params.id;
    const amount_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT * FROM contract_jobs WHERE id = ? ",
                [id],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        console.log(rows);
                        return resolve(rows);
                    }
                }
            );
        });
    };

    if (res.locals.user) {
        try {
            const amount = await amount_query();
            res.json(amount);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/activities").get(async (req, res) => {
    res.locals.user = 16;

    const activity_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT *, contract_jobs.status AS job_status ,contract_jobs.id AS job_id, contract_workers.user_id AS worker_id FROM contract_jobs INNER JOIN contract_workers ON contract_jobs.worker_id = contract_workers.user_id  WHERE contract_jobs.user_id = ? ORDER BY contract_jobs.id DESC   ",
                [res.locals.user],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        console.log(rows);
                        return resolve(rows);
                    }
                }
            );
        });
    };

    if (res.locals.user) {
        try {
            const activity = await activity_query();
            res.json(activity);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/getpresentworks").get(async (req, res) => {
    res.locals.user = 16;

    const current_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT *, contract_jobs.id AS job_id  FROM contract_jobs INNER JOIN contract_workers ON contract_workers.user_id = contract_jobs.worker_id WHERE contract_jobs.user_id = ? ORDER BY contract_jobs.created_date DESC ",
                [res.locals.user],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        return resolve(rows);
                    }
                }
            );
        });
    };
    if (res.locals.user) {
        try {
            const current = await current_query();
            res.json(current);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route('/updatestatus').post(async(req,res) => {
    res.locals.user = 16;
    var now = new Date();
    var details = req.body;

    console.log(details)
    const update_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "UPDATE applied_ads SET status = ?, status_date = ? WHERE id = ?",
                [details.status , now,  details.id],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        return resolve(rows);
                    }
                }
            );
        });
    };
    if (res.locals.user) {
        try {
            const update = await update_query();
            res.json({success: true, rows: update});
        } catch (error) {
            console.log(error);
            res.json({success: false, error: error});
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
})


module.exports = router;
