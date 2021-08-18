<script>
    import userStore, { logoutUser } from "../stores/user";
    import { link } from "svelte-routing";
</script>

{#if $userStore.token}
    <a
        href="/"
       
        on:click={() => logoutUser()}
        use:link>
        logout
    </a>
{:else}
    <a
        href="/login"
        use:link>
        login
    </a>
{/if}