const db = require("../models/user.model");
const { v4: uuidv4 } = require("uuid");
const bcrypt = require("bcrypt");

const path = require("path");

const getSignUpPage = (req, res) => {
    res.sendFile(path.join(__dirname + "/../views/signUp.html"));
}

const postUserSignUp = async (req, res) => {

    try {
        
    let { name, email, username } = req.body;

    const password = await bcrypt.hash(req.body.password, 10);

    var userid = uuidv4();

    function isRegistered(callback) {

        (function checkEmail() {
            var query = "select email, username from tbl_user where email = ? or username = ?";

            db.query(query, [email, username], (err, results) => {

                if(err){
                    console.log(err);
                }
                else if (results.length >= 1) {
                    res.status(300).json({
                        message: `User with email ${email} is already registered or Username taken`,
                    });                 
                }
                else {
                    callback();
                }
            });
        })();
    };

    isRegistered(callback);

    function callback() {
        var query = "insert into tbl_user values (?, ?, ?, ?, ?)";
        db.query(query, [userid, name, email, username, password], (err, results) => {
            if (!err) {
                res.status(200).json({
                    success: `Registration successful for ${name}`,
                    results
                });
            }
            else {
                console.log(err);
            }
        });
    }
    } catch (error) {
        console.log("Registration Failed \n Error: "+ error);
    }

};

module.exports = { getSignUpPage, postUserSignUp }