const express = require('express');
const productRouter = express.Router();
const auth = require('../middleware/auth');
const Product = require('../models/product');  // import model name

// Get all category  product
// /api/product?category=fashion               req.query.category
// /api/product:category=fashion               req.params.category
productRouter.get('/api/products', auth ,async(req,res)=>{ // only admin can access it
    try {
        
        // console.log(req.query.category);
        // maximum time i forget to add Model Name (Product)
        const products =await Product.find({category : req.query.category});    // get all data from database based on category
        // console.log('products is: '+products);
        res.json(products);
    } catch (err) {
        res.status(500).json({error: err.message});
    }
    });

    // router ke index er sathe connect korte hobe
module.exports = productRouter;  // aita index.js file a na dile error dibe