import url from "./URL";

export default async () => {
  const response = await fetch(`${url}/games`)
    .catch((err) =>
      console.error(err)
    );

  const gameResults = await response.json()
  if (gameResults.error) {
    return null
  }

  return gameResults
};