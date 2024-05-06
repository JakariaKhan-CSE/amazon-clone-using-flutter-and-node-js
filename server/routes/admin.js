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

// Get all your product
adminRouter.get('/admin/get-products', admin ,async(req,res)=>{ // only admin can access it
try {
    // console.log('Request product from client');
    const products =await Product.find();   // i miss await to get long time error       // get all data from database
    // console.log('products is: '+products);
    res.json(products);
} catch (err) {
    res.status(500).json({error: err.message});
}
});


// delete the product
adminRouter.post('/admin/delete-product', admin, async(req,res)=>{
    try {
        const {id} = req.body;      // body theke id nite hobe
        let product = await Product.findByIdAndDelete(id);  // delete kora hosse
        
        res.json(product);
        
    } catch (e) {
        res.status(500).json({error: e.message});
    }
})

module.exports = adminRouter;

