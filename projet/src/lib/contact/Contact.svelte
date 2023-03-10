<script>
  import {link} from 'svelte-spa-router';
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import {logout} from "../connection/Connection.svelte";
  import {refreshPage} from "../random_game/Random_game.svelte";
  import Phone_call from "../../assets/phone_call.png";
  import At_symbol from "../../assets/At_symbol.png";
  import Twitter from "../../assets/twitter.png";
  import Accueil from "../../assets/Accueil.png"
</script>

<body>
  <div class="container">
    <Header />
    <main>
      <section aria-label="Contact">
        <div class="guessWhatText">
          <h1>Guess What ?</h1>
        </div>
        <div class="logoTitle">
          <h2>Restez en contact</h2>
          <p>
            Avez-vous des suggestions ou des commentaires à partager avec nous? Veuillez nous contacter aux coordonnées suivantes.
          </p>
          <div class="logo-container">
            <div class="logoImages">
              <img
                class="logoImagesPhone"
                src= {Phone_call}
                alt="logo de téléphone"/>
              <img
                class="logoImagesMail"
                src= {At_symbol}
                alt="logo email"/>
              <img
                class="logoImagesTwitter"
                src= {Twitter}
                alt="logo twitter"/>
            </div>
            <div class="logoText" aria-label="Coordonnées">
              <p>0612345678</p>
              <p>guesswhat@fake.com</p>
              <p>@GuessWhatGame</p>
            </div>
          </div>
        </div>
      </section>
      <aside aria-label="menu de navigation">
        <div>
    
          {#if localStorage.getItem('token')} 
          <p>Username</p>
          <a href="/contact" use:link on:click={logout} on:click={refreshPage}> <span id="statusUser">Déconnecter</span></a>
          {/if}
          
      </div>
        <a href="/" use:link><img
            class="homeButton"
            src= {Accueil}
            alt="button go back to the home page"/></a>
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
  /* Styling the aside section containing the buttons for the homepage, log in, etc. */

  /*Contact page*/

  h2 {
    padding-bottom: 30px;
  }

  .logoTitle {
    text-align: center;
    padding: 30px 30px;
    border-radius: 0.9rem;
    font-weight: bold;
    font-size: larger;
  }

  .logoTitle p {
    font-size: small;
    margin-bottom: 30px;
  }

  .logo-container {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .logoImages {
    display: flex;
    flex-direction: column;
  }

  .logoImages img {
    height: 30px;
    margin-right: 10px;
    margin-bottom: 10px;
    margin-top: 10px;
  }

  .logoText {
    display: flex;
    flex-direction: column;
  }

  .logoText p {
    height: 30px;
    margin-bottom: 10px;
    margin-top: 10px;
    padding-top: 5px;
    font-size: medium;
    text-align: start;
  }

  p {
    line-height: 1.5rem;
  }

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

  /*  Media queries version tablette  */
  @media (min-width: 426px) and (max-width: 768px) {
    .homeButton {
      max-width: 300px;
    }
  }

  /*  Media queries for desktop version */
  @media (min-width: 769px) {

 /*Contact page*/

  .logoTitle p {
    font-size: medium;
  }

  .logoImages img {
    height: 60px;
  }

  .logoText {
    display: flex;
    flex-direction: column;
  }

  .logoText p {
    height: 60px;
    padding-top: 20px;
    font-size: large;

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
    }

    aside a.contact {
      text-align: center;
      margin-top: 1rem;
      font-size: large;
    }
  }
</style>
