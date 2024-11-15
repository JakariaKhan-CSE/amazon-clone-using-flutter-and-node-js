const express = require("express");
const productRouter = express.Router();
const auth = require("../middleware/auth");
const {Product} = require("../models/product"); // import model name

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

// create api for rating product
productRouter.post("/api/rate-product", auth, async(req,res)=>{
  try {
    
    const {id,rating}= req.body;
    let product = await Product.findById(id);

    for(let i=0; i<product.rating.length; i++)
      {
        if(product.rating[i].userId == req.user)
          {
            /*
            The splice() method adds and/or removes array elements.
The splice() method overwrites the original array.
            */
            product.rating.splice(i,1);
            break;
          }

      }

      const ratingSchema = {
        userId: req.user,
        rating                  // rating : rating
      };

      product.rating.push(ratingSchema);
      product = await product.save();
      
      res.json(product);
    
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

productRouter.get('/api/deal-of-day', auth, async(req,res)=>{
  try {
    let products = await Product.find({});
    products  = products.sort((a,b)=>{
      let aSum = 0;
      let bSum = 0;

      for(let i=0; i<a.rating.length; i++)
        {
          aSum += a.rating[i].rating;
        }

        for(let i=0; i<b.rating.length; i++)
          {
            bSum += b.rating[i].rating;
          }

          return aSum<bSum ? 1 : -1;

    });

    res.json(products[0]);  // highest rating product ta 0 index a cole ashbe tai aita return korte hobe
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
})

// router ke index er sathe connect korte hobe
module.exports = productRouter; // aita index.js file a na dile error dibe
