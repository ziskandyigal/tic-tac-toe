<script>
    import { link } from "svelte-routing";
    import LoginLink from "./LoginLink.svelte";

    const links = [{url: "/", text: "play the game"}, {url: "scores", text: "check out scores"}]
</script>

<nav class="navbar">
    <div class="nav-container">
        <div class="nav-center">
            <ul class="nav-links">
                {#each links as navLink}
                    <li><a href={navLink.url} use:link>{navLink.text}</a></li>
                {/each}
            </ul>
            <div class="nav-aside">
                <LoginLink />
            </div>
        </div>
    </div>
</nav>