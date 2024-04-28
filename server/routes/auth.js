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
    const {name, email, password} = req.body;

    const existingUser =await  User.findOne({email});
    if(existingUser)
    {
        // return use na korle o kaj korbe. Kintu next step gulo execute korbe. Jodi return use kora hoi, tahole aikhane hold korbe
        return res.status(400).json({msg: "User with same email already exists"});
    }
})



module.exports = authRouter;  // aita na dile onno file theke access kora jabe na.