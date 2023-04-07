<script>
  import { link } from "svelte-spa-router";
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
  import { push } from "svelte-spa-router";
  import { logout } from "../connection/Connection.svelte";
  import { refreshPage } from "../functions/Functions.svelte";
  import { isNotValidANswer } from "../functions/Functions.svelte";
  import Accueil from "../../assets/Accueil.png";

  //Creating a variable username to recover its value from local storage and display it when user is connected.
  let username = localStorage.getItem("username");

  //Creating variables for POST request when adding a riddle to the database
  let name;
  let answer;
  let theme_id;
  let hint;
  let hint2;
  let hint3;
  let hint4;
  let hint5;
  let hint6;

  //Creating values to target the user inputs in the form for form securization

  let riddleArea;
  let riddleResponseArea;
  let hintInputArea;
  let hintInput2Area;
  let hintInput3Area;
  let hintInput4Area;
  let hintInput5Area;
  let hintInput6Area;

  //Creating a function to add a Riddle in the Database when an administrator is connected
  const addingRiddle = async () => {
    const response = await fetch(
      import.meta.env.VITE_URL_DIRECTUS + "items/Riddle",
      {
        method: "POST",
        headers: {
          "content-type": "application/json",
          Authorization: "Bearer " + localStorage.getItem("token"),
        },
        body: JSON.stringify({
          name: name,
          answer: answer,
          theme_id: theme_id,
          clues: [
            {
              name: hint,
            },
            {
              name: hint2,
            },
            {
              name: hint3,
            },
            {
              name: hint4,
            },
            {
              name: hint5,
            },
            {
              name: hint6,
            },
          ],
        }),
      }
    );

    //Extracting the token and returning it
    const json = await response.json();
    if (response.status === 200) {
      alert("Votre énigme a été soumise");
      push("/add_a_riddle");
      return json.data.access_token;
    } else {
      alert("Essayez encore");
    }
    return json.data;
  };

  //Creating function for when submitting the form
  const handleSubmitRiddle = async (event) => {
    event.preventDefault();

    //Targeting the input values submitted by the user
    let riddle = riddleArea.value;
    let riddleResponse = riddleResponseArea.value;
    let hintInput = hintInputArea.value;
    let hintInput2 = hintInput2Area.value;
    let hintInput3 = hintInput3Area.value;
    let hintInput4 = hintInput4Area.value;
    let hintInput5 = hintInput5Area.value;
    let hintInput6 = hintInput6Area.value;

    //Creating conditions to alert the user if they are trying to submit data with special characters in them.
    if (isNotValidANswer(riddle)) {
      alert("Votre énigme ne doit pas contenir de caractères spéciaux");
      return false;
    } else if (isNotValidANswer(riddleResponse)) {
      alert("Votre réponse ne doit pas contenir de caractères spéciaux");
      return false;
    } else if (isNotValidANswer(hintInput)) {
      alert("Les indices ne doivent pas contenir de caractères spéciaux");
      return false;
    } else if (isNotValidANswer(hintInput2)) {
      alert("Les indices ne doivent pas contenir de caractères spéciaux");
      return false;
    } else if (isNotValidANswer(hintInput3)) {
      alert("Les indices ne doivent pas contenir de caractères spéciaux");
      return false;
    } else if (isNotValidANswer(hintInput4)) {
      alert("Les indices ne doivent pas contenir de caractères spéciaux");
      return false;
    } else if (isNotValidANswer(hintInput5)) {
      alert("Les indices ne doivent pas contenir de caractères spéciaux");
      return false;
    } else if (isNotValidANswer(hintInput6)) {
      alert("Les indices ne doivent pas contenir de caractères spéciaux");
      return false;
    }

    const newRiddle = await addingRiddle();
    name = "";
    answer = "";
    theme_id = "";
    hint = "";
    hint2 = "";
    hint3 = "";
    hint4 = "";
    hint5 = "";
    hint6 = "";
    return newRiddle;
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
                  required
                  id="clue_4"
                  name="clue_name"
                  placeholder="Indice 4"
                  bind:this={hintInput4Area}
                  bind:value={hint4}
                />
                <input
                  type="text"
                  required
                  id="clue_5"
                  name="clue_name"
                  placeholder="Indice 5"
                  bind:this={hintInput5Area}
                  bind:value={hint5}
                />
                <input
                  type="text"
                  required
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
        <div>
          {#if localStorage.getItem("token")}
            <p>{username}</p>
            <a href="/" use:link on:click={logout} on:click={refreshPage}>
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
