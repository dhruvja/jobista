const express = require("express");
const router = express.Router();
const pool = require("../db");
const metaphone = require("metaphone");
var admin = require("firebase-admin");
var serviceAccount = require("../serviceAccount.json");
var changeData = require("../bill/data");
var easyinvoice = require("easyinvoice");
const fs = require("fs");

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

const generateBill = async (username, designation, amount) => {
    try {
        const number = Math.floor(Math.random() * 10000000 + 1);
        let today = new Date().toISOString().slice(0, 10);
        var designation = designation + " Work";
        data = changeData(
            username,
            today,
            "Smart Tumkur Service",
            number,
            designation,
            amount
        );
        console.log(data);
        result = await easyinvoice.createInvoice(data);
        await fs.writeFileSync(
            __dirname + `/../generated_bills/${details.id}.pdf`,
            result.pdf,
            "base64"
        );
        return true;
    } catch (error) {
        console.log(error);
        return false;
    }
};

router.route("/generatebill").post(async (req, res) => {
    res.locals.user = 2;
    details = req.body;
    console.log(details);

    const bill_query = () => {
        return new Promise(async (resolve, reject) => {
            if (
                await generateBill(
                    details.username,
                    details.designation,
                    details.amount
                )
            ) {
                const now = new Date();
                pool.query(
                    "UPDATE contract_jobs SET amount = ?, completed_date = ?, status = 1 WHERE id = ?",
                    [details.amount, now, details.id],
                    (err, rows) => {
                        if (err) {
                            console.log(err);
                            return reject(err);
                        } else {
                            console.log(rows);
                            pool.query(
                                "UPDATE contract_workers SET status = 0 WHERE user_id = ? ",
                                [details.worker_id],
                                (err, rows) => {
                                    if (err) {
                                        console.log(err);
                                        return reject(err);
                                    } else {
                                        console.log(details.id)
                                        const payload = {
                                            notification: {
                                                title: "Bill has been generated",
                                                body: `The amount to be paid is ${details.amount}`,
                                                android_channel_id: "jobista",
                                            },
                                            data: {
                                                route: "bill_generation",
                                                worker: String(details.id),
                                            },
                                        };
                                        if (
                                            sendNotification(
                                                details.device_id,
                                                payload
                                            )
                                        )
                                            return resolve(
                                                "Bill has been generated and notification has been sent"
                                            );
                                        else
                                            return resolve(
                                                "Bill has been generated and notification could not be sent"
                                            );
                                    }
                                }
                            );
                        }
                    }
                );
            } else {
                return reject("Some error occured");
            }
        });
    };

    if (res.locals.user) {
        try {
            const bill = bill_query();
            res.json(bill);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/getinfo/:id").get(async (req, res) => {
    res.locals.user = 1;

    var id = req.params.id;

    info_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT * FROM contract_workers WHERE user_id = ? ",
                [id],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        console.log(rows);
                        return resolve(rows[0]);
                    }
                }
            );
        });
    };

    if (res.locals.user) {
        try {
            const info = await info_query();
            res.json(info);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/getstatus").get(async (req, res) => {
    res.locals.user = 59;
    status_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT *,contract_jobs.id as job_id, accounts.id as user_id FROM contract_jobs INNER JOIN contract_workers ON contract_workers.user_id = contract_jobs.worker_id INNER JOIN accounts ON contract_jobs.user_id = accounts.id WHERE contract_jobs.worker_id = ? AND contract_jobs.status = 0 ",
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
            const status = await status_query();
            if (status.length == 0) res.json({ available: false });
            else res.json({ available: true, status: status });
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
