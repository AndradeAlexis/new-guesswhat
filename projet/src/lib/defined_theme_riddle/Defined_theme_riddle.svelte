<script>
  import { link } from "svelte-spa-router";
  import { onMount } from "svelte";
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import { logout } from "../connection/Connection.svelte";
  import { push } from "svelte-spa-router";
  import { isNotValidAnswer } from "../functions/Functions.svelte";
  import Victory from "../../assets/victory.png";
  import Game_over from "../../assets/game_over.png";
  import Mascotte_Theme_Animaux from "../../assets/Mascotte_Theme_Animaux.png";
  import Mascotte_Theme_Cinema from "../../assets/Mascotte_Theme_Cinema.png";
  import Mascotte_Theme_Musique from "../../assets/Mascotte_Theme_Musique.png";
  import Mascotte_Refresh from "../../assets/Mascotte_Refresh.png";
  import Accueil from "../../assets/Accueil.png";
  import Choix_theme from "../../assets/Choix_theme.png";
  import Background_game from "../../assets/Background_game.png";
  import { getHints } from '../../db';
  import { params } from "svelte-spa-router";
  import axios from 'axios';
  
  // Import the "getRiddlesByTheme" function from "db.js" file.
  import { getRiddlesByTheme } from '../../db';
  
  // Import the "getAllRiddlesAnswer" function from "db.js" file.
  import { getAllRiddlesAnswer} from '../../db';
  
  // Import the "submitScore" function from "db.js" file.
  import { submitScore } from '../../db';
  
  // Import the "getRiddleTheme" function from "db.js" file.
  import { getRiddleTheme} from '../../db';
  
  // Import the "getCSRFToken" function from "db.js" file.
  import { getCSRFToken } from '../../db';
  
  // Import the "setCSRFCookie" function from "db.js" file.
  import { setCSRFCookie } from '../../db'; 
  
  // This asynchronous function to obtain the CSRF token.
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
  
  // Variable to stores the current theme ID.
  let currentThemeId = 0;
  
  // Variable wich contains the logged in username from local storage.
  let loggedInUsername = localStorage.getItem("name");
  
  // Variable to display the name of the user.
  let divUserName;
  
  // Variable to contains the if of riddles;
  let id;
  
  // Variable ton contains riddle in array.
  let riddles = [];
  
  // Fetch all riddles answers
  getAllRiddlesAnswer(id);
  
  // Variable to folow the riddle currently displayed.
  let currentRiddleIndex = 0; 
  
  // Variable to check if the riddle has recovered.
  let hasFetchedRiddles = false; 
  
  let selectedRiddle = null;
  
  // Variable ton contains hints in array.
  let hints = [];
  
  // Variable which allows you to start with the value 0.
  let hintId = 0;
  
  // Variable which contain the clues to display.
  let divHints;
  
  // Variable to recover the response of user and and turns it into a version with the first letter capitalized.
  let response;
  
  // Variable to contains the answer of the riddle.*
  let riddleResponse = [];
  
  // Variable wich contains the message of good or wrong answer of the user.
  let divMessage;
  
  // Variable which contains the value of the user's response.
  let textArea;
  
  // Variable which contains the score oh the game.
  let scoreToSubmit;
  
  // Variable wich allows to display the name of the user in the page.
  let usernameArea;
  
  // Variable wich allows to display the score of the user in the page.
  let scoreArea;
  
  let submittedScore = [];//*
  
  // Variable wich allows to display the button to submit score if the user have the good answer.
  let submitScoreButton;
  
  // Variable wich contains the id of the theme selected.
  let themeId;
  
  // Variable to track the index of the hint to display.
  let displayHintIndex = 0; 
  
  // Variable to contains the current id of the hint.
  let currentHintIndex = 0;
  
  // Function to update riddles by theme.
  async function updateRiddlesByTheme(newThemeId) {
    if (!hasFetchedRiddles) {
      const newRiddles = await getRiddlesByTheme(newThemeId);
      console.log(newRiddles);
      riddles = newRiddles;
      console.log(riddles);
      console.log("New Theme ID:", newThemeId);
      //riddlesAnswer = riddles.name;
      //console.log("réposne de l'énigme:", riddlesAnswer);
      currentThemeId = newThemeId;
      for (const riddle of riddles) {
        // Using riddle.id as a parameter for the riddle ID.
        riddle.riddleHints = await getHints(riddle.id); 
      }
      console.log(riddles);
      
      return riddles;
    }
  }
  
  // Use onMount to perform operations when the Svelte component is mounted in the DOM.
  onMount(async () => {
    
    // hints = await getHints(id);
    // console.log(hints);
    
    // Method which allows  to change the theme according to the endpoint dynamically .
    const unsubscribe = params.subscribe((routeParams) => {
      //// Extract the themeId from the 'routeParams'
      themeId = +routeParams.id;
      
      // Call the 'updateRiddlesByTheme' methof with the extracted 'themeId' to update the riddles based on the selected theme.
      updateRiddlesByTheme(themeId);
    });
    
    return unsubscribe;
    
  });
  console.log(hints);
  
  // Method wich allows to refresh the page.
  function refreshPage() {
    window.location.reload();
  }
  
  // Method wich allows to display the next hint of the riddle.
  function displayNextHint() {
    // Check if riddles  is currently selected and if any clues are available for this riddles and if all clues have not yet been displayed.
    if (
    riddles[currentRiddleIndex] &&
    riddles[currentRiddleIndex].riddleHints &&
    currentHintIndex < riddles[currentRiddleIndex].riddleHints.length
    ) {
      // Clear the content before adding the new hint.
      divHints.innerHTML = ""; 
      
      // Get the next index to display.
      const hint = riddles[currentRiddleIndex].riddleHints[currentHintIndex];
      
      // Create a element to display the clue.
      const child = document.createElement("p");
      currentHintIndex++;
      
      // Changing the background color for the next clue.
      child.style.backgroundColor =
      currentHintIndex % 2 === 0 ? "#0f4d4a" : "#0d4240";
      
      // Set the clue.
      child.textContent = hint.name;
      child.style.padding = "1rem";
      child.style.margin = "0";
      
      // Add the element containing the clue in the clues area.
      divHints.appendChild(child);
      
      // Display an alert if all clues have been displayed for this riddles.
      if (
      currentHintIndex >=
      riddles[currentRiddleIndex].riddleHints.length
      ) {
        alert("Attention, ceci est ton dernier indice!");
      }
    }
  }
  
  // Method which allows you to check if the form is empty or if it contains special characters.
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
    if (divMessage.hasChildNodes()) {
      divMessage.removeChild(divMessage.children[0]);
    }
    
    // If user submits the correct answer, the corresponding image is displayed.
    const message = document.createElement("img");
    const words = response.split(" ");
    for (let i = 0; i < words.length; i++) {
      words[i] = words[i].charAt(0).toUpperCase() + words[i].slice(1);
    }
    const userResponse = words.join(" ");
    
    // Retrieve the currently selected riddle from the riddles array.
    const currentRiddle = riddles[currentRiddleIndex];
    
    
    
    
    
    // Access the "answer" property of the current riddle.
    const riddleAnswer = currentRiddle.answer;
    console.log(currentRiddle);
    console.log(riddleAnswer);
    
    
    // Condition to check the right answer.
    if (userResponse === riddleAnswer) {
      message.src = Victory;
      message.style.width = "30%";
      message.style.margin = "auto auto";
      divMessage.appendChild(message);
      
      // Displaying the button to submit the score, only if the user is connected and has provided the correct answer.
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
    
    
    // Emptying the text area after submission.
    event.target.reset();
    
    
  };
  // Variables for score calculation.
  let result = 1000;
  let score = 1000;
  let numberAttempt = 0;
  let clueReveal = 0;
  
  // Function to increment the number of attempts.
  const incrementTries = () => {
    numberAttempt += 1;
  };
  
  // Function to increment the number of hints revealed.
  const incrementHints = () => {
    clueReveal += 1;
  };
  
  
  // Function for score calculation.
  const getScores =  () => {
    try {
      // Recovery the answer of the riddle.
      const riddleAnswer = getAllRiddlesAnswer(id);
      
      // Score calculation taking into account the number of tries and the number of hints a user requests.
      result = score - (numberAttempt * 5 + clueReveal * 10);
      //Condition so that score does not fall below 0
      if (result < 0) result = 0;
      
      const userResponse = response.toLowerCase();
      
      console.log(userResponse);
      console.log(riddleAnswer);
      
      // Add points if user response is correct on the first attempt.
      if (userResponse == riddleAnswer && numberAttempt == 0) {
        result += 5;
      }
      // Score display in console.
      console.log("Score final :", result);
    } catch (error) {
      console.error("Une erreur s'est produite lors du calcul du score :", error);
    }
  };
  getScores();
  
  // Handle score submission.
  const handleSubmitScore = async (event) => {
    event.preventDefault();
    
    scoreToSubmit = scoreArea.textContent;
    
    try {
      // Submit the score with the name of user and theme of the game.
      const response = await submitScore(scoreToSubmit, loggedInUsername, currentThemeId);
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
    <main class="defined-theme-game">
      <section
      id="defined-theme"
      aria-label="Jeu à thème défini"
      style="background-image: url('{Background_game}');"
      >
      <div class="guessWhatText">
        <h1>Guess What ?</h1>
        {#await updateRiddlesByTheme(themeId)}
        <p>En attente d'une devinette</p>
        {:then}
        {#each riddles as riddle, index}
        {#if index === currentRiddleIndex}
        <p>{riddle.name}</p>
        {/if}
        {/each}
        {/await}
        <div class="message" bind:this={divMessage}>
          <!-- Congratulations message or game over message appearing here -->
        </div>
      </div>
      <div class="navigation-buttons">
        
        <button class="next-button"
        on:click={() => {
          currentRiddleIndex = Math.min(currentRiddleIndex + 1, riddles.length - 1);
          divHints.innerHTML = ""; // Vide le contenu de la section des indices
          displayHintIndex = 0; // Réinitialise l'index de l'indice affiché
        }}
        >Suivant
      </button>
    </div>
    <div class="hints" bind:this={divHints}>
      {#await getHints()}
      <p>Les indices s'afficheront ici</p>
      {/await}
    </div>
    <div class="hints-button">
      <button
      on:click={displayNextHint}
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
        <button on:click={incrementTries} on:click={validateForm}>Valider</button>
      </div>
    </div>
  </form>
  <div class="score" aria-label="Affichage du score">
    Score :<span bind:this={scoreArea}>{result}</span>
  </div>
  <div class="save-score">
    {#if localStorage.getItem("token")}
    <button bind:this={submitScoreButton} on:click={handleSubmitScore} >
      Sauvegarder le score</button
      >
      {/if}
    </div>
  </section>
  <nav>
    <a href="/defined_theme_riddle" use:link
    ><img
    class="choose-theme"
    src={Choix_theme}
    alt="Choisissez un thème"
    /></a
    >
    <a
    href="/defined_theme_riddle/1"
    use:link
    on:click={() => {
      updateRiddlesByTheme(1); // Remplacez 1 par l'ID du thème que vous souhaitez charger
    }}
    ><img
    src={Mascotte_Theme_Animaux}
    alt="Mascotte pour le thème animaux"
    
    /></a
    >
    <a
    href="/defined_theme_riddle/2"
    use:link
    on:click={() => {
      updateRiddlesByTheme(2); // Remplacez 1 par l'ID du thème que vous souhaitez charger
    }}
    ><img
    src={Mascotte_Theme_Cinema}
    alt="Mascotte pour le thème cinema"
    /></a
    >
    <a
    href="/defined_theme_riddle/3"
    use:link
    on:click={() => {
      updateRiddlesByTheme(3); // Remplacez 1 par l'ID du thème que vous souhaitez charger
    }}
    ><img
    src={Mascotte_Theme_Musique}
    alt="Mascotte pour le thème musique"
    /></a
    >
    <a href="/defined_theme_riddle" use:link on:click={refreshPage}
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
  
  #defined-theme {
    background-image: url(Background_game);
    background-size: 40%;
    background-repeat: repeat;
    background-position: center;
    border: 0.7rem var(--blue-outlines) solid;
    margin-top: -0.7rem;
    margin-left: -0.7rem;
    margin-right: -0.7rem;
    padding-bottom: 0.7rem;
    border-radius: 0.9rem;
    text-align: center;
  }
  
  
  .next-button {
    
    margin-bottom: 5px;
    width: 250px;
    padding: 1rem;
    background-color: #0f4d4a;
    border: 0.7rem var(--blue-outlines) solid;
    color: var(--text-color);
    font-weight: bolder;
    border-radius: 0.9rem;
    font-family: "Mentimun";
    font-size: 80%;
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
  
  .hints-button button:hover  {
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
    animation: tilt-shaking 0.3s infinite;
  }
  
  .choose-theme {
    background-color: none;
  }
  
  .choose-theme:hover {
    background-color: var(--bg-images);
    animation: none;
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
      width: 50%;
      min-width: 50px;
    }
    
    .homeButton {
      display: block;
      max-width: 300px;
      margin: 0.5rem auto;
    }
  }
  
  /*  Desktop media queries  */
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
      border-radius: 0.9rem;
      padding: 1rem;
      width: 200px;
      height: 78px;
      resize: none;
    }
    
    /*textarea {
      border-radius: 0.5rem;
      padding: 1rem;
      width: 200px;
      height: 150px;
      resize: none;
    }*/
    
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
    }
    
    nav img {
      margin-left: 0.35rem;
      margin-top: -5px;
      width: 30%;
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
