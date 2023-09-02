import { Router } from "express";

const rutas=Router();

rutas.get('/employees', (req,res)=> res.send('obteniendo empleados'));

rutas.post('/employees', (req,res)=> res.send('creando empleados'));

rutas.put('/employees', (req,res)=> res.send('obteniendo empleados'));

rutas.delete('/employees', (req,res)=> res.send('borrando empleados'));

export default rutas;