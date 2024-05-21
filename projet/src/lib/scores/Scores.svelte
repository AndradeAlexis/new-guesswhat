<script>
  import { link } from "svelte-spa-router";
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import { logout } from "../connection/Connection.svelte";
  import { refreshPage } from "../functions/Functions.svelte";
  import Accueil from "../../assets/Accueil.png";
  
   //Import the "getScoresByTheme" function from "db.js" file.
  import { getScoresByTheme } from '../../db';

 //Import the "getAllGames" function from "db.js" file.
  import { getAllGames} from '../../db';

 // Import the "onMount" function from the "svelte" library.
  import { onMount } from "svelte";
  
  
  // Creating a variable loggedInUsername to recover its value from local storage and display it when user is connected.
  let loggedInUsername = localStorage.getItem("name");
  
  // Variable to display the name of the user.
  let divUserName;
  
  // Creating an empty array to recover score-related data from the data base.
  let themeScores = [];
  
  // Creating a variable to target <table> to be displayed when a user chooses to filter scores by theme.
    let table;
    
    // Creating a variable to target the <table> containing random scores (no theme chosen by user) by default.
      let tableRandom;
      
      
      // Use onMount to perform operations when the Svelte component is mounted in the DOM.
      onMount(async () => {
        // Async function to get the score by theme or all the games.
        const scores = await getScoresByTheme();
        const AllGames = await getAllGames();
        
      });
      
      // Asyn function which allows you to obtain the score of the games recorded with the theme music.
      const scoreThemeMusic = async () => {
        themeScores = await getScoresByTheme(3); 
        
        // Removing class selectedTheme so that table with filtered scores can be visible to user when selecting a theme.
        table.classList.remove("selectedTheme");
        tableRandom.style.display = "none";
      };
      
      // Asyn function which allows you to obtain the score of the games recorded with the theme Cinema.
      const scoreThemeCinema = async () => {
        themeScores = await getScoresByTheme(2); 
        
        // Removing class selectedTheme so that table with filtered scores can be visible to user when selecting a theme.
        table.classList.remove("selectedTheme");
        tableRandom.style.display = "none";
      };
      
      // Asyn function which allows you to obtain the score of the games recorded with the theme Animals.
      const scoreThemeAnimals = async () => {
        themeScores = await getScoresByTheme(1); 
        
        // Removing class selectedTheme so that table with filtered scores can be visible to user when selecting a theme.
        table.classList.remove("selectedTheme");
        tableRandom.style.display = "none";
      };
      
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
          <div class="dropdownMain">
            <div class="dropdownThemes">
              <p>Filtrer les scores par thème :</p>
              <a href="/scores/1" use:link on:click={scoreThemeAnimals}
                >Animaux</a
              >
              <a href="/scores/2" use:link on:click={scoreThemeCinema}>Cinéma</a
              >
              <a href="/scores/3" use:link on:click={scoreThemeMusic}>Musique</a
              >
              <a href="/scores" use:link on:click={getAllGames()}>Tous les thèmes</a
              >
            </div>
          </div>

          <!-- Table to display by default (no theme selected) when user arrives on score page -->
          <table bind:this={tableRandom}>
            {#await getAllGames()}
              <p>En attente des scores</p>
            {:then Games}
              <tr class="tabDarkBlue">
                <td>Nom</td>
                <td>Score</td>
              </tr>
              {#each Games as game}
                <tr class="tabLight">
                  <td>{game.name}</td>
                  <td>{game.score}</td>
                </tr>
              {/each}
            {/await}
          </table>
<!-- Table to display if a user filters scores by theme -->
<table class="selectedTheme" bind:this={table}>
  {#await getScoresByTheme()}
  <p>En attente des scores</p>
  {:then scores}
  <tr class="tabDarkBlue">
    <td>Nom</td>
    <td>Score</td>
  </tr>
  <!-- We use {#if themeScores.length > 0} to check if themeScores contains any scores. If the length
    of themeScores is greater than 0, it means that scores are available for the selected theme. -->
  {#if themeScores.length > 0}
    {#each themeScores as score}
      <tr class="tabLight">
        <td>{score.name}</td>
        <td>{score.score}</td>
      </tr>
    {/each}
  {:else}
    <p>Pas de scores disponibles</p>
  {/if}
  {/await}
</table>




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
        <a class="contact" href="/contact" use:link>Contact</a>
        <a class="contact" href="/about_us" use:link>À propos</a>
      </aside>
      <Footer />
    </main>
  </div>
</body>

<style>
  /* SCORE PAGE */

  .dropdownThemes {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .dropdownThemes a {
    margin-right: 1rem;
    color: var(--text-color);
  }

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

  .selectedTheme {
    display: none;
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

  .filter {
    margin-bottom: 5px;
    padding: 0.2rem;
    background-color: #0f4d4a;
    border: 0.2rem var(--blue-outlines) solid;
    color: var(--text-color);
    font-weight: bolder;
    border-radius: 0.4rem;
    font-size: 100%;
    text-align: center;
  }

  .filter:hover {
    background-color: var(--text-color);
    color: var(--blue-outlines);
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

  /*  Media queries version tablette  */
  @media (min-width: 426px) and (max-width: 768px) {
    .homeButton {
      display: block;
      max-width: 300px;
      margin: 0.5rem auto;
    }

    .tabDarkBlue {
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
      display: flex;
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

    aside a.contact {
      margin-top: 1rem;
      font-size: large;
    }
  }
</style>
