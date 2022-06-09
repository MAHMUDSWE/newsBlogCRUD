const db = require("../models/user.model");
const bcrypt = require("bcrypt");
const path = require("path");

const getLogInPage = (req, res) => {
    res.sendFile(path.join(__dirname + "/../views/login.html"));
}

const postUserLogin = (req, res) => {

    const username = req.body.username;
    const password = req.body.password;

    let query = "select password from tbl_user where username = ? ";

    db.query(query, [username], (err, results) => {

        if (results.length == 1) {

            hash = results[0].password;

            bcrypt.compare(password, hash, (err, result) => {

                if(err){
                    console.log(err);
                }

                else if (result == true) {
                    res.status(200).json({
                        message: "log in Successful"
                    });
                }

                else {
                    res.status(300).json({
                        message: "log in failed! Invalid username or password."
                    });
                }

            });
        }
        else {
            res.status(401).json({
                message: "log in failed! Invalid username or password."
            });
        }
    });

}

module.exports = { getLogInPage, postUserLogin };
