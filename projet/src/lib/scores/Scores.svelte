<script>
  import {link} from 'svelte-spa-router';
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import {logout} from "../connection/Connection.svelte";


//Creating a function to recover the score-related data from the database
  const getScores = async () => {
      const response = await fetch(import.meta.env.VITE_URL_DIRECTUS + "items/Games?fields=*,player.first_name&sort=-score&limit=10");
      const json = await response.json();
      return json.data;
      }
</script>

<body>
  <div class="container">
<Header />
<main>
<section aria-label="Tableau des scores">
  <div class="guessWhatText">
      <h1>Guess What?</h1>
  </div>
  <div class="score-table">
      <h2>Tableau des scores</h2>
  
      <table>
        {#await getScores()}
        <p>En attente des scores</p>
        {:then Games}
        <tr class="tabDarkBlue">
            <td>Nom</td>
            <td>Score</td>
        </tr>
        {#each Games as game}
        <tr class="tabLight">
            <td>{game.player.first_name}</td>
            <td>{game.score}</td>
        </tr>
        {/each}
        {/await} 
      </table>  
    </div>   
</section>
<aside aria-label="menu de navigation">
  <div>
      {#if localStorage.getItem('token')} 
      <p>Username</p>
      <a href="/" use:link on:click={logout}> <span id="statusUser">Déconnecter</span></a>
      {/if}
  </div>
      <a href="/" use:link><img
              class="homeButton"
              src="../../src/assets/Bouton Retour Accueil.png"
              alt="Retour accueil"/></a>
              {#if !localStorage.getItem('token')}        
              <button><a href="/subscription" use:link class="aside-buttons">Inscription</a></button>
              <button><a href="/connection" use:link class="aside-buttons">Connexion</a></button>
              {/if}
      <a class="contact" href="/contact" use:link>Contact</a>
      <a class="contact" href="/about_us" use:link>À propos</a>
</aside>
<Footer />
</main>
</div>
</body>

<style>
/* SCORE PAGE */

div.score-table {
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
}

.score-table h2 {
text-align: center;
margin-bottom: 1rem; 
}

table {
margin: 1rem;
width: 90%;
border: 0.7rem var(--blue-outlines) solid;
border-radius: 0.9rem;
margin: 1.5rem 1rem;
}

.tabDarkBlue {
background-color: #083a38;
border: 2px solid #083a38;
padding: 1rem;
margin: 0px;
font-size: small;
text-align: center;
}

.tabDark {
background-color: #0d4240;
border: 2px solid #0d4240;
padding: 1rem;
margin: 0px;
font-size: small;
text-align: center;
}

.tabLight {
background-color: #0f4d4a;
border: 2px solid #0f4d4a;
padding: 1rem;
margin: 0px;
font-size: small;
text-align: center;
}

td {
  padding: 0.2rem;
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
      display:block;
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



  /*  Media queries version tablette  */
   @media (min-width: 426px) and (max-width: 768px) {

      .homeButton {
          display:block;
          max-width: 300px;
          margin: 0.5rem auto;
  }

  .tabDark {
      background-color: #0d4240;
      border: 2px solid #0d4240;
      padding: 7rem;
      margin: 0px;
      font-size: small;
      text-align: center;
}

.tabLight {
background-color: #0f4d4a;
border: 2px solid #0f4d4a;
padding: 7rem;
margin: 0px;
font-size: small;
text-align: center;
}

td {
  padding: 0.5rem;
}

   }

/*  media queries of desktop  */
@media (min-width: 769px) {

  main {
      grid-template-columns: 70% auto;
}
  td {
  padding: 0.5rem;
}

/* Styling the aside section containing the buttons for the homepage, log in, etc. */

aside {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

aside div {
margin: 1.9rem;
}

#statusUser {
  background-color: var(--orange-buttons);
  color: var(--blue-text);
  border-radius: 20px;
  padding: 5px;
  margin-left: none;
}

aside a {
  margin-top: 1.1rem;
}

/* Styling the homepage button */
.homeButton {
  max-width: 60%;
  display: block; 
}

/* Styling the remaining navigation buttons */

aside button {
  max-width: 250px;
}

aside a.contact{
  margin-top: 1rem;
  font-size: large;
}
}
</style>