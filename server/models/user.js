const mongoose = require('mongoose');

const userSchema =new mongoose.Schema({
        name: {
            type: String,  // use type not typeof
            required: true,
            trim: true  // remove leading and trailing space
        },
        email: {
            type: String,
            required: true,
            trim: true,
            validate: {
                validator:(value)=>{

                    // aigulo hosse reject character
                    const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

                    return value.match(re);  // match korle niser message show korbe 

                },
                message: "Please enter a valid email address"
            }

        },
        password:
        {
            type: String,
            required: true,
            trim: true,
            validate: {
                validator:(value)=>{

                   

                    return value.length>5; // value/passwortd 6 digit er beshi hole. ai jaiga theke return korbe. R na hole niser message show korbe

                },
                message: "Password must be 6 digits"
            }

        },
        address:{
            type: String,
            default: ""  // this is not required so. dafault add null
        },
        type:
        {
            type: String,
            default: "user"  // default admin dhora hosse na. User dhora hosse
        }
});

const User =new mongoose.model('Users',userSchema);   // Users nam e collection/table create hobe. automatically s add kore user+s
// const User =new mongoose.model('testinguser',userSchema); 

module.exports = User;  // export na korle onno jaiga theke access kora jabe na