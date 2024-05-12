const mongoose = require('mongoose');
const ratingSchema = require('./rating');

const productSchema =new mongoose.Schema({
    name:{
        type: String,
        required: true,
        trim: true
    },
    description:{
        type: String,
        required: true,
        trim: true
    },
    images: [           // images hosse array
        {
            type: String,
            required: true
        }
    ],
    quantity:
    {
        type: Number,
        required: true
    },
    price:
    {
        type: Number,
        required: true
    },
    category:{
        type: String,
        required: true
    },
    rating: [ratingSchema]   // akta schema neya hosse array er vitore
});

const Product = mongoose.model('Products',productSchema); // Products name a akta collection(table) create hobe database
module.exports = Product;