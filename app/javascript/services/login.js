import axios from "axios";
import { setupUser } from "../helpers/setupUser";
import url from "./URL"

const loginUser = async (email, password) => {
    const response = await axios
        .post(`${url}/tokens`, {
            user: {
                email: email,
                password: password
            }
        })
        .catch(error => console.log(error))

    if (response) {
        setupUser(response)
    }

    return response
}

export default loginUser;