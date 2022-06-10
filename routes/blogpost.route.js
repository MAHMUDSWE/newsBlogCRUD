const express = require("express");

const {getBlogPostPage, postBlogPost, getAllBlogpost, getBlogpost, updateBlogPost, deleteBlogPost, getSpecificUserBlogpost} = require("../controllers/blogpost.controller");
const { checkLogin } = require("../middleware/authenticateLogin");

const router = express.Router();

// get blogpost page
router.get("/post/blogpost", checkLogin ,getBlogPostPage);

// create news
router.post("/blogpost", checkLogin, postBlogPost);

// news from everyone
router.get("/allblogpost", checkLogin, getAllBlogpost);

// news from user himself
router.get("/blogpost", checkLogin, getBlogpost);

// news from specific user
router.get("/blogpost/:username", checkLogin, getSpecificUserBlogpost);

// update news
router.put("/blogpost/:blogid", checkLogin, updateBlogPost);

// delete news
router.delete("/blogpost/:blogid", checkLogin, deleteBlogPost);

module.exports = router;