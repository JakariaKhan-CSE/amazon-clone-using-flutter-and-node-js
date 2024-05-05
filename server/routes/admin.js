const express = require('express');
const adminRouter = express.Router();
const admin = require('../middleware/admin');
const Product = require('../models/product');

// post api (add product)
adminRouter.post('/admin/add-product', admin, async(req,res)=>{  // function call hole (admin) authrized kina check hobe
try {

    

    const {name,description,quantity,images,category,price} = req.body;
    let product = new Product({
        name,
        description,
        quantity,
        images,
        category,
        price,
        
    });

    product = await product.save(); // save to database
    res.json(product);
    
} catch (e) {
    res.status(500).json({error: e.message});
}
});

module.exports = adminRouter;
