import url from "./URL";

export default async () => {
  const response = await fetch(`${url}/games/wins`)
    .catch((err) =>
      console.error(err)
    );

  const gameWinResults = await response.json()
  if (gameWinResults.error) {
    return null
  }

  return gameWinResults
};