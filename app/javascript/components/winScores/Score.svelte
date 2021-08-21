<script>
    import CommentForm from "../comments/CommentForm.svelte";
import CommentsList from "../comments/CommentsList.svelte";

    export let email = "";
    export let wins = 0;

    let isScoreSelected = false;
    const toggleScoreCommentsSelected = () => {
        isScoreSelected = !isScoreSelected;
    };
</script>

<div>
   <article class="single-score">
        <div class="score-info">
            <h3>
                {email}
            </h3>      
        </div>
        <div>
            <h3>
                {wins}
            </h3>
        </div>
        <button 
            on:click|preventDefault={toggleScoreCommentsSelected}
            class="score-btn edit-btn"
        >
            <!-- svelte-ignore a11y-missing-attribute -->
            <img src="https://img.icons8.com/material-outlined/24/000000/comments--v2.png"/>
        </button>
    </article>
    {#if isScoreSelected}
        <CommentForm {email} on:close-comment-form={toggleScoreCommentsSelected}/>
        <CommentsList />
    {/if}  
</div>
