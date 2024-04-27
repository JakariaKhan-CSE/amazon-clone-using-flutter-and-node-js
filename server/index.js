// import express
const  express = require('express');
const PORT = 3000;

const app = express();


// Creating an API
// http:<your ip address>/hello-world
app.get('/hello-world',(req,res)=>{
        // res.send("Hello World"); // aita simple dekhabe

        res.json({hello: "Hello World"});       // aita json format a dekhabe
});


//"0.0.0.0" aita use kora hoye karon android emulator localhost find out korte pare na.
app.listen(PORT, "0.0.0.0", (req,res)=>{   // also use function() {} and ()=>{}.    This are the same
    console.log('Connected at port: '+PORT);
    console.log(`Connected port: ${PORT}`);   // be careful use `` top of tab.  not '' top of shift
});