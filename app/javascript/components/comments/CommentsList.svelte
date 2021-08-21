<script>
    import { fade, fly } from "svelte/transition";
    import { flip } from "svelte/animate";

    import Comment from "./Comment.svelte";
    import getComments from "../../services/getComments"

    const getGameComments = async (userEmail) => {
        try {
            return await getComments(userEmail);
        } catch (error) {
            console.error(error);
        }
    }
</script>

{#await getGameComments()}
        <h2>Loading...</h2>
{:then results}
{#each results as comment, index (comment.id)}        
    <div            
    in:fly={{ y: -200, delay: index * 300 }}
        out:fade
        animate:flip
    >
        <Comment {...comment}  />
    </div>     
{:else}
    <h2>No comments...</h2>
{/each}
{:catch error}
    <p> snap... errors </p>
    <p>{error}</p>
{/await}

