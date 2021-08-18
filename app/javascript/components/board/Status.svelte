<script>
    import { scale } from "svelte/transition";
  
    export let start;
    export let draw;
    export let player;
    export let resetBoard;
  </script>
  
  <style>
    .winner {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      font-size: 2rem;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      background-color: rgba(255, 255, 255, 0.825);
      border-radius: 10px;
    }
    h2 {
      margin-top: 0;
    }
    button {
      padding: 1rem 2rem;
      border: none;
      font-size: 1rem;
      font-weight: bold;
      border-radius: 2px;
      cursor: pointer;
      color: var(--white);
      background-color: var(--black);
      transition: background-color 0.25s ease;
    }
    button:hover,
    button:focus {
      color: var(--black);
      background-color: var(--silver);
    }
  </style>
  
  <div class="winner" transition:scale="{{ duration: 100, opacity: 0.5, start: 0.75 }}">
    {#if start}
      <h2>Let's start</h2>
    {:else if draw}
      <h2>It's a draw</h2>
    {:else}
      <h2>{player} Wins</h2>
    {/if}
    <button type="button" on:click={() => resetBoard()}>New Game</button>
  </div>