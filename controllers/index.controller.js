const path = require("path");
 
// get index page
getIndexPage = (req, res)=>{
    res.sendFile(path.join(__dirname + "/../views/index.html"));
};

module.exports = { getIndexPage } ;

