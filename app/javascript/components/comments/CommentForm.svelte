<script>
    import { slide } from "svelte/transition";
    import { createEventDispatcher } from "svelte";
    import { navigate } from "svelte-routing";

    import user from "../../stores/user";
    import submitComment from "../../services/submitComment"

    export let email = "";
    let comment = "";
    $: isEmpty = !comment || !email;

    const dispatch = createEventDispatcher();

    const handleSubmit = async () => {
        if (!$user.token) {
            navigate("/login");
            return;
        }

        try {
            comment = await submitComment({
                comment: comment,
                userToken: $user.token, 
                email: email 
            });

            if (comment) {
                dispatch('close-comment-form')
            }
        } catch (error) {
            console.error(error)
        }
    };
</script>

<h4 transition:slide>Leave your comment</h4>
<div class="bg-light p-2">
    <div class="d-flex flex-row align-items-start">
        <!-- svelte-ignore a11y-missing-attribute -->
        <textarea bind:value={comment} class="form-control ml-1 shadow-none textarea" />
    </div>
    <form class="mt-2 text-right" on:submit|preventDefault={handleSubmit}>
        <button 
            class:disabled={isEmpty} 
            class="btn btn-primary btn-sm shadow-none" 
            type="submit"
        >
            Post comment
        </button>
        <button 
            class="btn btn-outline-primary btn-sm ml-1 shadow-none" 
            on:click={() => dispatch('close-comment-form')}
            type="button"
        >
            Cancel
        </button>
    </form>
</div>