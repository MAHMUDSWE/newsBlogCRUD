const express = require("express");

const {getBlogPostPage, postBlogPost, getAllBlogpost, getBlogpost, updateBlogPost, deleteBlogPost} = require("../controllers/blogpost.controller");

const router = express.Router();

// get blogpost page
router.get("/blogpost", getBlogPostPage);

// create news
router.post("/blogpost/:userid", postBlogPost);

// news from everyone
router.get("/allblogpost", getAllBlogpost);

// news from specific user and user himself
router.get("/blogpost/:username", getBlogpost);

// update news
router.put("/blogpost/:blogid", updateBlogPost);

// delete news
router.delete("/blogpost/:blogid", deleteBlogPost);

module.exports = router;