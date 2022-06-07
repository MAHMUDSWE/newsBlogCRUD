const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");

const app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cors());


app.use((req, res, next) => {
    res.status(404).json({
        message: "Error! Page not found",
    });
});

module.exports = app;