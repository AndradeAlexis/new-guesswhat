<script>
  import {link} from 'svelte-spa-router';
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";

  //Creating a variable allowing us to get a random number from 1 to 17.

  let id = [Math.floor(Math.random() * 22)];
  
  //Creating an array to recuperate the hints for the riddles

  let hints = [];

  // Creating a variable to pass to the hints array.

  let hintId = 0;

  // Declaring a variable to recover the div element containing the hints

  let divHints;

  //Creating a variable for the user's response

  let response;
 
  //Creating an array to recuperate from the data base the correct answers to a riddle 
  let riddleResponse = [];

  let riddleResponseId = 0;

  //Declaring a variable for message of victory/defeat

  let divMessage;

  //Async function allowing us to fetch a random riddle.

  const getRiddles = async () => {
      const response = await fetch(import.meta.env.VITE_URL_DIRECTUS + "items/Riddle/?fields=name,id&filter[id]=" + id);
      const json = await response.json();
      return json.data;
      }

  //Async function to fetch hints related to a riddle.

  const getHints = async () => {
      const response = await fetch(import.meta.env.VITE_URL_DIRECTUS + "items/Clue/?fields=name,id&filter[riddle_id]=" + id);
      const json = await response.json();
      hints = json.data;
      }

  //Async function to fetch the response related to a riddle.

  const getRiddleAnswer = async () => {
      const response = await fetch(import.meta.env.VITE_URL_DIRECTUS + "items/Riddle/?fields=answer,id&filter[id]=" + id);
      const json = await response.json();
      riddleResponse = json.data;
      console.log(riddleResponse);
  }

  getRiddleAnswer();

  //Creating a function to handle the display of hints (one hint at a time)

     function displayHint() {

        //Creating a <p> element for hints display
        const child = document.createElement('p');

        // Changing the background color of the div where hints are displayed
        hintId%2 ? child.style.backgroundColor =  "#0f4d4a" : child.style.backgroundColor =  "#0d4240";
        child.textContent = hints[hintId].name;
        child.style.padding = "1rem"
        child.style.margin = "0"
        //Adding the <p> element to the div
        divHints.appendChild(child);
        
        // hintId is incremented by 1
        hintId ++;

        //Condition alerting the user that he's running out of hints to request
        if( hintId >= hints.length) {
          alert("Attention, ceci est ton dernier indice!");
        }
     }

     //Creating a function to handle the submission button and a condition showing a message of victory/defeat to the user
     const handleSubmitForm = async (event) => {
      event.preventDefault();

      //Creating a condition to stop adding a child element
      if (divMessage.hasChildNodes()) {
        divMessage.removeChild(divMessage.children[0]);
      }

      //If user submits the correct answer, the corresponding image is displayed
      const message = document.createElement('img');
      if (response == riddleResponse[riddleResponseId].answer) {
        message.src = '../../src/assets/victory.png';
        message.style.width = "30%";
        message.style.margin = "auto auto";
        divMessage.appendChild(message);
       
      //If user does not submit the correct answer, game over message is displayed
      } else {
        message.src = '../../src/assets/game-over.png';
        message.style.width = "30%";
        message.style.margin = "auto auto";
        divMessage.appendChild(message); 
      }

      console.log(response);

      //Emptying the text area after submission
      event.target.reset();
    }
    
    //Creating the variables for the score calculation 
      let result = 1000;
      let score = 1000;
      let numberAttempt = 0;
      let clueReveal = 0;
     
    //Creating a counter incrementing the number of attempts
    const incrementTries = () => {
        numberAttempt += 1;
    }

    //Creating a counter incrementing the number of hints
    const incrementHints = () => {
      clueReveal += 1;
    }
    
    //Creating the function for score calculation
    const getScores = () => {
            //Score calculation taking into account the number of tries and the number of hints a user requests
            result = (score) - ((numberAttempt * 5) + (clueReveal * 10));
            //Condition so that score does not fall below 0
            if (result < 0) result = 0;
            //Correcting score when user gives the correct answer from the beginning.
            if(response === riddleResponse[riddleResponseId].answer) {
              result += 5;
            }
    }

     //Function allowing the page to reload when clicking one of the theme buttons, giving a riddle to the user
     function refreshPage(){
      window.location.reload();
  } 
</script>

<body>
  <div class="container">
    <Header />
    <main  class="random-theme-game">
      <div class="background-game">
        <section id="random-theme" aria-label="Jeu à thème aléatoire">
              <div class="guessWhatText">
                  <h1>Guess What ?</h1>
                  {#await getRiddles()}
                  <p>En attente d'une devinette</p>
                  {:then Riddle}
                  {#each Riddle as riddle}
                  <p>{riddle.name}</p>
                  {/each}
                  {/await}
                  <div class="message" bind:this={divMessage}>
                      <!-- Congratulations message or game over message appearing here -->
                  </div>
              </div>
              <div class="hints" bind:this={divHints}>
                {#await getHints()}
                  <p>Les indices s'afficheront ici</p>
                {/await}
              </div>
              <div class="hints-button">
                <button on:click={displayHint} on:click={incrementHints} on:click={getScores}>Demandez un indice</button>
              </div>
              <form action="#" method="post" id="responseForm" on:submit={handleSubmitForm} on:submit={getScores}>
                <div class="gamer-response">
                    <div>
                        <textarea name="response" id="response" placeholder="Réponses" bind:value={response} aria-label="Votre réponse"></textarea>
                    </div>
                    <div class="response-buttons">
                        <button on:click={incrementTries}>Valider</button>
                    </div>
                </div>
              </form>
              <div class="score" aria-label="Affichage du score">     
                  Score : {result}
              </div>
        </section>
      </div>
      <nav>
        <a href="/random_theme_riddle" use:link on:click={refreshPage}><img src=".../../src/assets/Mascotte Refresh.png" alt="Mascotte pour relancer le jeu"></a>
      </nav>
      <aside aria-label="menu de navigation">
         <div>
            <p>Username</p>
            <a href="/connection" use:link> <span id="statusUser" >Déconnecter</span></a>
          </div>
            <a href="/" use:link><img class="homeButton" src=".../../src/assets//Bouton Retour Accueil.png" alt="Retour accueil"></a>
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

.message {
  display: flex;
  flex-direction: column;
}

#random-theme {
  background-image: url(../../src/assets/backgroundgame.png);
  background-size: 40%;
  background-repeat: repeat;
  background-position: center;
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
  background-color: var(--bg-buttons);
  border: 0.7rem var(--blue-outlines)solid;
  border-radius: 0.9rem;
  padding: 1rem;
  width: 100%;
  height: 75px;
  resize: none;
  text-align: center;
  font-weight: bold;
}

::placeholder {
  color: var(--blue-text);
  text-align: center;
  font-weight: normal;
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

.hints-button button:hover {
  background-color: var(--text-color);
  color: var(--blue-outlines);
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

.response-buttons button:hover {
  border: 0.7rem var(--bg-buttons)solid;
}

div.score {
  display: flex;
  justify-content: center;
}

nav {
  display: flex;
  justify-content: center;
  text-align: center;
  width: 100%;
}

nav img {
  width: 30%;
  background-color: var(--bg-images);
  border: var(--blue-outlines) solid 5px;
  border-radius: 10px;
  margin-top: -0.7rem;
  min-width: 20px;
}

nav img:hover {
  background-color: var(--bg-buttons);
  animation: tilt-shaking 0.3s infinite;
}

@keyframes tilt-shaking {
  0% { transform: rotate(0deg); }
  25% { transform: rotate(5deg); }
  50% { transform: rotate(0deg); }
  75% { transform: rotate(-5deg); }
  100% { transform: rotate(0deg); }
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
  grid-template-columns: 55% auto auto;
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
  border-radius: 0.9rem;
  padding: 1rem;
  width: 200px;
  height: 78px;
  resize: none;
}

.hints-button button {
  margin: 0 0 2rem 0.8rem;
  color: var(--text-color);
  font-size: 100%;   
}

.response-buttons button {
margin: 0rem 0 2rem 0.8rem;
  color: var(--blue-text);
  font-size: 125%;   
}

nav {
  flex-direction: column;
  justify-content:flex-start;
  align-items: flex-start;
  text-align: start;
}

nav img {
  margin-left: 0.35rem;
  margin-top: -5px;
  width: 20%;
  min-width: 100px;
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