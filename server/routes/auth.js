const express = require('express');
const User = require('../models/user');  // import models with collection name

const authRouter = express.Router();

authRouter.get('/user',(req,res)=>{
    res.json({
        msg: "Jakaria"
    });
});
// ('admin/signup') for admin api
authRouter.post('/api/signup', async(req,res)=>{
   try {
    const {name, email, password} = req.body;

    const existingUser =await  User.findOne({email});
    if(existingUser)
    {
        // return use na korle o kaj korbe. Kintu next step gulo execute korbe. Jodi return use kora hoi, tahole aikhane hold korbe
        return res.status(400).json({msg: "User with same email already exists"});
    }
// const use na kore let/var use korte hobe karon user er value change korte hote pare
    let user = new User({
        email,
        password,
        name
    });

    user = await user.save();  // all time use await when needed to connect database

    res.json(user); // client ke user data send kora hosse
   } catch (error) {
    res.status(500).json({error: error.message});
   }
});



module.exports = authRouter;  // aita na dile onno file theke access kora jabe na.