<script context="module">
  import { link } from "svelte-spa-router";
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import { push } from "svelte-spa-router";
  import { refreshPage } from "../functions/Functions.svelte";
  import Accueil from "../../assets/Accueil.png";

  //Creating variables for user input: email and password
  let email;
  let password;

  //Creating variables to use later to target the user's email input
  export let userAddressEmail;
  export let emailInput;

  //Creating a variable to target the div where we want to display the username
  let divUserName;

  //Creating variables to use later when recovering data related to the array users
  export let users = [];
  export let userId = 0;
  export let username;
  let usernameToDisplay = localStorage.getItem("username");

  let role;

  //Creating function to recuperate the token to use it for the log in action

  const handleSubmitForm = async (event) => {
    event.preventDefault();

    //Recovering the token
    const token = await login();

    //Saving the token in the local storage and giving it a key and a value
    localStorage.setItem("token", token);
    if (token === null) {
      alert("Essayez encore");
    } else {
      alert("Vous êtes connectés");
    }

    push("/");
  };

  //Creating a function with POST request for log in

  export const login = async () => {
    const response = await fetch(
      import.meta.env.VITE_URL_DIRECTUS + "auth/login",
      {
        method: "POST",
        headers: {
          "content-type": "application/json",
        },
        body: JSON.stringify({
          email: email,
          password: password,
        }),
      }
    );

    //Creating a function to recover the username from the database based on the address email the user inputs when logging in

    const getUsername = async () => {
      //Recovering the email value the user submits when connecting
      userAddressEmail = emailInput.value;
      //Filtering data based on email address, so when the user inputs his email, we recover the username and role associated with the submitted email address.
      const response = await fetch(
        import.meta.env.VITE_URL_DIRECTUS +
          "users?fields=first_name,email,role&filter[email]=" +
          userAddressEmail
      );
      const json = await response.json();
      users = json.data;
      username = users[userId].first_name;
      role = users[userId].role;
      //Storing username and role in local storage so that we can recover it and use it on the other components
      localStorage.setItem("username", username);
      refreshPage();
      //Creating a condition so that if role equals administrator, we store the role in local storage to use it in other components.
      if (users[userId].role === "408cffe3-49d2-4d41-96d9-1286f008eb4b") {
        localStorage.setItem("role", role);
        // refreshPage();
      }
      return username;
    };

    getUsername();

    const json = await response.json();
    console.log(json);
    email = "";
    password = "";

    return json.data.access_token;
  };

  //Creating a function allowing to delete the token when user clicks on disconnet button

  export const logout = () => {
    //Removing token and username when user clicks on disconnet button
    localStorage.removeItem("token");
    localStorage.removeItem("username");
    localStorage.removeItem("role");
    alert("Vous vous êtes bien déconnecté");
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
        <form on:submit={handleSubmitForm}>
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
                bind:this={emailInput}
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
            <p>{usernameToDisplay}</p>
            <a
              href="/connection"
              use:link
              on:click={logout}
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
