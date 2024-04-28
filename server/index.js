
const  express = require('express');
const PORT = 3000;

const app = express();





app.listen(PORT,  (req,res)=>{

    console.log('Connected at port: '+PORT);
    console.log(`Connected port: ${PORT}`);   // be careful use `` top of tab.  not '' top of shift
});