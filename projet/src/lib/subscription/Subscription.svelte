<script>
  import { link } from "svelte-spa-router";
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import { push } from "svelte-spa-router";
  import {logout} from "../connection/Connection.svelte";

  //Creating the variables for the subscription form
  let first_name;
  let email;
  let password;
  let role = "1a7bf53e-50c7-4125-ba73-7d3a4bc726df";

  //Creating a variable to target the text area for username
  let textArea;

  //Creating a variable to target the text area for the email address
  let userEmailArea;

  //Creating a variable to target the text area for the password
  let userPasswordArea;

  //Creating function with POST request allowing the user to submit his information for user account creation
  async function createUser() {
    try {
      let endpoint = import.meta.env.VITE_URL_DIRECTUS + "users"; 

      const response = await fetch(endpoint, {
        method: "POST",
        headers: {
          "content-type": "application/json",
        },
        body: JSON.stringify({
          "first_name": first_name,
          "email": email,
          "password": password,
          "role": role
        })
      });

      //If no error, user is alerted that account has been created and redirected to login page
      if (response.status === 204) {
      alert("Votre compte a été créé.");
      push("/connection");
      return [];
    } else {
      const data = await response.json();
      alert("Erreur, veuillez réessayer.");
      console.error(data.errors);
      return [];
    }
  } catch (error) {
    alert("Erreur, veuillez réessayer.");
    console.error(error);
    return [];
  }
}

  //Function allowing to create a user on submit, emptying form after submission
    const handleSubmitUser = async (event) => {
    event.preventDefault();

    //Creating a condition to alert the user if the username exceeds/is less than required length

    let userName = textArea.value;

    if (userName.length <= 20 && userName.length >= 5) {} else {
    alert("Le nom d'utilisateur doit comporter entre 5 et 20 caractères")
    return false;
  }

    //Creating a condition to alert the user if he's trying to create a duplicate account
    let userEmail = userEmailArea.value;

    //Creating a condition to alert the user if username exceeds/is less than required length
    let userPassword = userPasswordArea.value;
    
    //Creating a condition to alert the user if the password exceeds/is less than required length
    if (userPassword.length <= 20 && userPassword.length >= 8) {} else {
    alert("Le mot de passe doit comporter entre 8 et 20 caractères")
    return false;
  }
    
    const user = await createUser();
    //Emptying the text area
     first_name = "";
     email = "";
     password = "";
     return user;
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
                bind:value={first_name}/>

              <input
                type="email" 
                required
                id="mail"
                name="user_mail"
                placeholder="Email"
                bind:this={userEmailArea}
                bind:value={email}/>
              
                <input
                type="password" 
                required
                id="password"
                name="user_password"
                placeholder="Mot de passe"
                bind:this={userPasswordArea}
                bind:value={password}/>

              <button id="subscriptionFormButton">Valider</button>
            </div>
          </div>
        </form>
      </section>
      <aside aria-label="menu de navigation">
        <div>
         
          {#if localStorage.getItem('token')} 
          <p>Username</p>
          <a href="/subscription" use:link on:click={logout}> <span id="statusUser">Déconnecter</span></a>
          {/if}
        </div>
        <a href="/" use:link><img
            class="homeButton"
            src="../../src/assets/Bouton Retour Accueil.png"
            alt="Retour accueil"/></a>
        {#if !localStorage.getItem('token')}        
    <button><a href="/subscription" use:link class="aside-buttons">Inscription</a></button>
    <button><a href="/connection" use:link class="aside-buttons">Connexion</a></button>
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
        cursor: pointer;
        border: 0.7rem var(--bg-buttons)solid;
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
