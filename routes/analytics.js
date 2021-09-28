const express = require('express');
const router = express.Router()
const pool = require('../db')

const logger = require('../middleware/logger')
const authorize = require('../middleware/authorize')

router.route('/all').get(async(req,res) => {

    const worker = () => {
        return new Promise((resolve, reject) => {
            pool.query('SELECT COUNT(*) FROM work_details',(err,rows) => {
                if(err){
                    console.log(err)
                    return reject(err)
                }
                else{
                    return resolve(rows[0]['COUNT(*)'])
                }
            })
        })
    }
    const client = () => {
        return new Promise((resolve, reject) => {
            pool.query('SELECT COUNT(*) FROM accounts WHERE type = "client" ',(err,rows) => {
                if(err){
                    console.log(err)
                    return reject(err)
                }
                else{
                    return resolve(rows[0]['COUNT(*)'])
                }
            })
        })
    }
    const verified_workers = () => {
        return new Promise((resolve, reject) => {
            pool.query('SELECT COUNT(*) FROM work_details WHERE account_verification = 1 ',(err,rows) => {
                if(err){
                    console.log(err)
                    return reject(err)
                }
                else{
                    return resolve(rows[0]['COUNT(*)'])
                }
            })
        })
    }

    try {
        const data = {};
        data.worker = await worker();
        data.client = await client();
        data.verified_worker = await verified_workers();
        res.json(data)
    } catch (error) {
        console.log(error)
        res.json(error)
    } 
})

router.route('/acc_verification').get(async(req,res) => {

    const verification_query = () => {
        return new Promise((resolve,reject) => {
            pool.query("SELECT documents.id AS document_id, work_id,document,document_name,username,account_verification FROM work_details LEFT JOIN documents ON work_details.id = documents.work_id", async(err,rows) => {
                if(err){
                    console.log(err)
                    return reject(err)
                }
                // for(row in rows){
                //     rows[row].documents = await document_query(rows[row].id)
                // }
                return resolve(rows)
            })
        })
    }

    try {
        var data = await verification_query();
        res.json(data)
    } catch (error) {
        console.log(error)
        res.json(error)
    }
})


module.exports = router;