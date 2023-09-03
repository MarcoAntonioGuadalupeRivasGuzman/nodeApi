import { poolConexion } from "../conexion.js";


export const getUsers = (req,res)=> {
    res.send('obteniendo usuarios')
};

export const createUser = async (req,res)=> {
    const {user, nombre, pass, tipo, recover} = req.body;
    const [rows] = await poolConexion.query('INSERT INTO login (usuario, nombre,password,tipo,recover ) VALUES (?,?,?,?,?)', [user, nombre, pass, tipo, recover]);
    res.send({rows})};

export const updateUsers = (req,res)=> res.send('actualizando usuarios');

export const deleteUsers = (req,res)=> res.send('borrando usuarios');