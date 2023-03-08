<script context="module">
  import { link } from "svelte-spa-router";
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import { push } from "svelte-spa-router";


  let email;
  let password;

  let userNameArea;

  let userAddressEmail;
  let emailInput;

  let divUserName;
 
  //Creating function to recuperate the token to use it for the log in action

  const handleSubmitForm = async (event) => {
    event.preventDefault();

    //Recovering the token
    const token = await login();

    //Saving the token in the local storage and giving it a key and a value
    localStorage.setItem("token", token);

    // push("/");
  };

  //Creating a function with POST request for log in

  const login = async () => {
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

    const json = await response.json();
    if (response.status === 200) {
      userAddressEmail=emailInput.value;
      const child = document.createElement('p');
      child.textContent = userAddressEmail;
      divUserName.appendChild(child);
      alert("You are connected");
      // push('/');
      return json.data.access_token;
    } else {
      alert("Essayez encore");
    }
  };

//Creating a function allowing to delete the token when user clicks on disconnet button

export const logout = () => {
  localStorage.removeItem('token')
  alert("Vous vous êtes bien déconnecté");
}
  
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
                type="email"
                id="mail"
                name="user_mail"
                placeholder="Email"
                bind:value={email}
                bind:this={emailInput}
              />
              <input
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
          <!-- <p bind:this={userNameArea}></p> -->
          <a href="/connection" use:link on:click={logout}>
            <span id="statusUser">Déconnecter</span></a
          >
        </div>
        <a href="/" use:link
          ><img
            class="homeButton"
            src="../../src/assets/Bouton Retour Accueil.png"
            alt="Retour accueil"
          /></a
        >
        <button
          ><a href="/subscription" use:link class="aside-buttons">Inscription</a
          ></button
        >
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
