<script>
  import { link } from "svelte-spa-router";
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import { logout } from "../connection/Connection.svelte";
  import { refreshPage } from "../functions/Functions.svelte";
  import Accueil from "../../assets/Accueil.png";

  //Creating a variable loggedInUsername to recover its value from local storage and display it when user is connected.
  let loggedInUsername = localStorage.getItem("name");

let divUserName;
</script>

<body>
  <div class="container">
    <Header />
    <main>
      <section class="leftBlock" aria-label="Á propos">
        <div class="guessWhatText">
          <h1>Guess What ?</h1>
        </div>
        <div class="aboutTitle">
          <h2>Á propos</h2>
        </div>
        <div class="aboutText">
          <h3>Qui sommes nous</h3>
          <p>
            Nous sommes trois développeurs web qui avons créé ce projet dans le
            cadre de notre formation avec l'école O'clock.
          </p>
          <h3>Notre projet</h3>
          <p>
            Nous avons choisi de travailler sur ce projet car l'idée d'un jeu
            d'énigmes serait amusante et stimulante et nous permettrait
            d'explorer notre côté créatif.
          </p>
        </div>
      </section>
      <aside aria-label="menu de navigation">
        <div bind:this={divUserName}>
          {#if localStorage.getItem("token")}
            <p>{loggedInUsername}</p>
            <a
              href="/connection"
              use:link on:click={() => { refreshPage(); logout(); }}>
              <span id="statusUser">Déconnecter</span></a
            >
          {/if}
        </div>
        <a href="/" use:link
          ><img class="homeButton" src={Accueil} alt="Retour accueil" /></a
        >
        {#if !localStorage.getItem("token")}
          <button
            ><a href="/subscription" use:link class="aside-buttons"
              >Inscription</a
            ></button
          >
          <button
            ><a href="/connection" use:link class="aside-buttons">Connexion</a
            ></button
          >
        {/if}
        <button
          ><a href="/scores" use:link class="aside-buttons">Scores</a></button
        >
        <a class="contact" href="/contact" use:link>Contact</a>
        <a class="contact" href="/about_us" use:link>À propos</a>
      </aside>
      <Footer />
    </main>
  </div>
</body>

<style>
  /*About_us page*/
  .aboutTitle {
    text-align: center;
    font-size: large;
    margin-bottom: 50px;
  }

  .aboutText {
    text-align: center;
  }

  .aboutText h3 {
    margin-top: 50px;
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

  .aside-buttons {
    color: var(--blue-text);
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
    .homeButton {
      max-width: 300px;
    }
  }

  /*  Media queries desktop version  */
  @media (min-width: 769px) {
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
