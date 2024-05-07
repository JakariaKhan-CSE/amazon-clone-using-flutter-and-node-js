const express = require("express");
const productRouter = express.Router();
const auth = require("../middleware/auth");
const Product = require("../models/product"); // import model name

// Get all category  product
// /api/product?category=fashion               req.query.category
// /api/product/:name              req.params.category
productRouter.get("/api/products", auth, async (req, res) => {
  // only admin can access it
  try {
    // console.log(req.query.category);
    // maximum time i forget to add Model Name (Product)
    const products = await Product.find({ category: req.query.category }); // get all data from database based on category
    // console.log('products is: '+products);
    res.json(products);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// create api for get search product
productRouter.get("/api/products/search/:name", auth, async (req, res) => {
  try {
    // console.log(`client request: ${req.params.name}`);
    const product = await Product.find({        // be care ful use (regex)
      name: { $regex: req.params.name, $options: "i" }, // search product by first letter (i for iphone)
    });
    // console.log('product is: '+product);
    res.json(product);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// router ke index er sathe connect korte hobe
module.exports = productRouter; // aita index.js file a na dile error dibe
