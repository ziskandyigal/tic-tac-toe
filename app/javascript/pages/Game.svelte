<script>
    import { onMount } from "svelte";
    import { navigate, link } from "svelte-routing";

    import user from "../stores/user";

    import Board from "../components/board/Board.svelte";
 
    onMount(() => {
        if (!$user.token) {
            navigate("/login");
            return;
        }
    })
</script>

<section class="form">
    {#if !$user}
        <h1>Please log in</h1>
    {:else}
        <Board />
    {/if}
</section>