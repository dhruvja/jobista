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
//   });

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

router.route("/registerWork").post(async (req, res) => {});

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
    var maxsalary = req.body.maxsalary;
    var pincode = req.body.pincode;

    // console.log(edulevel);

    if (edulevel == "" || edulevel == 0) edulevel = 4;
    if (exptime == "" || exptime == 0) exptime = 50;
    if (maxsalary == "") maxsalary = 0;
    if (pincode == "") pincode = 572101;

    console.log(designation, edulevel, exptime, maxsalary, pincode);

    const search_query = (index) => {
        return new Promise((resolve, reject) => {
            var order_clause =
                "ORDER BY CASE WHEN edulevel <= ? THEN -50 ELSE 0 END + CASE WHEN exptime <= ? THEN -40 ELSE 0 END ";
            var filter_clause =
                "AND indexing LIKE CONCAT('%', ? , '%') AND designation LIKE CONCAT('%', ? , '%') AND edulevel <= ? AND exptime <= ? AND maxsalary > ? ";
            var not_in_clause =
                "WHERE ads.id NOT IN (SELECT ad_id FROM pinged_workers WHERE worker_id = ?) AND ads.id NOT IN (SELECT ad_id FROM applied_ads WHERE worker_id = ?) ";
            pool.query(
                "SELECT *,ABS(address_code - ?) AS difference FROM ads " +
                    not_in_clause +
                    filter_clause +
                    order_clause +
                    " + difference",
                [
                    pincode,
                    res.locals.user,
                    res.locals.user,
                    index,
                    designation,
                    edulevel,
                    exptime,
                    maxsalary,
                    edulevel,
                    exptime,
                ],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    }
                    console.log(rows)
                    return resolve(rows);
                }
            );
        });
    };

    try {
        var data = await search_query(meta);
        if (data.length == 0) {
            data = [];
            var single;
            for (param in params) {
                single = await search_query(params[param]);
                if (single.length > 0) {
                    data.push(single);
                }
            }
            res.json({ success: true, rows: data[0] });
        } else res.json({ success: true, rows: data });
    } catch (error) {
        console.log(error);
        res.json(error);
    }
});

router.route("/getrecentads").get(async (req, res) => {
    res.locals.user = 1;

    const getAds = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT * FROM ads WHERE designation IN (SELECT designation FROM designation WHERE work_id = ? ) ORDER BY created_date DESC LIMIT 5",
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

    const activeOffers = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT COUNT(*) FROM pinged_workers WHERE worker_id = ?",
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
            var ads = await getAds();
            var count = await activeOffers();
            res.json({ ads: ads, activeOffers: count });
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log("Please enter ur credentials");
        res.json("Authentication is not provided");
    }
});

router.route("/indexing").get((req, res) => {
    try {
        var sql = "SELECT * FROM work_details";
        var works = "";
        var roles = "";
        pool.query(sql, (err, rows) => {
            if (err) {
                console.log(err);
            } else {
                works = rows;
                sql = "SELECT * FROM designation";
                pool.query(sql, (err, rows) => {
                    if (err) {
                        console.log(err);
                    } else {
                        roles = rows;
                        var index = "";
                        for (work in works) {
                            index = "";
                            for (role in roles) {
                                if (roles[role].work_id == works[work].id) {
                                    index +=
                                        metaphone(roles[role].designation) +
                                        " ";
                                }
                            }
                            index += metaphone(works[work].username) + " ";
                            index += metaphone(works[work].experience);
                            sql =
                                "UPDATE work_details SET indexing = ? WHERE id = ? ";
                            pool.query(
                                sql,
                                [index, works[work].id],
                                (err, rows) => {
                                    if (err) {
                                        console.log(err);
                                    } else {
                                        console.log(rows);
                                    }
                                }
                            );
                        }
                        res.json({ index: index });
                    }
                });
            }
        });
    } catch (error) {
        console.log(error);
        res.json(error);
    }
});

router.route("/apply").post(async (req, res) => {
    res.locals.user = 1;

    var details = req.body;
    var now = new Date();


    apply_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "INSERT INTO applied_ads(client_id,worker_id,ad_id,applied_date) VALUES(?,?,?,?)",
                [details.client_id, res.locals.user, details.ad_id, now],
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
            const apply = await apply_query();
            res.json({ success: true, apply: apply });
        } catch (error) {
            console.log(error);
            res.json({ success: false, apply: error });
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/getappliedads").get(async (req, res) => {
    res.locals.user = 1;

    apply_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT * FROM applied_ads INNER JOIN ads ON applied_ads.ad_id = ads.id WHERE worker_id = ?",
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
            const apply = await apply_query();
            res.json({ success: true, apply: apply });
        } catch (error) {
            console.log(error);
            res.json({ success: false, apply: error });
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/getoffers").get(async (req, res) => {
    res.locals.user = 1;

    offer_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT *, pinged_workers.id AS ping_id FROM pinged_workers INNER JOIN ads ON pinged_workers.ad_id = ads.id WHERE worker_id = ?",
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
            const offer = await offer_query();
            res.json({ success: true, offer: offer });
        } catch (error) {
            console.log(error);
            res.json({ success: false, offer: error });
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route('/updateoffer').post(async(req,res) => {
    res.locals.user = 16;
    var now = new Date();
    var details = req.body;

    console.log(details)
    const update_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "UPDATE pinged_workers SET status = ?, status_date = ? WHERE id = ?",
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
