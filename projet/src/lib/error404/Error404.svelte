<script>
  import {link} from 'svelte-spa-router';
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import {logout} from "../connection/Connection.svelte";
  import {refreshPage} from "../random_game/Random_game.svelte";
  import Accueil from "../../assets/Accueil.png";
  import Mascotte_404 from "../../assets/Mascotte_404.png";
</script>

<body>
  <div class="container">
    <Header />
    <main>
      <section aria-label="Page d'erreur">
        <div class="guessWhatText">
          <h1>Guess What ?</h1>
        </div>
        <div class="text404">
          <h2>La page que vous avez demandée n'existe pas</h2>
          <img class="image404" src={Mascotte_404} alt="Mascotte d'erreur si la page n'existe pas"/>
        </div>
      </section>
      <aside aria-label="menu de navigation">
        <div>
          {#if localStorage.getItem('token')} 
          <p>Username</p>
          <a href="/" use:link on:click={logout} on:click={refreshPage}> <span id="statusUser">Déconnecter</span></a>
          {/if}
        </div>
        <a href="/" use:link><img
                class="homeButton"
                src={Accueil}
                alt="Retour accueil"/></a>
        {#if !localStorage.getItem('token')}        
        <button><a href="/subscription" use:link class="aside-buttons">Inscription</a></button>
        <button><a href="/connection" use:link class="aside-buttons">Connexion</a></button>
        {/if}
        <button><a href="/scores" use:link class="aside-buttons">Scores</a></button>
        <a class="contact" href="/contact" use:link>Contact</a>
        <a class="contact" href="/about_us" use:link>À propos</a>
      </aside>
      <Footer />
    </main>
  </div>
</body>

<style>

  /*404 page*/

  .text404 {
    text-align: center;
    padding: 10% 10%;
    margin-left: auto;
    font-size: xx-small;
  }

  .text404 h2 {
    margin-bottom: 50px;
  }

  .image404 {
    width: 200px;
  }

/* Styling the aside section containing the buttons for the homepage, log in, etc. */
  aside {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

  aside div {
    display: flex;
    margin: 1rem;
  }

  #statusUser {
        background-color: var(--orange-buttons);
        color: var(--blue-text);
        border-radius: 20px;
        padding: 5px;
        margin-left: 1rem;
    }

  aside a {
    text-decoration: none;
    color: var(--text-color);
  }

  .aside-buttons {
    color: var(--blue-text);
  }

  /* Styling the homepage button */
  .homeButton {
    display: block;
    max-width: 80%;
    margin: 0.5rem auto;
  }

  /* Styling the remaining navigation buttons */

  aside button {
    display: block;
    max-width: 100%;
    padding: 1rem;
    background-color: var(--bg-buttons);
    color: var(--blue-text);
    font-weight: bolder;
    border: 0.7rem var(--orange-buttons) solid;
    border-radius: 0.9rem;
    margin: 0.5rem;
    font-family: "Mentimun";
    font-size: 150%;
  }

  aside a.contact {
    display: block;
    max-width: 50%;
    text-align: center;
    margin-top: 0.5rem;
    font-size: medium;
  }

  /*  Media queries tablet version  */
  @media (min-width: 426px) and (max-width: 768px) {

    .text404 {
    font-size: medium;
  }

  .image404 {
    width: 350px;
  }

    .homeButton {
      max-width: 300px;
    }
  }

  /*  media queries desktop version  */
  @media (min-width: 769px) {

    .text404 {
      text-align: center;
      padding: 10% 10%;
      margin-left: auto;
      font-size: medium;
  }

  .text404 h2 {
    margin-bottom: 50px;
  }

  .image404 {
    width: 500px;
  }

    aside div {
      margin: 1.9rem;
    }

    aside a {
      margin-top: 1.1rem;
    }

    #statusUser {
        background-color: var(--orange-buttons);
        color: var(--blue-text);
        border-radius: 20px;
        padding: 5px;
        margin-left: none;
    }

    /* Styling the homepage button */
    .homeButton {
        max-width: 45%;
}

    /* Styling the remaining navigation buttons */

    aside button {
      max-width: 250px;
      margin: 2rem;
      font-size: 150%;
    }

    aside a.contact {
      max-width: 50%;
      text-align: center;
      margin-top: 1rem;
      font-size: large;
    }
  }
</style>
