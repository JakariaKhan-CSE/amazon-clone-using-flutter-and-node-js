// pass: w2A7f62jqN3kNVYs
// user: jakaria

const  express = require('express');
const mongoose = require('mongoose');
const PORT = 3000;
const DB = 'mongodb+srv://jakaria:w2A7f62jqN3kNVYs@cluster0.pcdlcay.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0'; ///MyNewDatabase mantion kora hoini tai test name database niyese

const authRouter = require('./routes/auth');
const app = express();


//middleware
app.use(express.json());
app.use(authRouter);

// Connections
mongoose.connect(DB).then(()=>{
    console.log('Database connection successfull');
}).catch((e)=>{
    console.log(e);
});

app.listen(PORT, (req,res)=>{  
    
    console.log(`Connected port: ${PORT}`); 
});