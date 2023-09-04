import { Router } from "express";
import { createUser, deleteUsers, getUserByName, getUsers, updateUsers } from "../controllers/userControllers.js";

const rutas=Router();

rutas.get('/users', getUsers);

rutas.get('/users/:name', getUserByName);

rutas.post('/users', createUser );

rutas.put('/users/:name', updateUsers );

rutas.delete('/users/:name', deleteUsers );

export default rutas;