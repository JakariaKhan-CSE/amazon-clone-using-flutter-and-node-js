const jwt = require('jsonwebtoken');

const auth = async (req,res,next)=>{
    try {
        const token = req.header('x-auth-token');
        if(!token) // 401 for unauthorized access
        return res.status(401).json({msg: "No auth token, access denied"});

        const verified = jwt.verify(token, "passwordkey");
        if(!verified) return res.status(401).json({msg: "Token verification failed, authorization denied"});

        req.user = verified.id;
        res.token = token;
        next();
    } catch (error) {
        res.status(500).json({error: error.message});
    }
}

module.exports = auth; // i get long time error because i use module.exports(auth)

