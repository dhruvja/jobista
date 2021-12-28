var express = require('express');
var app = express();
var cors = require('cors')
const jwt = require('jsonwebtoken')
var pool = require('./db')
var fileupload = require('express-fileupload')
const authorize = require('./middleware/authorize')

const worker = require('./routes/worker')
const client = require('./routes/clients')
const analytics = require('./routes/analytics')

app.use(cors())
app.use(express.json())
app.use(fileupload())
app.use('/api/worker',worker)
app.use('/api/client',client)
app.use('/api/analytics',analytics)

app.use('/api/uploads',express.static('uploads'))


app.post('/api/login',(req,res) => {
    try {
        console.log(req.body)
        var details = req.body
        var sql = "SELECT * FROM accounts WHERE email = ? AND passwords = ?";
        pool.query(sql,[details.email,details.password], (err,rows) => {
            if(err){
                res.json({success: false, msg: err})
            }
            else{
                if(rows.length  == 1){
                    const token = jwt.sign({
                            user_id: rows[0].id,
                        },
                        "heya", {
                            expiresIn: "2h",
                        }
                    )
                    console.log("Login successfully for " + rows[0].type )
                    res.json({success: true, msg: "You have logged in successfully", token: token,type: rows[0].type, username: rows[0].username})
                }
                else{
                    console.log("Login failed")
                    res.json({success: false, msg: "Wrong Username or password"})
                }
            }
        })
    } catch (error) {
        console.log(error)
        res.json({
            success: false,
            error: error
        })
    }
})

app.post('/api/register', (req, res) => {
    try {
        console.log(req.body)
        var details = req.body
        var now = new Date();
        var sql = "INSERT INTO accounts (username, email,phone, passwords,type,created_date) VALUES(?,?,?,?,?,?)";
        pool.query(sql,[details.username,details.email,details.phone,details.password,details.type,now], (err,rows) => {
            if(err){
                res.json({success: false, msg: err})
            }
            else{
                try {
                    if(rows.insertId){
                        console.log("Registration Successful")
                        const token = jwt.sign({
                                user_id: rows.insertId,
                            },
                            "heya", {
                                expiresIn: "2h",
                            }
                        )
                        console.log(rows)
                        if(details.email == ""){
                            const image = req.files.photo;
                            image.mv('./uploads/' + image.name , function (err, result) {
                                if (err) {
                                    console.log(err)
                                    res.json({success: false, msg: "Worker details couldnt not be uploaded"})
                                } else {
                                    const location = 'uploads' + image.name;
                                    const sql = "INSERT INTO work_details(user_id,username,profile_pic) VALUES(?,?,?) ";
                                    pool.query(sql , [rows.insertId,details.username,location], (err,rows) => {
                                        if(err){
                                            console.log("Worker Registration failed");
                                            res.json({success: false, msg: "Worker details couldnt not be uploaded"})
        
                                        }
                                        console.log("File upload successful")
                                        res.json({success: true, msg: "You have registered successfully",data: rows.insertId, token: token})
                                    })
                                }
                            })

                            
                        }
                        else{
                            res.json({success: true, msg: "You have registered successfully",data: rows.insertId})
                        }
                    }
                    else{
                        console.log("Registration Failed")
                        res.json({success: false, msg: "unexpected error occured"})
                    }
                } catch (error) {
                    console.log("Registration Failed", error)
                    res.json({success: false, msg: error})
                }
            }
        })
    } catch (error) {
        console.log(error)
        res.json({
            success: false,
            error: error
        })
    }
})

app.get('/api/allusers', (req, res) => {
    try {
        var sql = "SELECT * FROM accounts";
        pool.query(sql, (err, rows) => {
            if(err){
                console.log(err)
                res.json({success: false,msg: err})
            }
            else{
                res.json({success: true,msg: rows})
            }
        })
    } catch (error) {
        console.log(error)
        res.json({success: false, msg: error})
    }
})

app.get('/api/getroles', (req,res) => {
    try {
        var query = "SELECT * FROM designation";
        pool.query(query, (err,rows) => {
            if(err){
                console.log(err)
                res.json({success: false})
            }
            else{
                console.log(rows)
                res.json({success: true, rows: rows})
            }
        })
    } catch (error) {
        console.log(error)
        res.json({success: true})
    }
} )




app.listen(5000,() => {
    console.log("Connection opened on port 5000")
})