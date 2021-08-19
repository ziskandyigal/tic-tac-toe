import url from "./URL";

export default async (userId) => {
  const response = await fetch(`${url}/users/${userId}`)
    .catch((err) =>
      console.error(err)
    );

  const gameUserDetails = await response.json()
  if (gameUserDetails.error) {
    return null
  }

  return gameUserDetails
};