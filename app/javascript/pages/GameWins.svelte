<script>
    import { onMount } from "svelte";

    import getGameWinResults from "../services/getGameWinResults.js";

    let gameWins;

    onMount(async () => {
        gameWins = await getGameWinResults();
        console.log(gameWins)
    })

    
</script>

