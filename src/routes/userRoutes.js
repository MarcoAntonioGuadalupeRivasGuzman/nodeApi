import { Router } from "express";
import { createUsers, deleteUsers, getUsers, updateUsers } from "../controllers/userControllers.js";

const rutas=Router();

rutas.get('/users', getUsers);

rutas.post('/users', createUsers );

rutas.put('/users', updateUsers );

rutas.delete('/users', deleteUsers );

export default rutas;