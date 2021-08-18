<script>
  import { Router, Route } from "svelte-routing";

  import LoginUser from "./pages/LoginUser.svelte";
  import Game from "./pages/Game.svelte";
  import Navbar from "./components/Navbar.svelte";
</script>

<Router> 
  <Navbar />

  <Route path="/" component={LoginUser} />
  <Route path="/game" component={Game} />
  <Route path="/login" component={LoginUser} />

</Router>
