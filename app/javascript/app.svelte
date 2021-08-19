<script>
  import { Router, Route } from "svelte-routing";

  import LoginUser from "./pages/LoginUser.svelte";
  import Game from "./pages/Game.svelte";
  import GameWins from "./pages/GameWins.svelte";
  import Navbar from "./components/Navbar.svelte";
</script>

<Router> 
  <Navbar />

  <Route path="/" component={Game} />
  <Route path="/login" component={LoginUser} />
  <Route path="/scores" component={GameWins} />

</Router>
