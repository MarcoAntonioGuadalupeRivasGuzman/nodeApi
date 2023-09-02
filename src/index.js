import express from "express";
import { poolConexion } from "./conexion.js";
import userRutes from './routes/userRoutes.js';

const app= express();

app.get('/test', async (req, res)=>{
    const [result] = await poolConexion.query('SELECT 1+1 AS result')
    res.json(result);
});

app.use(userRutes);



app.listen(3300);


console.log('Server runing on port 3300');

//console.log("Hello word");