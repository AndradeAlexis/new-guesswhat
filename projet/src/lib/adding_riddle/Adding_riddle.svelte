<script>
  import { link } from "svelte-spa-router";
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import { push } from "svelte-spa-router";
  import { logout } from "../connection/Connection.svelte";
  import { refreshPage } from "../functions/Functions.svelte";
  import { isNotValidAnswer } from "../functions/Functions.svelte";
  import Accueil from "../../assets/Accueil.png";
  import { addRiddle} from '../../db';
  import { onMount } from "svelte";


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

  
  // Creating a variable loggedInUsername to recover its value from local storage and display it when user is connected.
  let loggedInUsername = localStorage.getItem("name");
  
  let divUserName;
  
  // Creating variables for POST request when adding a riddle to the database.
  let name;
  let answer;
  let theme_id;
  let hint;
  let hint2;
  let hint3;
  let hint4;
  let hint5;
  let hint6;
  
  // Creating values to target the user inputs in the form for form security.
  
  let riddleArea;
  let riddleResponseArea;
  let hintInputArea;
  let hintInput2Area;
  let hintInput3Area;
  let hintInput4Area;
  let hintInput5Area;
  let hintInput6Area;
  
  // Function to add a Riddle in the database when an administrator is connected.
  onMount(async () => {
    const newRiddle = await addRiddle();
    
    
  });
  
  
  // Async function to handle the submit of riddle.
  const handleSubmitRiddle = async (event) => {
    event.preventDefault();
    
    // Checking if clues have been entered.
    const clues = [];
    if (hint.trim() !== "") clues.push({ name: hint });
    if (hint2.trim() !== "") clues.push({ name: hint2 });
    if (hint3.trim() !== "") clues.push({ name: hint3 });
    if (hint4.trim() !== "") clues.push({ name: hint4 });
    if (hint5.trim() !== "") clues.push({ name: hint5 });
    if (hint6.trim() !== "") clues.push({ name: hint6 });
    
    //data object whith the value of the user
    const data = {
      name,
      answer,
      theme_id,
      clues,
    };
    
    // asyn function that allows you to send data to the server to add a riddle
    const response = await addRiddle(name, answer, theme_id, clues);
    
    try {
      if (response.status === 201) {
        console.log("Votre énigme a été soumise avec succès");
        alert("Votre énigme a été soumise avec succès");
        push("/");
      } else {
        // Si la réponse n'est pas au format JSON, affichez un message de succès
        console.log("Votre énigme a été soumise avec succès");
        alert("Votre énigme a été soumise avec succès");
        push("/");
      }
    } catch (error) {
      console.error("Erreur lors de l'ajout de l'énigme :", error);
      throw error;
    }
    
  };
</script>

<body>
  <div class="container">
    <Header />
    <main>
      <section class="leftBlock" aria-label="Formulaire ajouter une devinette">
        <div class="guessWhatText">
          <h1>Guess What ?</h1>
        </div>
        <h2 id="addRiddleFormTitle">Ajouter une devinette</h2>
        <form on:submit={handleSubmitRiddle} action="#" method="post">
          <div class="addRiddleForm">
            <div class="columnAddRiddleForm">
              <label for="riddle">Choisissez le thème</label>
              <label for="riddle">Ecrivez votre énigme</label>
              <label for="answer">Ecrivez votre réponse</label>
              <label for="clue">Donnez des indices</label>
            </div>
            <div class="columnAddRiddleForm">
              <div class="dropdownMain">
                <button class="dropdownBtn">Choisissez le thème</button>
                <div class="dropdownThemes">
                  <select
                  bind:value={theme_id}
                  name="themes"
                  id="themes"
                  required
                  >
                  <option value="1">Animaux</option>
                  <option value="2">Cinéma</option>
                  <option value="3">Musique</option>
                </select>
              </div>
            </div>
            <div>
              <input
              type="text"
              required
              id="riddle"
              name="riddle_name"
              placeholder="Énigme"
              bind:this={riddleArea}
              bind:value={name}
              />
              <input
              type="text"
              required
              id="answer"
              name="answer_name"
              placeholder="Réponse"
              bind:this={riddleResponseArea}
              bind:value={answer}
              />
              <input
              type="text"
              required
              id="clue_1"
              name="clue_name"
              placeholder="Indice 1"
              bind:this={hintInputArea}
              bind:value={hint}
              />
              <input
              type="text"
              required
              id="clue_2"
              name="clue_name"
              placeholder="Indice 2"
              bind:this={hintInput2Area}
              bind:value={hint2}
              />
              <input
              type="text"
              required
              id="clue_3"
              name="clue_name"
              placeholder="Indice 3"
              bind:this={hintInput3Area}
              bind:value={hint3}
              />
              <input
              type="text"
              
              id="clue_4"
              name="clue_name"
              placeholder="Indice 4"
              bind:this={hintInput4Area}
              bind:value={hint4}
              />
              <input
              type="text"
              
              id="clue_5"
              name="clue_name"
              placeholder="Indice 5"
              bind:this={hintInput5Area}
              bind:value={hint5}
              />
              <input
              type="text"
              
              id="clue_6"
              name="clue_name"
              placeholder="Indice 6"
              bind:this={hintInput6Area}
              bind:value={hint6}
              />
              <button id="addRiddleFormButton">Valider</button>
            </div>
          </div>
        </div>
      </form>
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
  /* ADD A RIDDLE FORM */
  
  #addRiddleFormTitle {
    text-align: center;
  }
  
  .addRiddleForm {
    width: 100%;
    padding: 1rem;
    display: flex;
  }
  
  .columnAddRiddleForm {
    flex: 50%;
  }
  
  .addRiddleForm label {
    font-weight: bold;
    display: flex;
    flex-direction: column;
    margin: 5%;
    padding: 5%;
  }
  
  .addRiddleForm input {
    border: 4px solid var(--bg-buttons);
    border-radius: 10px;
    padding: 2%;
    width: 100%;
    margin-top: 8%;
    display: flex;
    flex-direction: column;
    text-align: center;
    z-index: 1;
  }
  
  #addRiddleFormButton {
    width: 100%;
    padding: 1rem;
    background-color: var(--orange-buttons);
    color: var(--blue-text);
    font-weight: bolder;
    border: 10px var(--blue-outlines) solid;
    border-radius: 15px;
    font-family: "Mentimun";
    font-size: 125%;
    display: block;
    margin: 30px auto 0 auto;
  }
  
  .dropdownMain {
    display: inline-block;
    background-color: var(--orange-buttons);
    color: var(--blue-text);
    border: 4px var(--blue-outlines) solid;
    cursor: pointer;
    border-radius: 10px;
    padding: 2%;
    width: 100%;
    margin-top: 5%;
  }
  
  button.dropdownBtn {
    background-color: var(--orange-buttons);
    border: none;
    font-family: "Mentimun";
    display: block;
  }
  
  .dropdownThemes {
    background-color: var(--bg-images);
    color: var(--bg-buttons);
    border: 2px solid var(--blue-outlines);
    border-radius: 4px;
    display: none;
    z-index: 2;
    right: 52%;
  }
  
  .dropdownThemes p {
    color: var(--bg-buttons);
    background-color: var(--bg-images);
    text-decoration: none;
    display: block;
    text-align: center;
  }
  
  .dropdownMain:hover .dropdownThemes {
    display: block;
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
  
  .homeButton {
    display: block;
    max-width: 80%;
    margin: 0.5rem auto;
  }
  
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
      width: 300px;
    }
    
    h2 {
      margin-bottom: 1rem;
    }
    
    input,
    .dropdownMain {
      margin-bottom: 12px;
      margin-left: -50px;
      width: 100%;
    }
    
    #addRiddleFormButton {
      margin-left: -50px;
    }
  }
  
  /*  Media queries for desktop version */
  @media (min-width: 769px) {
    main {
      grid-template-columns: 55% auto;
    }
    
    .addRiddleForm {
      width: 80%;
      display: flex;
      justify-content: center;
    }
    
    input,
    .dropdownMain {
      margin-bottom: 11px;
      margin-left: -30px;
      width: 100%;
    }
    
    #addRiddleFormButton {
      margin-left: -2.5rem;
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
      max-width: 45%;
    }
    
    /* Styling the remaining navigation buttons */
    
    aside button {
      max-width: 300px;
    }
    
    aside a.contact {
      margin-top: 1rem;
      font-size: large;
    }
  }
</style>
