<script>
  import { link } from "svelte-spa-router";
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import { logout } from "../connection/Connection.svelte";
  import { isNotValidAnswer } from "../functions/Functions.svelte";
  import Mascotte_Refresh from "../../assets/Mascotte_Refresh.png";
  import Accueil from "../../assets/Accueil.png";
  import Victory from "../../assets/victory.png";
  import Game_over from "../../assets/game_over.png";
  import Background_game from "../../assets/Background_game.png";
  
  
  
  // Import the 'getRiddles' function from the 'db.js' file.
  import { getRiddles} from '../../db';
  
  // Import the 'getAllRiddlesAnswer' function from the 'db.js' file
  import { getAllRiddlesAnswer} from '../../db';
  
  // Import the 'getHints' function from the 'db.js' file.
  import { getHints} from '../../db';
  
  // Import the 'getRiddleTheme' function from the 'db.js' file.
  import { getRiddleTheme} from '../../db';
  
  // Import the 'submitScore' function from the 'db.js' file.
  import { submitScore} from '../../db';
  
  
  //Import the "getCSRFToken" function from "db.js" file.
  import { getCSRFToken } from '../../db';
  
  //Import the "setCSRFCookie" function from "db.js" file.
  import { setCSRFCookie } from '../../db'; 
  
  // This asynchronous function  to obtain the CSRF token.
  async function SecurityCSRFToken() {
    try {
      // Attempt to fetch the CSRF token from the server.
      const csrfToken = await getCSRFToken();
      
      // Store the CSRF token in a cookie.
      setCSRFCookie(csrfToken.csrf_token);
      
    } catch (error) {
      // Handle errors during the CSRF token retrieval process.
      console.error('Erreur lors de la récupération du jeton CSRF :', error);
    }
  }
  
  // Call the SecurityCSRFToken function to initiate the process.
  SecurityCSRFToken();
  
  
  // Variable to display the name of the user.
  let divUserName;
  
  let riddleAnswer;
  
  // Creating a variable loggedInUsername to recover its value from local storage and display it when user is connected.
  let loggedInUsername = localStorage.getItem("name");
  // let loggedInUsernamee = localStorage.getItem("role");
  // Creating a variable allow to get a random number from 1 to 5.
  let id = [Math.floor(Math.random() * 5)];
  
  
  // Creating an array to recuperate the hints for the riddles.
  let hints = [];
  
  // Creating a variable to pass to the hints array.
  let hintId = 0;
  
  // Declaring a variable to recover the div element containing the hints.
  let divHints;
  
  //Creating a variable for the user's response.
  let response;
  
  
  
  // let riddleResponseId = 0;
  
  // Declaring a variable for message of victory/defeat.
  let divMessage;
  
  // Declaring a variable to target the textarea value, in case the user provides an empty input.
  let textArea;
  
  // Creating a variable for theme.
  let theme = null;
  
  // Creating variables for score recuperation and submitting it to the data base.
  let scoreToSubmit;
  
  // Creating a variable to target the area where the score is displayed.
  let scoreArea;
  
  let submittedScore = []; //*
  
  //Creating a variable to target the button to submit the score so that it can be visible only if the user has submitted the correct answer.
  let submitScoreButton;
  
  
  // Function  which allows to fetch riddles by their id.
  getRiddles(id);
  
  
  
  // Méthod  which serves to recover the theme of the riddles.
  async function fetchAndLogRiddleTheme() {
    try {
      const theme = await getRiddleTheme(id);
      console.log("Theme ID:", theme);
    } catch (error) {
      console.error("Erreur lors de la récupération du thème :", error);
    }
  }
  
  
  fetchAndLogRiddleTheme();
  
  
  import { onMount } from 'svelte';
  
  // Method wich allows to recover the clues of riddles by their id.
  onMount(async () => {
    hints = await getHints(id);
  });
  
  
  
  getAllRiddlesAnswer(id);
  
  
  
  
  // Method wich allows to display the next hint of the riddle.
  function displayHint() {
    //Creating a <p> element for hints display
      const child = document.createElement("p");
      
      // Changing the background color of the div where hints are displayed.
      hintId % 2
      ? (child.style.backgroundColor = "#0f4d4a")
      : (child.style.backgroundColor = "#0d4240");
      child.textContent = hints[hintId].name;
      child.style.padding = "1rem";
      child.style.margin = "0";
      
      // Adding the <p> element to the div.
        divHints.appendChild(child);
        
        // hintId is incremented by one.
        hintId++;
        
        // Condition alerting the user that he's running out of hints to request.
        if (hintId >= hints.length) {
          alert("Attention, ceci est votre dernier indice!");
        }
      }
      
      
      
      // Méthod which allows you to check if the form is empty or if it contains special characters.
      function validateForm() {
        var userInput = textArea.value;
        if (userInput == "") {
          alert(
          "Veuillez écrire votre réponse avant de cliquer sur le bouton valider !"
          );
          return false;
        } else if (isNotValidAnswer(userInput)) {
          alert("Votre réponse ne doit pas contenir de caractères spéciaux");
          return false;
        }
      }
      
      // Creating a function to handle the submission button and a condition showing a message of victory/defeat to the user.
      const handleSubmitForm = async (event) => {
        event.preventDefault();
        
        // Creating a condition to stop adding a child element.
        if (divMessage.hasChildNodes()) {
          divMessage.removeChild(divMessage.children[0]);
        }
        
        // If user submits the correct answer, the corresponding image is displayed.
        const message = document.createElement("img");
        //If user's response is written in lowercase letters, we transform the first letter of each word
        //to capital letters, so that it matches the way our data is written in the database
        const words = response.split(" ");
        for (let i = 0; i < words.length; i++) {
          words[i] = words[i].charAt(0).toUpperCase() + words[i].slice(1);
        }
        
        //Lorsque vous utilisez getAllRiddlesAnswer(id), vous obtenez une promesse qui contiendra un tableau [riddle.answer] (comme vous l'avez défini dans la fonction getAllRiddlesAnswer).
        
        //Donc, riddleAnswer n'est pas directement la réponse de l'énigme, mais une promesse qui, une fois résolue, contiendra la réponse de l'énigme dans un tableau [riddle.answer].
        
        //Pour comparer correctement la réponse de l'utilisateur avec la réponse de l'énigme, vous devez attendre que la promesse se résolve en utilisant await
        
        
        //En utilisant await, vous attendez que la promesse getAllRiddlesAnswer(id) se résolve et que la valeur réelle (riddleAnswer) soit extraite du tableau avant de
        //la comparer avec la réponse de l'utilisateur (userResponse). Notez que riddleAnswer est un tableau, donc nous comparons userResponse avec riddleAnswer[0]
        
        
        
        
        
        
        //La variable userResponse sert à stocker la réponse de l'utilisateur sous une forme standardisée avant de la comparer avec la réponse de l'énigme (riddleAnswer).
        
        //Dans le code précédent, words est un tableau contenant chaque mot de la réponse de l'utilisateur séparé par un espace. Par exemple, si la réponse de l'utilisateur 
        //est "Ceci est une réponse", alors words sera égal à ["Ceci", "est", "une", "réponse"].
        
        // Ensuite, la fonction join(" ") est utilisée sur le tableau words pour concaténer tous les mots en une seule chaîne de caractères, séparée par un espace. 
        // Ainsi, userResponse contiendra la réponse de l'utilisateur sous forme d'une chaîne unique, sans séparateurs.
        
        const userResponse = words.join(" ");
        const riddleAnswer = await  getAllRiddlesAnswer(id);
        
        // Condition to check the right answer.
        if (userResponse === riddleAnswer) {
          message.src = Victory;
          message.style.width = "30%";
          message.style.margin = "auto auto";
          divMessage.appendChild(message);
          // Displaying the button to submit the score, only if the user is connected and has provided the correct answer
          submitScoreButton.style.display = "block";
          
          // If user does not submit the correct answer, game over message is displayed.
        } else {
          message.src = Game_over;
          message.style.width = "30%";
          message.style.margin = "auto auto";
          divMessage.appendChild(message);
        }
        console.log(riddleAnswer);
        console.log(response);
        
        
        // Emptying the text area after submission
        event.target.reset();
        
        
      };
      
      // Creating the variables for the score calculation
      let result = 1000;
      let score = 1000;
      let numberAttempt = 0;
      let clueReveal = 0;
      
      // Creating a counter incrementing the number of attempts
      const incrementTries = () => {
        numberAttempt += 1;
      };
      
      // Creating a counter incrementing the number of hints
      const incrementHints = () => {
        clueReveal += 1;
      };
      
      getAllRiddlesAnswer(id);
      //Creating the function for score calculation
      const getScores = async () => {
        
        try {
          // Recovery the answer of the riddle.
          const riddleAnswer = await getAllRiddlesAnswer(id);
          
          // Score calculation taking into account the number of tries and the number of hints a user requests
          result = score - (numberAttempt * 5 + clueReveal * 10);
          
          //Condition so that score does not fall below 0
          if (result < 0) result = 0;
          const userResponse = response.toLowerCase();
          const riddleAnswerLower = riddleAnswer.toLowerCase();
          console.log(userResponse);
          
          // Correcting score when user gives the correct answer from the beginning.
          if (userResponse == riddleAnswerLower) {
            result += 5;
          }
          
          // Score display in console.
          console.log("Score final :", result);
        } catch (error) {
          console.error("Une erreur s'est produite lors du calcul du score :", error);
        }
      };
      
      //vous devez utiliser await dans getScores, cela signifie que getScores doit être déclarée comme une fonction asynchrone.
      //Cela permettra à getScores d'attendre que les fonctions asynchrones à l'intérieur d'elle, comme getAllRiddlesAnswer, soient résolues avant de continuer l'exécution.
      
      //Dans cette version de getScores, nous avons ajouté le mot-clé async avant la déclaration de la fonction et nous avons utilisé await pour attendre que getAllRiddlesAnswer(id) soit résolu et nous renvoie la réponse de l'énigme.
      
      //Maintenant, lorsque vous appelez getScores() dans votre code, il attendra que getAllRiddlesAnswer(id) soit résolu et que riddleAnswer soit correctement défini 
      //avant de continuer à calculer le score en utilisant cette réponse. 
      //Cela devrait résoudre le problème que vous aviez avec la valeur undefined pour riddleAnswer
      
      //Function allowing the page to reload when clicking one of the theme buttons, giving a riddle to the user
      function refreshPage() {
        window.location.reload();
      }
      
      // Handle score submission.
      const handleSubmitScore = async (event) => {
        event.preventDefault();
        
        scoreToSubmit = scoreArea.textContent;
        
        try {
          // Recovery the themeId associated with the riddle.
          const theme = await getRiddleTheme(id);
          
          console.log("Theme ID:", theme);
          
          // Submit the score with the name of user and theme of the game.
          const response = await submitScore(scoreToSubmit, loggedInUsername, theme);
          console.log(response);
          
          // Display an alert to indicate that the user's score has been successfully added or not.
          alert("Votre score a été ajouté avec succès !");
        } catch (error) {
          console.error("Une erreur s'est produite lors de la soumission du score :", error);
        }
      };
      
      
      
      
      
      submitScore(); 
      
      
    </script>
    
    <body>
      <div class="container">
        <Header />
        <main class="random-theme-game">
          <div class="background-game">
            <section
            id="random-theme"
            aria-label="Jeu à thème aléatoire"
            style="background-image: url('{Background_game}');"
            >
            <div class="guessWhatText">
              <h1>Guess What ?</h1>
              <!--This block of code is used to await the result of the 'getRiddles(id)
                It displays a message while waiting for the promise to resolve. -->
                {#await getRiddles(id)}
                <p>En attente d'une devinette</p>
                {:then riddles}
                <!-- When the promise is resolved, it loops through each riddle in the 'riddles' array. -->
                {#each riddles as riddle}
                <!-- Display each riddle inside a paragraph element. -->
                <p>{riddle}</p> 
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
                <button
                on:click={displayHint}
                on:click={incrementHints}
                on:click={getScores}>Demandez un indice</button
                >
              </div>
              <form
              action="#"
              method="post"
              id="responseForm"
              on:submit={handleSubmitForm}
              on:submit={getScores}
              >
              
              <div class="gamer-response">
                <div>
                  <textarea
                  name="response"
                  id="response"
                  placeholder="Répondre"
                  bind:value={response}
                  bind:this={textArea}
                  aria-label="Votre réponse"
                  />
                </div>
                <div class="response-buttons">
                  <button on:click={incrementTries} on:click={validateForm}
                  >Valider</button
                  >
                </div>
              </div>
            </form>
            <div class="score" aria-label="Affichage du score">
              Score :<span bind:this={scoreArea}>{result}</span>
            </div>
            <div class="save-score">
              {#if localStorage.getItem("token")}
              <button bind:this={submitScoreButton} on:click={handleSubmitScore}
              >Sauvegarder le score</button
              >
              {/if}
            </div>
          </section>
        </div>
        <nav>
          <a href="/random_theme_riddle" use:link on:click={refreshPage}
          ><img src={Mascotte_Refresh} alt="Mascotte pour relancer le jeu" /></a
          >
        </nav>
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
        background-size: 40%;
        background-repeat: repeat;
        background-position: center;
        border: 0.7rem var(--blue-outlines) solid;
        margin-top: -0.7rem;
        margin-left: -0.7rem;
        margin-right: -0.7rem;
        padding-bottom: 00.7rem;
        border-radius: 0.9rem;
        text-align: center;
      }
      
      div.hints {
        text-align: center;
        border: 0.7rem var(--blue-outlines) solid;
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
        border: 0.7rem var(--blue-outlines) solid;
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
        border: 0.7rem var(--blue-outlines) solid;
        color: var(--text-color);
        font-weight: bolder;
        border-radius: 0.9rem;
        font-family: "Mentimun";
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
        border: 0.7rem var(--blue-outlines) solid;
        color: var(--blue-text);
        font-weight: bolder;
        border-radius: 0.9rem;
        font-family: "Mentimun";
        font-size: 75%;
      }
      
      .response-buttons button:hover {
        border: 0.7rem var(--bg-buttons) solid;
      }
      
      div.score {
        display: flex;
        justify-content: center;
      }
      
      .save-score {
        display: flex;
        justify-content: center;
        align-items: center;
      }
      
      .save-score button {
        margin-top: 10px;
        margin-bottom: 5px;
        padding: 0.1rem;
        background-color: #0f4d4a;
        border: 0.2rem var(--blue-outlines) solid;
        color: var(--text-color);
        font-weight: bolder;
        border-radius: 0.4rem;
        font-size: 70%;
        text-align: center;
        display: none;
      }
      
      .save-score button:hover {
        background-color: var(--text-color);
        color: var(--blue-outlines);
        transform: scale(1.1);
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
        0% {
          transform: rotate(0deg);
        }
        25% {
          transform: rotate(5deg);
        }
        50% {
          transform: rotate(0deg);
        }
        75% {
          transform: rotate(-5deg);
        }
        100% {
          transform: rotate(0deg);
        }
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
          width: 20%;
          min-width: 50px;
        }
        
        .homeButton {
          display: block;
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
          justify-content: flex-start;
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
        
        aside a.contact {
          margin-top: 1rem;
          font-size: large;
        }
      }
    </style>
