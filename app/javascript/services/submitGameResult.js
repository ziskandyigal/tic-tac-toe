import axios from "axios";
import url from "./URL"

const submitGameResult = async ({ gameStatus, userToken }) => {
    const response = await axios.
        post(`${url}/games`, {
            game: {
                status: gameStatus
            }
        }, {
            headers: {
                Authorization: userToken
            }
        })
        .catch(err => console.log(err))

    return response
}

export default submitGameResult