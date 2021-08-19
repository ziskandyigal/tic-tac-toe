<script>
    import { slide } from "svelte/transition";
    import { createEventDispatcher } from "svelte";
    export let email = "";
    export let wins = 0;
    // export let showForm;
    // let isProductSelected = false;
    // const toggleProducDetailsSelected = () => {
    //     isProductSelected = !isProductSelected;
    // };
    // const dispatch = createEventDispatcher();
</script>

<article class="single-score">
    <div class="score-info">
        <h2>
            {email}
            <!-- <button
                class="score-details-btn"
                on:click={toggleProducDetailsSelected}>
                <i class="fas fa-caret-down" />
            </button> -->
        </h2>
        
        <!-- {#if isScoreSelected}
            <h4 transition:slide>units: {amount} category:{category}</h4>
        {/if} -->
    </div>
    <div>
        <h2>{wins}</h2>
        <!-- <button
            class="product-btn edit-btn"
            on:click|preventDefault={() => {
                dispatch('edit-item', {
                    id: id,
                    name: name,
                    amount: amount,
                    category: category,
                });
                showForm();
            }}>
            <i class="fas fa-pen" />
        </button>
        <button
            class="product-btn delete-btn"
            on:click|preventDefault={() => dispatch('remove-item', id)}>
            <i class="fas fa-trash" />
        </button> -->
    </div>
</article>