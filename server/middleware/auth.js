// const jwt = require('jsonwebtoken');

// const auth = async (req,res,next)=>{
//     try {
//         console.log('auth middleware call');
//         const token = req.header('x-auth-token');
//         console.log(`token is in middleware: ${token}`);
//         if(!token) // 401 for unauthorized access
//         return res.status(401).json({msg: "No auth token, access denied"});
// console.log('Find token');
//         const verified = jwt.verify(token, "passwordkey");
//         if(!verified) return res.status(401).json({msg: "Token verification failed, authorization denied"});
// console.log('Token verified');
//         req.user = verified.id;
//         res.token = token;
//         console.log(`res.user: ${req.user},   res.token: ${res.token}`);
//         next();
//     } catch (error) {
//         res.status(500).json({error: error.message});
//     }
// }

// module.exports = auth; // i get long time error because i use module.exports(auth)





const jwt = require("jsonwebtoken");

const auth = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token)
      return res.status(401).json({ msg: "No auth token, access denied" });

    const verified = jwt.verify(token, "passwordKey");
    if (!verified)
      return res
        .status(401)
        .json({ msg: "Token verification failed, authorization denied." });

    req.user = verified.id;
    req.token = token;
    next();
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = auth;