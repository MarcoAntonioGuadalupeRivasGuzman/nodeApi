import { createPool } from "mysql2/promise";

export const poolConexion=createPool({
    host: 'localhost',
    user: 'tony',
    password: 't0n1h4ll4n1472',
    port: 3306,
    database: 'tutorias'
});