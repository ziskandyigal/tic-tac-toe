import { setStorageUser, setUser } from "../stores/user"

export const setupUser = async (response) => {
    const { token, email } = await response.data
    const confirmedUser = { token, email }

    setStorageUser(confirmedUser)
    setUser(confirmedUser)
}