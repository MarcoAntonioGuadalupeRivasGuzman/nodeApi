import { poolConexion } from "../conexion.js";


export const getUsers = async (req,res)=> {
    const [rows]=await poolConexion.query('SELECT * FROM login');
    res.json(rows);
};

export const getUserByName = async (req, res)=> {
    const user = req.params.name;
    try{
    const [rows] = await poolConexion.query('SELECT * FROM login WHERE usuario=?',user);
    if(rows.length<=0){
        return res.status(404).json({
            message: 'No se encontro el usuario'
        });
    }
    res.json(rows[0]);
    }catch(error){
        return res.status(500).json({message: error.message});
    }
}

export const createUser = async (req,res)=> {
    const {user, nombre, pass, tipo, recover} = req.body;
    try{
    const [rows] = await poolConexion.query('INSERT INTO login (usuario, nombre,password,tipo,recover ) VALUES (?,?,?,?,?)', [user, nombre, pass, tipo, recover]);
    res.send({
        id: rows.insertId,
        user,
        nombre,
        pass,
        tipo,
        recover
    });
    }catch(error){
        return res.status(500).json({message: error.message});
    }
};

export const updateUsers = async (req,res)=>{
    const {name} = req.params;
    try{
    const {user, nombre, pass, tipo, recover} = req.body;
    console.log(user,nombre,pass,tipo,recover);
    const [result] = await poolConexion.query('UPDATE login SET usuario=?, nombre=?, password=?, tipo=?, recover=? WHERE usuario=?', [user,nombre,pass,tipo,recover, name]);
    if(result.affectedRows === 0){
        return res.status(404).json({
            message: 'No se encontro el usuario'
        });
    }
    const [rows]= await poolConexion.query('SELECT * FROM login WHERE usuario=?',user);
    res.json(rows[0]);
    }catch(error){
        return res.status(500).json({message: error.message});
    }
} 

export const deleteUsers = async (req,res)=>{
    const user = req.params.name;
    const [result] = await poolConexion.query('DELETE FROM login WHERE usuario=?', user);
    if(result.affectedRows <= 0){
        return res.status(404).json({
            message: 'No se encontro el usuario'
        });
    }
    res.sendStatus(204);
};