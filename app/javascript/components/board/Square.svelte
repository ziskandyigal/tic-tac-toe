<script>
	export let value;
	export let index;
	export let setValue;
</script>

<style>
	button {
	  border: none;
	  padding: 0.25rem 0.5rem;
	  font-size: 5rem;
	  font-family: inherit;
	  min-height: 7.5rem;
	  cursor: pointer;
	  background-color: var(--white);
	  transition: background-color 0.25s ease;
	}
	button:hover,
	button:focus {
	  outline: none;
	  background-color: #fff;
	}
	button:disabled {
	  cursor: initial;
	}
	span {
	  font-weight: bold;
	  color: transparent;
	  background-clip: text;
	  -webkit-background-clip: text;
	  -webkit-text-fill-color: transparent;
	}
	.x {
	  background-image: linear-gradient(90deg, var(--orange), var(--red));
	}
	.y {
	  background-image: linear-gradient(90deg, var(--blue), var(--green));
	}
</style>

<button on:click={() => setValue(index)} disabled={Boolean(value)}>
  <span class={value === 'X' ? 'x' : 'y'}>{value}</span>
</button>