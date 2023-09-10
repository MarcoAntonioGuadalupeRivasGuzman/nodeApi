import express from "express";
import { poolConexion } from "./conexion.js";
import userRutes from './routes/userRoutes.js';

const app= express();

app.use(express.json());

app.use((req, res, next)=>{
    res.append('Access-Control-Allow-Origin', ['*']);
    res.append('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.append('Access-Control-Allow-Headers', 'Content-Type');
    next();
});

app.get('/test', async (req, res)=>{
    const [result] = await poolConexion.query('SELECT 1+1 AS result')
    res.json(result);
});

app.use('/api',userRutes);



app.listen(3300);


console.log('Server runing on port 3300');

//console.log("Hello word");
