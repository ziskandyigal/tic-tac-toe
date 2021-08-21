<script>
    import { onMount } from "svelte";
    import ScoreList from "../components/winScores/ScoreList.svelte";

    import getUserDetails from "../services/getUserDetails.js";
    import getGameWinResults from "../services/getGameWinResults.js";

    let usersGamesWins;

    const getUsersScores = async () => {
        let gameWins = [];

        try {
            const wins = await getGameWinResults();
            for (let [userId, score] of Object.entries(wins)) {
                let userDetails = await getUserDetails(userId)
                gameWins.push({email: userDetails.email, wins: score})
            }
        } catch (error) {
            console.error(error);
        }
        return gameWins;
    }

    onMount(() => {
        usersGamesWins = getUsersScores();
    })
</script>

<main>
    {#await usersGamesWins}
        <h2>Loading...</h2>
    {:then gameScores}
        <ScoreList {gameScores} />
    {:catch error}
        <p> snap... errors </p>
        <p>{error}</p>
    {/await}
</main>