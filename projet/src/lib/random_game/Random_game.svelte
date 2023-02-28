<script>
    import {link} from 'svelte-spa-router';
    import Header from "../homepage/Header.svelte";
    import Footer from "../homepage/Footer.svelte";

    //Creating a variable allowing us to get a random number from 1 to 17.

    let id = [Math.floor(Math.random() * 17)];
    
    //Creating an array to recuperate the hints for the riddles

    let hints = [];
    // Creating a variable to pass to the hints array.

    let hintId = 0;

    // Declaring a variable to recover the div element containing the hints

    let divHints ;

    //Creating a variable for the user's response
    let response;

    //Creating an array to recuperate from the data base the correct answers to a riddle 
    let riddleResponse = [];

    let riddleResponseId = 0;

    //Async function allowing us to fetch randomly the name of a riddle.

    const get_riddles = async () => {
        const response = await fetch(import.meta.env.VITE_URL_DIRECTUS + "items/Riddle/?fields=name,id&filter[id]=" + id);
        const json = await response.json();
        return json.data;
        }

    //Async function to fetch indexes related to a riddle.

    const get_hints = async () => {
        const response = await fetch(import.meta.env.VITE_URL_DIRECTUS + "items/Clue/?fields=name,id&filter[riddle_id]=" + id);
        const json = await response.json();
        hints = json.data;
        }

    //Async function to fetch the response related to a riddle.

    const get_riddleAnswer = async () => {
      const response = await fetch(import.meta.env.VITE_URL_DIRECTUS + "items/Riddle/?fields=answer,id&filter[id]=" + id);
        const json = await response.json();
        riddleResponse = json.data;
        console.log (riddleResponse);
    }

    get_riddleAnswer();

    //Creating a function to handle the display of hints (one hint at a time)

       function displayHint() {
        const child = document.createElement('p');
        child.classList.add("clueLight");

        // Changing the background color of the div where hints are displayed
        hintId%2 ? child.style.backgroundColor =  "#0f4d4a" : child.style.backgroundColor =  "#0d4240";
        child.textContent = hints[hintId].name;
        divHints.appendChild(child);
        
        // hintId is incremented by 1
        hintId ++;
        if( hintId >= hints.length) {
          alert("Attention, ceci est ton dernier indice!");
        }
       }

       //Creating a function to empty the text area after userResponse submission
       function handleClick() {
        console.log(response)
        
       }

       //Creating a function to handle the submission button
       const handleSubmitForm = async (event) => {
        event.preventDefault();
        if (response === riddleResponse[riddleResponseId].answer) {
          console.log("You win");
        } else {
          console.log("Try again");
        }
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
      <div class="hints" bind:this={divHints}>
        {#await get_hints()}
          <p>Waiting for hints to display</p>
        {/await}
      </div>
      <form action="#" method="post" id="responseForm" on:submit={handleSubmitForm}>
        <div class="gamer-response">
           
           <!-- <div>
  {#if response.value === riddleResponse} 
  <p>Bonne réponse</p>
  <textarea name="response" id="response" placeholder="Réponses" bind:value={response}></textarea>
  {:else}
  <p>Essaye encore</p>
  {/if}
</div> -->
            <div>
                <textarea name="response" id="response" placeholder="Réponses" bind:value={response}></textarea>
            </div>
            <div class="response-buttons">
                <button on:click={displayHint}>Demandez un indice</button>
                <button on:click={handleClick}>Valider</button>
            </div>
        </div>
    </form>
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