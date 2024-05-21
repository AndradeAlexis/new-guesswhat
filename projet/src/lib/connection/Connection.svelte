<script context="module">
  import { link } from "svelte-spa-router";
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import { push } from "svelte-spa-router";
  import { refreshPage } from "../functions/Functions.svelte";
  import Accueil from "../../assets/Accueil.png";
  import { getUsernameFromEmail} from '../../db';
  import { add_attribute } from "svelte/internal";
  
  
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
  
  //Creating variables for user input: email and password.
  let email;
  let password;
  let fetchedUsername;
  
  
  // variable to contains the name of the user.
  let divUserName;
  // Retrieve the logged-in username from local storage, or use an empty string if not found.
  let loggedInUsername = localStorage.getItem("name") || "";
  
  // Async function which allows a user to log in .
  const login = async () => {
    try {
      // Recover de CSRF token.
      const csrfToken = await getCSRFToken(); 
      // If the CSRF token is available, add it to the headers.
      if (csrfToken) { 
        // async function to allowed user for connexion.
        const response = await fetch("http://127.0.0.1:8000/api/login", {
          method: "POST",
          headers: {
            "content-type": "application/json",
            // Add CSRF token to headers
            "X-CSRF-TOKEN": csrfToken.csrf_token,
          },
          body: JSON.stringify({
            email: email,
            password: password,
          }),
        });
        const json = await response.json();
        console.log(json);
        if (response.status === 200) {
          const token = json.access_token;
          // Store the user's authentication token and username in local storage.
          // Extract the username from the JSON response.
          const username = json.name; 
          
          // Store the authentication token.
          localStorage.setItem("token", token); 
          
          // Store the username.
          localStorage.setItem("name", username); 
          
          // Store the role.
          const role = json.role;
          localStorage.setItem("role", role);
          
          //  Request to fetch user details from the API
          const userResponse = await fetch("http://127.0.0.1:8000/api/user", {
            headers: {
              // Include the authentication token in the request headers.
              "Authorization": `Bearer ${token}`,
            },
          });
          // Parse the JSON response.
          const userJson = await userResponse.json();
          console.log(userJson);
          
          // Function to obtain the username by the email.
          const fetchedUsername = await getUsernameFromEmail(email);
          console.log("fetchedUsername:", fetchedUsername);
          // Check if a username was successfully fetched.
          if (fetchedUsername) {
            loggedInUsername = fetchedUsername;
            console.log("loggedInUsername:", loggedInUsername); 
            //console.log(token);
            // Store the token and the name in local storage.
            localStorage.setItem("token", JSON.stringify(token));
            localStorage.setItem("name", loggedInUsername);
            
            if (loggedInUsername) {
              // If loggedInUsername is defined.
              console.log("Nom d'utilisateur :", loggedInUsername);
            } else {
              // If loggedInUsername is not defined.
              console.log("Nom d'utilisateur non défini ou vide.");
            }
            // Redirect to home page.
            push ("/");
            
            // Collecte the token from local storage and parse it as an object.
            const storedToken = JSON.parse(localStorage.getItem("token"));
            
            if (storedToken) {
              // Log the access token.
              console.log("Jeton d'accès :", storedToken);
              console.log(JSON.stringify(storedToken, null, 2));
            } else {
              console.log("Jeton d'accès non défini ou vide.");
            }
          }
          // Handle authentication errors.
        } } else {
          // Handle the case where CSRF token is not available.
          alert("Erreur lors de la récupération du jeton CSRF.");
        }
      } catch (error) {
        // Handle errors
        console.error("Une erreur s'est produite :", error.message);
      }
    };
    
    // function that allows to log out.
    export const logout = () => {
      
      // Removing token, username and cookie when user clicks on disconnet button.
      localStorage.removeItem("token");
      localStorage.removeItem("name");
      localStorage.removeItem("role");
      document.cookie = 'XSRF-TOKEN=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
      
      // Redirect to login page.
      push ("/connection");
      
      // Display a logout confirmation alert.
      alert("Vous vous êtes bien déconnecté")
    };
    
   
    
  </script>
  
  
  <body>
    <div class="container">
      <Header />
      <main>
        <section class="leftBlock" aria-label="Formulaire de connexion">
          <div class="guessWhatText">
            <h1>Guess What ?</h1>
          </div>
          <h2 id="loginFormTitle">Formulaire de connexion</h2>
          <form  on:submit={login}>
            <div class="loginForm">
              <div class="columnLoginLabels">
                <label for="mail">Adresse email</label>
                <label for="password">Mot de passe</label>
              </div>
              <div class="columnLoginForm">
                <input
                required
                type="email"
                id="mail"
                name="user_mail"
                placeholder="Email"
                bind:value={email}
                
                />
                <input
                required
                type="password"
                id="password"
                name="user_password"
                placeholder="Mot de passe"
                bind:value={password}
                />
                <button id="loginFormButton">Connexion</button>
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
            use:link on:click={() => {  logout(); }}>
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
    /* LOGIN */
    
    #loginFormTitle {
      text-align: center;
    }
    
    .loginForm {
      width: 100%;
      padding: 1rem;
      display: flex;
    }
    
    .columnLoginForm {
      flex: 50%;
    }
    
    .loginForm label {
      font-weight: bold;
      display: flex;
      flex-direction: column;
      margin-left: -4%;
      margin-bottom: 1rem;
      padding: 5%;
    }
    
    .loginForm input {
      border: 4px solid var(--bg-buttons);
      border-radius: 10px;
      padding: 2%;
      margin: 0 0.5rem 1.4rem 0.7rem;
      display: flex;
      flex-direction: column;
    }
    
    #loginFormButton {
      width: 200px;
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
    
    #loginFormButton:hover {
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
    
    .aside-buttons {
      color: var(--blue-text);
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
      
      .columnLoginLabels {
        width: 25%;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center;
      }
      
      .columnLoginLabels label {
        margin-bottom: 1.5rem;
      }
      
      input {
        width: 80%;
      }
      
      #loginFormButton {
        margin-top: 10px;
        margin-left: 23%;
      }
    }
    
    /*  Media queries desktop  */
    
    @media (min-width: 769px) {
      main {
        grid-template-columns: 50% auto;
      }
      
      .loginForm {
        width: 80%;
        display: flex;
        justify-content: center;
      }
      
      .columnLoginLabels label {
        margin-top: 0.8rem;
        margin-bottom: 1.5rem;
        margin-left: 50px;
      }
      
      .columnLoginForm input {
        width: 100%;
        margin-top: 1rem;
        margin-bottom: 2rem;
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
