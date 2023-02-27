<script>
    import {link} from 'svelte-spa-router';
    import Header from "../homepage/Header.svelte";
    import Footer from "../homepage/Footer.svelte";

    //Creating a variable allowing us to get a random number from 1 to 17.

    let id = [Math.floor(Math.random() * 17)];

    //Creating a variable that allows us to match the id of a riddle with the corresponding clue id.

    let clue_id = id;

    //Async function allowing us to fetch randomly the name of a riddle.

    const get_riddles = async () => {
        const response = await fetch(import.meta.env.VITE_URL_DIRECTUS + "items/Riddle/?fields=name,id&filter[id]=" + id);
        const json = await response.json();
        return json.data;
        }

    //Async function to fetch indexes related to a riddle.

    const get_indexes = async () => {
        const response = await fetch(import.meta.env.VITE_URL_DIRECTUS + "items/Clue/?fields=name,id&filter[riddle_id]=" + clue_id);
        const json = await response.json();
        return json.data;
        }

  function handleClick() {
    
  }

</script>

<body>
    <div class="container">
  <Header />
  <main  class="random-theme-game">
  <section id="random-theme">
      <div class="guessWhatText">
          <h1>Guess What ?</h1>
          {#await get_riddles()}
          <p>Waiting for riddles to display</p>
          {:then Riddle}
          {#each Riddle as riddle}
          <p>{riddle.name}</p>
          {/each}
          {/await}
            <p>
              <!-- Congratulations message or losing message appearing here -->
          </p>
      </div>
      <div class="hints">
        {#await get_indexes()}
          <p>Waiting for indexes to display</p>
        {:then Clue}
        {#each Clue as clue, i}
          <p class="clueLight">{i+1 + ")"} {clue.name}</p>
          <!-- <p class="clueDark"> {clue.id}</p>
          <p class="clueLight">{clue.name}</p>
          <p class="clueDark">{clue.name}</p>
          <p class="clueLight">{clue.name}</p>
          <p class="clueDark">{clue.name}</p> -->
      {/each}
      {/await}
      </div>
      <div class="gamer-response">
          <div>
              <textarea name="response" id="response" placeholder="Réponses"></textarea>
          </div>
          <div class="response-buttons">
              <button on:click={handleClick}>Demandez un indice</button>
              <button>Valider</button>
          </div>
      </div>
      <div class="score">
          <p>Score:</p>
          <p>952</p>
      </div>
      
  </section>
 
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
  
  
  
  section#random-theme {
    border: 0.7rem var(--blue-outlines)solid;
    margin-top: -0.7rem;
    margin-left: -0.7rem;
    margin-right: -0.7rem;
    padding-bottom: 00.7rem;
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
  }
  
  
  .response-buttons button {
    display: block;
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
  
  .response-buttons button {
    font-size: 100%;   
  }
  

  
  .clueDark {
    padding: 1rem;
    margin: 0px;
    font-size: medium;
  }
  
  .clueLight {
    background-color: #0f4d4a;
    border: 2px solid #0f4d4a;
    padding: 0.5rem;
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
  
  /* RANDOM THEME GAME PAGE*/
  
h1 {
    font-size: 3rem;
}

p {
    font-size: medium;
}

  .random-theme-game {
  display: grid;
  grid-template-columns: 55% auto;
}


section#random-theme {
      margin-right: none;
      padding-bottom: none;
      padding: 1rem;
  }
  
  
div.hints {
    width: 80%;
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
}

.response-buttons button {
    margin: 0 0 2rem 0.8rem;
    color: var(--blue-text);
    font-size: 125%;   
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
    max-width: 300px;
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