<script>
  import { link } from "svelte-spa-router";
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import { push } from "svelte-spa-router";
  import { refreshPage } from "../functions/Functions.svelte";
  import Accueil from "../../assets/Accueil.png";
  
  
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
  
  // Variables to store data filled in by the user.
  let name = '';
  let email = '';
  let password = '';
  let textArea;
  let userEmailArea;
  let userPasswordArea;
  
  // Async function which allows create a user.
  const handleSubmitUser = async (event) => {
    event.preventDefault();
    
    // Get the value of the form, these values ​​will be used to create a new user.
    const name = textArea.value;
    const email = userEmailArea.value;
    const password = userPasswordArea.value;
    
    try {
      
      // Get the CSRF token
      const csrfToken = await getCSRFToken();
      
      // If the CSRF token is available, add it to the headers.
      if (csrfToken) {
        // POST request to the URL "http://127.0.0.1:8000/api/users".
        
        const response = await fetch("http://127.0.0.1:8000/api/users", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            // Add CSRF token to headers
            "X-CSRF-TOKEN": csrfToken.csrf_token,
          },
          body: JSON.stringify({
            name: name,
            email: email,
            password: password,
          }),
        });
        // This condition checks if the HTTP response has a status code 201, meaning user creation was successful and redirects the user to the login page.
        if (response.status === 201) {
          alert("Utilisateur créé avec succès");
          push("/connection");
          // If user creation fails,(for exemple invalid data or email duplicates) the HTTP response is parsed as JSON, and an error message is displayed in an alert.
        } else {
          const data = await response.json();
          alert("Erreur lors de la création de l'utilisateur: " + data.message);
        }
      } else {
        // Handle the case where CSRF token is not available.
        alert("Erreur lors de la récupération du jeton CSRF.");
      }
    } catch (error) {
      alert("Erreur lors de la création de l'utilisateur: " + error.message);
    }
  };
  
  
</script>

<body>
  <div class="container">
    <Header />
    <main>
      <section class="leftBlock" aria-label="Formulaire d'inscription">
        <div class="guessWhatText">
          <h1>Guess What ?</h1>
        </div>
        <h2 id="subscriptionFormTitle">Formulaire d'inscription</h2>
        <form on:submit={handleSubmitUser}>
          <div class="subscriptionForm">
            <div class="columnSubscriptionForm">
              <label for="first_name">Nom d'utilisateur</label>
              <label for="email">Adresse email</label>
              <label for="password">Mot de passe</label>
            </div>
            <div class="columnSubscriptionForm">
              <input
              type="first_name"
              required
              id="first_name"
              name="first_name"
              placeholder="Nom d'utilisateur"
              bind:this={textArea}
              bind:value={name}
              />
              
              <input
              type="email"
              required
              id="mail"
              name="user_mail"
              placeholder="Email"
              bind:this={userEmailArea}
              bind:value={email}
              />
              
              <input
              type="password"
              required
              id="password"
              name="user_password"
              placeholder="Mot de passe"
              
              title="Le mot de passe doit contenir au moins un chiffre, un symbole, une lettre majuscule et 8 à 20 caractères"
              bind:this={userPasswordArea}
              bind:value={password}
              />
              
              <button id="subscriptionFormButton">Valider</button>
            </div>
          </div>
        </form>
      </section>
      <aside aria-label="menu de navigation">
        <div>
          {#if localStorage.getItem("token")}
          <p>{loggedInUsername }</p>
          <a
          href="/subscription"
          use:link
          
          on:click={refreshPage}
          >
          <span id="statusUser">Déconnecter</span></a
          >
          {/if}
        </div>
        <a href="/" use:link
        ><img class="homeButton" src={Accueil} alt="Retour accueil" /></a
        >
        {#if !localStorage.getItem("token")}
        <button
        ><a href="/connection" use:link class="aside-buttons">Connexion</a
          ></button
          >
          <button
          ><a href="/scores" use:link class="aside-buttons">Scores</a></button
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
    /* SUBSCRIPTION */
    
    #subscriptionFormTitle {
      text-align: center;
    }
    
    .subscriptionForm {
      width: 100%;
      padding: 1rem;
      display: flex;
    }
    
    .columnSubscriptionForm {
      flex: 50%;
    }
    
    .subscriptionForm label {
      font-weight: bold;
      display: flex;
      flex-direction: column;
      margin: 4%;
      padding: 5%;
    }
    
    .subscriptionForm input {
      border: 4px solid var(--bg-buttons);
      border-radius: 10px;
      padding: 2%;
      width: 100%;
      margin-top: 6%;
      display: flex;
      flex-direction: column;
    }
    
    #subscriptionFormButton {
      width: 100%;
      padding: 1rem;
      background-color: var(--orange-buttons);
      color: var(--blue-text);
      font-weight: bolder;
      border: 10px var(--blue-outlines) solid;
      border-radius: 15px;
      font-family: "Mentimun";
      font-size: 125%;
      margin: 30px auto 0 auto;
      display: block;
    }
    
    #subscriptionFormButton:hover {
      transform: scale(1.1);
      border: 0.7rem var(--bg-buttons) solid;
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
    
    /*  Media queries version tablet  */
    @media (min-width: 426px) and (max-width: 768px) {
      .homeButton {
        width: 300px;
      }
      
      input {
        margin-bottom: 12px;
        margin-left: -50px;
        width: 100%;
      }
      
      #subscriptionFormButton {
        margin-left: -50px;
      }
    }
    
    /*  Media queries desktop version */
    
    @media (min-width: 769px) {
      main {
        grid-template-columns: 55% auto;
      }
      
      .subscriptionForm {
        width: 80%;
        display: flex;
        justify-content: center;
      }
      
      .columnSubscriptionForm {
        margin-left: 1rem;
      }
      
      input {
        margin-bottom: 11px;
        margin-left: -30px;
        width: 100%;
      }
      
      #subscriptionFormButton {
        margin-left: -2.5rem;
      }
      
      .homeButton {
        max-width: 45%;
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
      
      aside button {
        max-width: 300px;
      }
      
      aside a.contact {
        margin-top: 1rem;
        font-size: large;
      }
    }
  </style>
