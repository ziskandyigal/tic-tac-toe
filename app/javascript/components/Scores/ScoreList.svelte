<script>
    import { fly } from "svelte/transition";
    import { flip } from "svelte/animate";

    import Score from "./Score.svelte";
    export let gameScores = [];
</script>

<style>
    h2 {
        text-transform: capitalize;
    }
</style>

<section>
    <h2>User scores:</h2>
    {#each gameScores as userScore, index (userScore.id)}
        <div
            in:fly={{ x: 200, delay: index * 700 }}
            out:fly={{ x: -200 }}
            animate:flip>
            <Score {...userScore}  />
        </div>
    {:else}
        <h2>No scores...</h2>
    {/each}
</section>