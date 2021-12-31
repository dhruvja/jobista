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

router.route("/bookworker").get(async (req, res) => {
    res.locals.user = 1;

    // var details = req.body;
    details = {
        id: 4,
        worker_id: 2,
    };

    book_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "UPDATE contract_jobs SET worker_id = ? WHERE id = ?",
                [details.worker_id, details.id],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        pool.query(
                            "UPDATE contract_workers SET status = 1 WHERE user_id = ?",
                            [details.worker_id],
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
                        return resolve(rows);
                    }
                }
            );
        });
    };

    notify_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT device_id,worker_id FROM accounts INNER JOIN contract_jobs ON accounts.id = contract_jobs.user_id WHERE contract_jobs.id = ?",
                [details.id],
                (err, rows) => {
                    if(err){
                        console.log(err)
                        return reject(err)
                    }
                    else{
                        console.log(rows[0])
                        const payload = {
                                notification: {
                                    title: "Worker has been confirmed",
                                    body: "Please click to view the details"
                                },
                                data:{
                                    route: "client",
                                    worker: rows[0].worker_id
                                }
                            };
                        if(sendNotification(rows[0].device_id,payload))
                            return resolve(true)
                        else
                            return resolve(false)
                    }
                }
            );
        });
    };

    if (res.locals.user) {
        try {
            const book = await book_query();
            const notify = await notify_query();
            res.json({status: 'success', notification: notify});
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/showworkers/:id").post(async (req, res) => {
    res.locals.user = 1;

    var details = req.body;

    book_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT * FROM contract_workers WHERE designation = ? AND status = 0 ",
                [details.worker_id, details.id],
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
            const workers = await get_workers_query();
            res.json(workers);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

module.exports = router;
