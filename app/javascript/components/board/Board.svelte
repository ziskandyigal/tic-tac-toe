<!-- credits to iambry for initial game -->
<!-- https://codesandbox.io/embed/svelte-tac-toe-pt5cf?theme=dark&view=preview&codemirror=1&hidenavigation=1&hidedevtools=1 -->

<script>
    import Square from "./Square.svelte";
    import Status from "./Status.svelte";
    import { getBoard, getWinner, isFull } from "../helpers/boardHelpers";
    import submitGameResult from "../../services/submitGameResult";
    import user from "../../stores/user"

    let player = "X";
    let start = true;
    let winner = null;
    let draw = false;
    let board = getBoard();
  
    const setValue = index => {
      board = board.map((value, i) => (index === i ? player : value));
      
      if (getWinner(board)) {
        winner = player;
        let status = "lose"
        
        if (winner == "X") {
          status = "win"
        }

        submitGameResult({gameStatus: status, userToken: $user.token })
        .catch(e => console.error(e))
      } else if (isFull(board)) {
        draw = true;
        submitGameResult({gameStatus: "draw", userToken: $user.token })
        .catch(e => console.error(e))
      } else {
        player = player === "X" ? "Y" : "X";

        if (player == "Y") {
          let openedPossitions = board.map((value, i) => value == "" ? i : null).filter(value => value != null);
          setValue(openedPossitions[Math.floor((Math.random() * openedPossitions.length))]);
        }
      }
    };
  
    const resetBoard = () => {
      winner = null;
      draw = false;
      start = false;
      board = getBoard(true);
      player = "X";
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


