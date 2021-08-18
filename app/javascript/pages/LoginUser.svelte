<script>
    import { navigate } from "svelte-routing";
    import { onMount } from "svelte";
    
    import user from "../stores/user";
    import loginUser from "../api/login";
    import registerUser from "../api/register";

    let email = "";
    let password = "";
    let isMember = true;
    
    $: isEmpty = !email || !password 

    const toggleMember = () => {
        isMember = !isMember;
    };

    const handleSubmit = async () => {
        let user;

        if (isMember) {
            user = await loginUser(email, password);
        } else {
            user = await registerUser(email, password);
        }

        if (user) {
            navigate("/game");
            return;
        }
    };

    onMount(() => {
        if (!$user.token) {
            navigate("/login");
            return;
        } else {
            navigate("/game");
            return;
        }
    })
</script>

<section class="form">
    <h2 class="section-title">
        {#if isMember}sign in{:else}register{/if}
    </h2>

    <form class="login-form" on:submit|preventDefault={handleSubmit}>
        <div class="form-control">
            <label for="email">email</label>
            <input type="email" id="email" bind:value={email} />
        </div>
        <div class="form-control">
            <label for="password">password</label>
            <input type="password" id="password" bind:value={password} />
        </div>
        {#if isEmpty}
            <p class="form-empty">please fill out all form fields</p>
        {/if}
        <button
            type="submit"
            class="btn btn-block btn-primary"
            disbaled={isEmpty}
            class:disabled={isEmpty}>
            submit
        </button>
        {#if isMember}
            <p class="register-link">
                need to register?
                <button type="button" on:click={toggleMember}>
                    click here
                </button>
            </p>
        {:else}
            <p class="register-link">
                already a member?
                <button type="button" on:click={toggleMember}>
                    click here
                </button>
            </p>
        {/if}
    </form>
</section>
