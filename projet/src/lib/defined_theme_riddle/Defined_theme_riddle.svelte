<script>
  import {link} from 'svelte-spa-router';
  import {onMount} from 'svelte';
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";

  //Creating an empty array to recover all riddles
  let riddles = [];
 
  //Recovering the route parameters so that a user can get riddles related only to a specific theme via the URL and the theme links
  export let params = {};
  

  // Creating a variable representing  a selected riddle
  let selectedRiddle = null;

  // Using onMount() from Svelte to recover data from the data base
  //onMount runs after the component is rendered to the DOM
  onMount(async () => {
    //Creating the request allowing us to recover riddles based on a specific theme
    const response = await fetch(import.meta.env.VITE_URL_DIRECTUS + 'items/Riddle?fields=name&filter[theme_id]=' + params.themeId);
    let promise = await response.json();
    riddles = promise.data;
    //Code allowing us to recover a random riddle from the riddles array
    selectedRiddle = riddles[Math.floor(Math.random() * riddles.length)]
    
  });

  //Function allowing the page to reload when clicking one of the theme buttons, giving a riddle to the user
  function refreshPage(){
    window.location.reload();
} 

</script>

<body>
<div class="container">
<Header />
<main  class="defined-theme-game">
<section id="defined-theme">
  <div class="guessWhatText">
      <h1>Guess What ?</h1>
      {#if selectedRiddle}
      <p>{selectedRiddle.name}</p>
      {/if}
      <p>
          <!-- Congratulations message or losing message appearing here -->
      </p>
  </div>
  <div class="hints">
      <p class="clueLight">Indice 1</p>
      <p class="clueDark">Indice 2</p>
      <p class="clueLight">Indice 3</p>
      <p class="clueDark">Indice 4</p>
      <p class="clueLight">Indice 5</p>
      <p class="clueDark">Indice 6</p>
  </div>
  <div class="hints-button">
  <button>Demandez un indice</button>
</div>
<form action="#" method="post" id="responseForm">
  <div class="gamer-response">
      <div>
          <textarea name="response" id="response" placeholder="Réponses"></textarea>
      </div>
      <div class="response-buttons">
          
          <button>Valider</button>
      </div>
  </div>
  <div class="score">
      <p>Score:</p>
      <p>952</p>
  </div>
  
</section>
<nav>
      <a href="/defined_theme_riddle/1" use:link on:click={refreshPage} on:click={onMount}><img src=".../../src/assets/Mascotte Thème Animaux.png" alt="Mascot for animal riddle theme"></a> 
      <a href="/defined_theme_riddle/2" use:link on:click={refreshPage} on:click={onMount}><img src=".../../src/assets//Mascotte Thème Cinéma.png" alt="Mascot for cinema riddle theme"></a>
      <a href="/defined_theme_riddle/3" use:link on:click={refreshPage} on:click={onMount}><img src=".../../src/assets//Mascotte Thème Musique.png" alt="Mascot for music riddle theme"></a>
  
</nav>
<aside>
  <div>
      <p>Username</p>
      <a href="/connection" use:link> <span id="statusUser" >Déconnecter</span></a>
  </div>
      <a href="/" use:link><img class="homeButton" src=".../../src/assets//Bouton Retour Accueil.png" alt="button go back to the home page"></a>
      <button><a href="/subscription" use:link class="aside-buttons">Inscription</a></button>
      <button><a href="/connection" use:link class="aside-buttons">Connexion</a></button>
      <button><a href="/scores" use:link class="aside-buttons">Scores</a></button>
      <a class="contact" href="/contact" use:link>Contact</a>
      <a class="contact" href="/about_us" use:link>À propos</a>
</aside>
<Footer />
</main>
</div>
</body>

<style>
  /* DEFINED THEME GAME PAGE*/

  body {
width: 98vw;
}

.guessWhatText p {
  text-align: center;
}

section#defined-theme {
border: 0.7rem var(--blue-outlines)solid;
margin-top: -0.7rem;
margin-left: -0.7rem;
margin-right: -0.7rem;
padding-bottom: 0.7rem;
border-radius: 0.9rem;
text-align: center;
}


div.hints {
text-align: center;
border: 0.7rem var(--blue-outlines)solid;
border-radius: 0.9rem;
margin: 1.5rem auto;
width: 250px;
}
div.gamer-response {
width: 250px;
display: block;
margin: 1rem auto;
justify-content: center; 
}

textarea {
border-radius: 0.5rem;
padding: 1rem;
width: 100%;
height: 75px;
resize: none;
}

.hints-button button {

margin-bottom: 5px;
width: 250px;
padding: 1rem;
background-color: #0f4d4a;
border: 0.7rem var(--blue-outlines)solid;
color: var(--text-color);
font-weight: bolder;
border-radius: 0.9rem;
font-family: 'Mentimun';
font-size: 50%;   
text-align: center;
}

.response-buttons button {
display: block;
margin-top: 20px;
margin-bottom: 5px;
width: 100%;
padding: 1rem;
background-color: var(--orange-buttons);
border: 0.7rem var(--blue-outlines)solid;
color: var(--blue-text);
font-weight: bolder;
border-radius: 0.9rem;
font-family: 'Mentimun';
font-size: 75%;   
}

div.score {
display: flex;
justify-content: center;
}

nav {
display: flex;
justify-content: center;
width: 100%;

}

nav img {
width: 100%;
background-color: var(--bg-images);
border: var(--blue-outlines) solid 5px;
border-radius: 10px;
margin-top: -0.7rem;
min-width: 20px;
}

nav img:hover {
background-color: var(--bg-buttons);
}

.clueDark {
background-color: #0d4240;
border: 2px solid #0d4240;
padding: 0.5rem;
margin: 0px;
font-size: x-small;
}

.clueLight {
background-color: #0f4d4a;
border: 2px solid #0f4d4a;
padding: 0.5rem;
margin: 0px;
font-size: x-small;
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

  aside a.contact {
      display: block;
      max-width: 50%;
      text-align: center;
      margin-top: 0.5rem;
      font-size: medium;
  }


   /*  Media queries version tablette  */
   @media (min-width: 426px) and (max-width: 768px) {

    div.hints {
width: 50%;
}

div.gamer-response {
width: 50%;
}

.hints-button button {
font-size: 100%;   
color: var(--text-color);
}

.response-buttons button {
font-size: 200%;   
}

nav {
display: flex;
justify-content: space-around;
width: 100%;
}

nav a {
text-align: center;
}



nav img {
margin-top: -0.3rem;
width: 50%;
min-width: 50px;

}

.clueDark {
padding: 1rem;
margin: 0px;
font-size: medium;
}

.clueLight {
padding: 1rem;
margin: 0px;
font-size: medium;
}

.homeButton {
    display:block;
      max-width: 300px;
      margin: 0.5rem auto;

  }

   }



     /*  media queries of desktop  */
@media (min-width: 769px) {

/* DEFINED THEME GAME PAGE*/

h1 {
  font-size: 3rem;
}

p {
  font-size: medium;
}

.defined-theme-game {
display: grid;
grid-template-columns: 55% auto auto;
}

section#defined-theme {
  margin-right: none;
  padding-bottom: none;
  padding: 1rem;
}


div.hints {
  width: 60%;
}
div.gamer-response {
  width: 50%;
  display: flex;
}

textarea {
border-radius: 0.5rem;
padding: 1rem;
width: 200px;
height: 150px;
resize: none;
}

.hints-button button {
margin: 0 0 2rem 0.8rem;
color: var(--text-color);
font-size: 100%;   
}

.response-buttons button {
margin: 2rem 0 2rem 0.8rem;
color: var(--blue-text);
font-size: 125%;   
}


nav {
  flex-direction: column;
  justify-content:flex-start;
  align-items: flex-start;

}

nav img {
  margin-left: 0.35rem;
  margin-top: -5px;
  width: 30%;
  min-width: 100px;
}



.clueDark {
  padding: 1rem;
  font-size: medium;
}

.clueLight {
  padding: 1rem;
  font-size: medium;
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
margin-top: -15rem;
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
  min-width: 200px;
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