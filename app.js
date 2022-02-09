var express = require('express');
var app = express();
var cors = require('cors')
const jwt = require('jsonwebtoken')
var pool = require('./db')
var fileupload = require('express-fileupload')
const logger = require('./middleware/logger')
const authorize = require('./middleware/authorize')
var easyinvoice = require('easyinvoice')
const fs = require('fs')

var admin = require("firebase-admin");
var serviceAccount = require("./serviceAccount.json");

const mysql = require("mysql");
const MySqlEvents = require("@rodrigogs/mysql-events");
const http = require("http").createServer(app);
const ws = require("ws");
var cors = require("cors");
app.use(cors());
const io = require("socket.io")(http, {
    wsEngine: ws.Server,
    cors: {
        origin: "http://localhost:3000",
    },
});
const { database } = require("./config/helpers");

// app.use(authorize)


const worker = require('./routes/worker')
const client = require('./routes/clients')
const analytics = require('./routes/analytics')
const company = require('./routes/company')
const contract_worker = require('./routes/contract_worker')



app.use(express.json())
app.use(fileupload())
app.use(express.urlencoded({ extended: false }));


app.use('/api/worker',worker)
app.use('/api/client',client)
app.use('/api/analytics',analytics)
app.use('/api/company',company)
app.use('/api/contractworker',contract_worker)


app.use('/api/uploads',express.static('uploads'))
app.use('/api/bills',express.static('generated_bills'))




admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

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
                    res.json({success: true, msg: "You have logged in successfully", token: token,type: rows[0].type, username: rows[0].username, id: rows[0].id})
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
        var query = "SELECT designation FROM roles";
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

app.get('/api/sendNotification', (req,res) => {
    const device = "eXNbzI-tSfavGCgv_YJiDZ:APA91bGipEddhF3a47mR_E8RdNuKHzqpU_SQFMMuXyf4bUIs3fSbMIQKTINnCRP3qoaZ5GG4KMDh2pLC1_CrsYQZQuqk45VQ2qaMIwKK_TkCznJNe_9-SJJJ5_HglEtQ8enStn-L30cF"
    const payload = {
        notification: {
            title: "This is a notification from node js",
            body: "Yo i have sent it",
            android_channel_id: "jobista"
        },
        data:{
            route: "client"
        }
    };
    const option = {priority: 'high', timeToLive: 60*60*24};
    try {
        admin.messaging().sendToDevice(device,payload,option)
        res.json("Notification sent")
    } catch (error) {
        console.log(error)
        res.json(error)
    }
})

app.post('/api/deviceid',(req, res) => {
    // res.locals.user = 16;
    const details = req.body;
    try {
        var query = "UPDATE accounts SET device_id = ? WHERE id = ?";
        pool.query(query, [details.device_id,details.id] , (err,rows) => {
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
        res.json({success: false})
    }
})


app.get('/api/generatebill', (req, res) => {

    const generateBill = async() => {
        try {
            console.log(data)
            result = await easyinvoice.createInvoice(data)
            // easyinvoice.createInvoice(data, async function (result) {
            //     //The response will contain a base64 encoded PDF file
            //     // console.log('PDF base64 string: ', result.pdf);
            //     await fs.writeFileSync('./uploads/invoice.pdf',result.pdf, 'base64')
            //     res.json("Bill has been generated");
            // });
            await fs.writeFileSync('./uploads/invoice.pdf',result.pdf, 'base64')
            res.json("Bill has been generated");
        } catch (error) {
            console.log(error)
            res.json(error)
        }
    }


    var data = {
        // Customize enables you to provide your own templates
        // Please review the documentation for instructions and examples
        "customize": {
             "template": fs.readFileSync('template.html', 'base64') // Must be base64 encoded html 
        },
        "images": {
            // The logo on top of your invoice
            "logo": fs.readFileSync('logo1.jpg', 'base64'),
            // "logo": "https://public.easyinvoice.cloud/img/logo_en_original.png"
        },
        // Your own data
        "sender": {
            "company": "Jobista",
            "address": "Sample Street 123",
            "zip": "572101",
            "city": "Tumkur",
            "State": "Karnataka",
            "country": "India"
            //"custom1": "custom value 1",
            //"custom2": "custom value 2",
            //"custom3": "custom value 3"
        },
        // Your recipient
        "client": {
            "company": "Dhruv D Jain",
            "address": "Geergae Villa",
            "zip": "572103",
            "city": "Tumkur",
            "state": "Karnataka",
            "country": "India"
            // "custom1": "custom value 1",
            // "custom2": "custom value 2",
            // "custom3": "custom value 3"
        },
        "information": {
            // Invoice number
            "number": "6583-8392",
            // Invoice data
            "date": "29-12-2021",
        },
        // The products you would like to see on your invoice
        // Total values are being calculated automatically
        "products": [
            {
                "quantity": 2,
                "description": "Electric works",
                "tax-rate": 3,
                "price": 500
            },
            // {
            //     "quantity": 4.1,
            //     "description": "Product 2",
            //     "tax-rate": 6,
            //     "price": 12.34
            // },
            // {
            //     "quantity": 4.5678,
            //     "description": "Product 3",
            //     "tax-rate": 21,
            //     "price": 6324.453456
            // }
        ],
        // The message you would like to display on the bottom of your invoice
        "bottom-notice": "The invoice is paid successfully",
        // Settings to customize your invoice
        "settings": {
            "currency": "INR", // See documentation 'Locales and Currency' for more info. Leave empty for no currency.
            // "locale": "nl-NL", // Defaults to en-US, used for number formatting (See documentation 'Locales and Currency')
            // "tax-notation": "gst", // Defaults to 'vat'
            // "margin-top": 25, // Defaults to '25'
            // "margin-right": 25, // Defaults to '25'
            // "margin-left": 25, // Defaults to '25'
            // "margin-bottom": 25, // Defaults to '25'
            // "format": "A4" // Defaults to A4, options: A3, A4, A5, Legal, Letter, Tabloid
        },
        // Translate your invoice to your preferred language
        "translate": {
            // "invoice": "FACTUUR",  // Default to 'INVOICE'
            // "number": "Nummer", // Defaults to 'Number'
            // "date": "Datum", // Default to 'Date'
            // "due-date": "Verloopdatum", // Defaults to 'Due Date'
            // "subtotal": "Subtotaal", // Defaults to 'Subtotal'
            // "products": "Producten", // Defaults to 'Products'
            // "quantity": "Aantal", // Default to 'Quantity'
            // "price": "Prijs", // Defaults to 'Price'
            // "product-total": "Totaal", // Defaults to 'Total'
            // "total": "Totaal" // Defaults to 'Total'
        },
    };

    generateBill();
    
    
})

// let data = [];
// let currentData = [];

// // console.log(database)

// // use sockets to setup connection

// io.sockets.on("connection", (socket) => {
//     console.log(socket.id);
//     database
//         .table("contract_jobs")
//         // .withFields(["id"])
//         .filter({ status: { $sql: "= 0" } })
//         .sort({ id: -1 })
//         .getAll()
//         .then((works) => {
//             // console.log(works);
//             data = works;
//             io.sockets.emit("initial", { works: [...data] });
//         })
//         .catch((err) => console.log(err));
// });

// const program = async () => {
//     const connection = mysql.createConnection({
//         host: "localhost",
//         user: "root",
//         password: "password",
//     });

//     const instance = new MySqlEvents(connection, {
//         startAtEnd: true,
//     });

//     await instance.start();

//     instance.addTrigger({
//         name: "Monitor all the statements",
//         expression: "jobify.*",
//         statement: MySqlEvents.STATEMENTS.ALL,
//         onEvent: (e) => {
//             currentData = e.affectedRows;
//             let newData;

//             switch (e.type) {
//                 case "DELETE":
//                     newData = currentData[0].before;
//                     let index = data.findIndex((p) => p.id === newData.id);

//                     if (index > -1) {
//                         data = data.filter((p) => p.id !== newData.id);
//                         console.log(data);
//                         io.sockets.emit("update", {
//                             works: [...data],
//                         });
//                     } else {
//                         return;
//                     }
//                     break;
//                 case "UPDATE":
//                     newData = currentData[0].after;
//                     if (newData.status == 0) {
//                         let index = data.findIndex((p) => p.id === newData.id);

//                         if (index > -1) {
//                             data[index] = newData;
//                             console.log(data);
//                         } else {
//                             data.push(newData);
//                         }
//                         io.sockets.emit("update", {
//                             works: [...data],
//                         });
//                     } else {
//                         let index = data.findIndex((p) => p.id === newData.id);

//                         if (index > -1) {
//                             data = data.filter((p) => p.id !== newData.id);
//                             console.log(data);
//                             io.sockets.emit("update", {
//                                 works: [...data],
//                             });
//                         } else {
//                             return;
//                         }
//                     }

//                     break;
//                 case "INSERT":
//                     database
//                         .table("contract_jobs")
//                         // .withFields(["id"])
//                         .filter({ status: { $sql: "= 0" } })
//                         .sort({ id: -1 })
//                         .getAll()
//                         .then((works) => {
//                             console.log(works);
//                             data = works;
//                             io.sockets.emit("update", { works: [...data] });
//                         })
//                         .catch((err) => console.log(err));
//                 default:
//                     console.log(e.type);
//                     break;
//             }
//         },
//     });

//     instance.on(MySqlEvents.EVENTS.CONNECTION_ERROR, console.error);
//     instance.on(MySqlEvents.EVENTS.ZONGJI_ERROR, console.error);
// };

// program().then();

// http.listen(3001, () => {
//     console.log("The socket is open on port 3001");
// });





app.listen(5000,() => {
    console.log("Connection opened on port 5000")
})