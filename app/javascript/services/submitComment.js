import axios from "axios";
import url from "./URL"

const submitComment = async ({ comment, email, userToken }) => {
    const response = await axios.
        post(`${url}/comments`, {
            comment: {
                text: comment
            },
            email: email
        }, {
            headers: {
                Authorization: userToken
            }
        })
        .catch(err => console.log(err))

    return response
}

export default submitComment