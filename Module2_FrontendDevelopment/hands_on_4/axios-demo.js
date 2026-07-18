const axios = require("axios");

async function getStudents(){

    try{

        const response = await axios.get(
            "https://jsonplaceholder.typicode.com/users"
        );

        console.log(response.data);

    }

    catch(error){

        console.log(error.message);

    }

}

getStudents();