const express = require('express');
const User = require('../models/user');  // import models with collection name
const bcryptjs = require('bcryptjs');  // password ke hashmap korar jonno use kora hoi. jate original password dekha na jai
const authRouter = express.Router();
const jwt = require('jsonwebtoken');


// ('admin/signup') for admin api
// sign Up api user
authRouter.post('/api/signup', async(req,res)=>{
   try {
    const {name, email, password} = req.body;  // name, email same spealing hote hobe body er sathe frontend

    const existingUser =await  User.findOne({email});  // database same email user ase kina find kora hosse
    if(existingUser)
    {
        // return use na korle o kaj korbe. Kintu next step gulo execute korbe. Jodi return use kora hoi, tahole aikhane hold korbe
        return res.status(400).json({msg: "User with same email already exists"});
    }

    const hashPassword =await bcryptjs.hash(password,8);  // aita use kore password ke encrypt kora hosse. jate database hack holeo hacker password dekhte na pai


// const use na kore let/var use korte hobe karon user er value change korte hote pare
    let user = new User({
        email,
        password: hashPassword,
        name
    });

    user = await user.save(); // database a save hosse  // all time use await when needed to connect database

    res.json(user); // client ke user data send kora hosse
   } catch (error) {
    res.status(500).json({error: error.message});
   }
});

// sign In user api
authRouter.post('/api/signin', async(req,res)=>{
   try {
    const {email,password} = req.body;

    const user = await User.findOne({email:email});
    if(!user)
    {
        return res.status(400).json({msg: "user with this email does not exist"});
    }
   const isMatch =  await bcryptjs.compare(password, user.password); // 1st password user disse aita ke database er hashpassword er sathe comapare kora hosse
   if(!isMatch)
   {
    return res.status(400).json({msg: "Incorrect Password"});
   }

   const token = jwt.sign({id:user._id}, "passwordkey");
   res.json({token, ...user._doc});


   } catch (error) {
    res.status(500).json({error: e.message});
   }
})

module.exports = authRouter;  // aita na dile onno file theke access kora jabe na.