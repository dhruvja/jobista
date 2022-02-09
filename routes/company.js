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

router.route("/bookworker").post(async (req, res) => {
    res.locals.user = 1;

    var details = req.body;
    console.log(details);
    // details = {
    //     id: 4,
    //     worker_id: 2,
    // };

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
                "SELECT device_id FROM accounts INNER JOIN contract_jobs ON accounts.id = contract_jobs.user_id WHERE contract_jobs.id = ?",
                [details.id],
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        console.log(rows);
                        const payload = {
                            notification: {
                                title: "Worker has been confirmed",
                                body: "Please click to view the details",
                                android_channel_id: "jobista",
                            },
                            data: {
                                route: "worker_confirmation",
                                worker: String(details.worker_id),
                            },
                        };
                        if (sendNotification(rows[0].device_id, payload))
                            return resolve(true);
                        else return resolve(false);
                    }
                }
            );
        });
    };

    if (res.locals.user) {
        try {
            const book = await book_query();
            const notify = await notify_query();
            res.json({ status: "success", notification: notify });
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/showworkers/:role").get(async (req, res) => {
    res.locals.user = 1;

    var details = req.params.role;
    console.log(details);

    book_query = () => {
        return new Promise((resolve, reject) => {
            pool.query(
                "SELECT * FROM contract_workers WHERE designation = ? AND status = 0 ",
                [details],
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
            const workers = await book_query();
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

router.route("/activejobs").get(async (req, res) => {
    res.locals.user = 1;

    const active_query = () => {
        return new Promise(async (resolve, reject) => {
            pool.query(
                "SELECT *, contract_jobs.created_date AS job_creation ,contract_jobs.id AS job_id, contract_jobs.user_id AS client_id, accounts.username AS client_name, contract_workers.username AS worker_name FROM contract_jobs INNER JOIN accounts ON contract_jobs.user_id = accounts.id INNER JOIN contract_workers ON contract_jobs.worker_id = contract_workers.user_id WHERE contract_jobs.status = 0 AND contract_jobs.worker_id IS NOT NULL ORDER BY contract_jobs.created_date DESC",
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
            const active_jobs = await active_query();
            res.json(active_jobs);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/completedjobs").get(async (req, res) => {
    res.locals.user = 1;

    const completed_query = () => {
        return new Promise(async (resolve, reject) => {
            pool.query(
                "SELECT *, contract_jobs.description AS job_description ,contract_jobs.id AS job_id, contract_jobs.user_id AS client_id, accounts.username AS client_name, contract_workers.username AS worker_name FROM contract_jobs INNER JOIN accounts ON contract_jobs.user_id = accounts.id INNER JOIN contract_workers ON contract_jobs.worker_id = contract_workers.user_id WHERE contract_jobs.status = 1 ORDER BY completed_date DESC",
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
            const completed_jobs = await completed_query();
            res.json(completed_jobs);
        } catch (error) {
            console.log(error);
            res.json(error);
        }
    } else {
        console.log(res.locals.error);
        res.json(res.locals.error);
    }
});

router.route("/dashboard").get(async (req, res) => {
    res.locals.user = 1;

    

    total_workers = () => {
        return new Promise(async (resolve, reject) => {
            pool.query(
                "SELECT COUNT(*) FROM accounts WHERE type = 'worker'",
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        console.log(rows);
                        return resolve(rows[0]['COUNT(*)']);
                    }
                }
            );
        });
    };


    const active_jobs = () => {
        return new Promise(async (resolve, reject) => {
            pool.query(
                "SELECT COUNT(*) FROM contract_jobs WHERE status = 0 AND worker_id IS NOT NULL",
                (err, rows) => {
                    if (err) {
                        console.log(err);
                        return reject(err);
                    } else {
                        console.log(rows);
                        return resolve(rows[0]['COUNT(*)']);
                    }
                }
            );
        });
    };

    if (res.locals.user) {
        try {
            const total_worker = await total_workers();
            const active_job = await active_jobs();
            res.json({workers: total_worker, active_jobs: active_job});
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
