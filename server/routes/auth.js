const express = require('express');

const authRouter = express.Router();

authRouter.get('/user',(req,res)=>{
    res.json({
        msg: "Jakaria"
    });
});
// ('admin/signup') for admin api
authRouter.post('/api/signup', (req,res)=>{
    const {name, email, password} = req.body;
})


module.exports = authRouter;  // aita na dile onno file theke access kora jabe na.