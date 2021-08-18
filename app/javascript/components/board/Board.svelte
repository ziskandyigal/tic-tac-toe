<!-- credits to iambry for game implementation -->
<!-- https://codesandbox.io/embed/svelte-tac-toe-pt5cf?theme=dark&view=preview&codemirror=1&hidenavigation=1&hidedevtools=1 -->

<script>
    import Square from "./Square.svelte";
    import Status from "./Status.svelte";
    import { getBoard, getWinner, isFull } from "../helpers/boardHelpers";
  
    let player = "X";
    let start = true;
    let winner = null;
    let draw = false;
    let board = getBoard();
  
    const setValue = index => {
      board = board.map((value, i) => (index === i ? player : value));
  
      if (getWinner(board)) {
        winner = player;
      } else if (isFull(board)) {
        draw = true;
      } else {
        player = player === "X" ? "Y" : "X";
      }
    };
  
    const resetBoard = () => {
      winner = null;
      draw = false;
      start = false;
      board = getBoard(true);
    };
  </script>
  
  <main>
    <h1>Tic Tac Toe</h1>
    <div class="board">
      {#each board as value, index}
        <Square {value} {index} {setValue} />
      {/each}
      {#if start || draw || winner}
        <Status {start} {draw} {player} {resetBoard} />
      {/if}
    </div>
  </main>


