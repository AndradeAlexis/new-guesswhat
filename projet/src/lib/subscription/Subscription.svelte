<script>
  import { link } from "svelte-spa-router";
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";

  let name;
  let email;
  let password;
  let roles;

  async function createUser() {
    try {
      let endpoint = import.meta.env.VITE_DIRECTUS_API_URL + "items/User";

      const response = await fetch(endpoint, {
        method: "POST",
        headers: {
          "content-type": "application/json",
        },
        body: JSON.stringify({
          "name": name,
          "email": email,
          "password": password,
           "roles": roles
        })
      });

      const data = await response.json();
      console.log("item created");
      return data.data;
    } catch (error) {
      console.log("Error during fetch");
      console.error(error);
      return [];
    }
  }

  const handleSubmitUser = async (event) => {
    event.preventDefault();

    const user = await createUser();
    return user;
    //Emptying the text area
    // name = "";
    // email = "";
    // password= "";
    // roles = "Joueur";
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
              <label for="mail">Nom d'utilisateur</label>
              <label for="name">Adresse email</label>
              <label for="password">Mot de passe</label>
              <label for="role">Role</label>
            </div>
            <div class="columnSubscriptionForm">
              <input
                type="text"
                id="name"
                name="user_name"
                placeholder="Username"
                bind:value={name}
              />
              <input
                type="email"
                id="mail"
                name="user_mail"
                placeholder="Email"
                bind:value={email}
              />
              <input
                type="password"
                id="password"
                name="user_password"
                placeholder="Mot de passe"
                bind:value={password}
              />
              <input bind:value={roles} type="text" id="role" name="role" />
              <button id="subscriptionFormButton">Valider</button>
            </div>
          </div>
        </form>
      </section>
      <aside aria-label="menu de navigation">
        <div>
          <p>Username</p>
          <a href="/connection" use:link>
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
          ><a href="/connection" use:link class="aside-buttons">Connexion</a
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
