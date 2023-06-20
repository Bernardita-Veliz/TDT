import app from "./app.js";
import { sequelize } from "./database/database.js";


async function main(){
    try{
        await sequelize.sync();
        console.log("Connetion has been establishen successfully");
        app.listen(4000);
        console.log("server is listening on port", 4000);
    }catch(error){
        console.error("Unable to connect to the database", error);
    }

}

main();
