var express = require('express');
var app = express();
const mysql = require("mysql");
const MySqlEvents = require("@rodrigogs/mysql-events");

const http = require("http").createServer(app);
const ws = require("ws");
var cors = require("cors");
app.use(cors());
const io = require("socket.io")(http, {
    wsEngine: ws.Server,
    cors: {
        origin: "*",
    },
});
const { database } = require("./config/helpers");
const mysqlEvents = require("@rodrigogs/mysql-events");

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// Define array variables

let data = [];
let currentData = [];

// console.log(database)

// use sockets to setup connection

io.sockets.on("connection", (socket) => {
    console.log(socket.id);
    database
        .table("contract_jobs")
        // .withFields(["id"])
        .filter({ status: { $sql: "= 0" } })
        .sort({ id: -1 })
        .getAll()
        .then((works) => {
            // console.log(works);
            data = works;
            io.sockets.emit("initial", { works: [...data] });
        })
        .catch((err) => console.log(err));
});

const program = async () => {
    const connection = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "password",
    });

    const instance = new MySqlEvents(connection, {
        startAtEnd: true,
    });

    await instance.start();

    instance.addTrigger({
        name: "Monitor all the statements",
        expression: "jobify.*",
        statement: MySqlEvents.STATEMENTS.ALL,
        onEvent: (e) => {
            currentData = e.affectedRows;
            let newData;

            switch (e.type) {
                case "DELETE":
                    newData = currentData[0].before;
                    let index = data.findIndex((p) => p.id === newData.id);

                    if (index > -1) {
                        data = data.filter((p) => p.id !== newData.id);
                        console.log(data);
                        io.sockets.emit("update", {
                            works: [...data],
                        });
                    } else {
                        return;
                    }
                    break;
                case "UPDATE":
                    newData = currentData[0].after;
                    if (newData.status == 0) {
                        let index = data.findIndex((p) => p.id === newData.id);

                        if (index > -1) {
                            data[index] = newData;
                            console.log(data);
                        } else {
                            data.push(newData);
                        }
                        io.sockets.emit("update", {
                            works: [...data],
                        });
                    } else {
                        let index = data.findIndex((p) => p.id === newData.id);

                        if (index > -1) {
                            data = data.filter((p) => p.id !== newData.id);
                            console.log(data);
                            io.sockets.emit("update", {
                                works: [...data],
                            });
                        } else {
                            return;
                        }
                    }

                    break;
                case "INSERT":
                    database
                        .table("contract_jobs")
                        // .withFields(["id"])
                        .filter({ status: { $sql: "= 0" } })
                        .sort({ id: -1 })
                        .getAll()
                        .then((works) => {
                            console.log(works);
                            data = works;
                            io.sockets.emit("update", { works: [...data] });
                        })
                        .catch((err) => console.log(err));
                default:
                    console.log(e.type);
                    break;
            }
        },
    });

    instance.on(MySqlEvents.EVENTS.CONNECTION_ERROR, console.error);
    instance.on(MySqlEvents.EVENTS.ZONGJI_ERROR, console.error);
};

program().then();

http.listen(4000, () => {
    console.log("The socket is open on port 3001");
});
