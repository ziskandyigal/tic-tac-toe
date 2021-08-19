
import axios from "axios";

import url from "./URL"
import { setupUser } from "../helpers/setupUser";

const registerUser = async (email, password) => {
    const response = await axios
        .post(`${url}/users`, {
            user: {
                email: email,
                password: password
            }
        })
        .catch(error => {
            console.log(error);
        });

    if (response) {
        setupUser(response)
    }

    return response
}

export default registerUser;