<script>
  import {link} from 'svelte-spa-router';
  import Logo from "../../assets/Logo.png";
</script>

<header>
  <a href="/" use:link><img src={Logo} class="main-logo" alt="Logo du site Guess What ?"/></a>
</header>

<style>
  header {
    text-align: center;
    height: 200px;
  }

  header img {
    max-width: 200px;
    transition: all .2s ease-in-out;
  }

  header img:hover {
        transform: scale(1.2);
    }
</style>
