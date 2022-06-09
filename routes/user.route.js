const express = require("express");


const { getHome, getProfile, getAllBlogpost, getBlogpost, updateBlogPost, deleteBlogPost, updateProfile } = require("../controllers/user.controller");

const router = express();

// get user home page
router.get("/home", getHome);

// get user profile page
router.get("/Profile", getProfile);

// update profile
router.put("/updateProfile/:userid", updateProfile);

module.exports = router;