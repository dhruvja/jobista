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

const generateBill = async (details) => {
    try {
        const number =  Math.floor((Math.random() * 10000000)+1);
        let today = new Date().toISOString().slice(0, 10)
        data = changeData("details.username", today, "jobista", number);
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

router.route("/generatebill").get(async (req, res) => {
    res.locals.user = 2;
    details = req.body;
    console.log(details);

    const bill_query = () => {
        return new Promise(async (resolve, reject) => {
            if (await generateBill(res.locals.user)) {
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
                                "SELECT device_id FROM accounts WHERE user_id = ?",
                                [details.user_id],
                                (err, rows) => {
                                    if (err) {
                                        console.log(err);
                                        return reject(
                                            "Failed to send notification but the bill has been generated"
                                        );
                                    } else {
                                        const payload = {
                                            notification: {
                                                title: "Bill has been generated",
                                                body: `The amount to be paid is ${details.amount}`,
                                            },
                                            data: {
                                                route: "billpage",
                                            },
                                        };
                                        if(sendNotification(rows[0].device_id,payload))
                                            return resolve("Bill has been generated and notification has been sent");
                                        else
                                            return resolve("Bill has been generated and notification could not be sent")

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
            const now = new Date();
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

module.exports = router;
