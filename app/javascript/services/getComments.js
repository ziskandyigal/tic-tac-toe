import url from "./URL";

export default async (email) => {
  const response = await fetch(`${url}/comments/byemail`, {
      method: "POST",
      body: JSON.stringify({
          email: email
      }),
      headers: {"Content-type": "application/json; charset=UTF-8"}
    })
    .catch((err) =>
      console.error(err)
    );

  const gameComments = await response.json()
  if (gameComments.error) {
    return null
  }

  return gameComments;
};