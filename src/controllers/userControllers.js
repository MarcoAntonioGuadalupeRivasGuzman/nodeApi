import { poolConexion } from "../conexion.js";


export const getUsers = async (req,res)=> {
    const [rows]=await poolConexion.query('SELECT * FROM login');
    res.json(rows);
};

export const createUser = async (req,res)=> {
    const {user, nombre, pass, tipo, recover} = req.body;
    const [rows] = await poolConexion.query('INSERT INTO login (usuario, nombre,password,tipo,recover ) VALUES (?,?,?,?,?)', [user, nombre, pass, tipo, recover]);
    res.send({
        id: rows.insertId,
        user,
        nombre,
        pass,
        tipo,
        recover
    })};

export const updateUsers = (req,res)=> res.send('actualizando usuarios');

export const deleteUsers = (req,res)=> res.send('borrando usuarios');