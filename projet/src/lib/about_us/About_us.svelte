<script>
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
</script>

<body>
  <div class="container">
    <Header />
    <main>
      <section class="leftBlock">
        <div class="guessWhatText">
          <h1>Guess What ?</h1>
          <!--On garde la div ?-->
        </div>
        <div class="aboutTitle">
          <h2>Á propos</h2>
        </div>
        <div class="aboutText">
          <h3>Qui sommes nous</h3>
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Odio sint
            ullam quasi saepe suscipit tempora alias, totam qui! Nihil dolore,
            aspernatur labore numquam consequuntur dolorum voluptas non
            consequatur quisquam suscipit.
          </p>
          <h3>Notre projet</h3>
          <p>
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Corrupti
            id ipsam, expedita fugiat modi beatae nulla deserunt ab ipsa dicta
            accusamus nemo magnam obcaecati. Soluta voluptatem quaerat ab quos
            illum?
          </p>
        </div>
      </section>
      <aside>
        <div>
          <p>Username</p>
          <a href="#"> <span id="statusUser">Déconnecter</span></a>
        </div>
        <a href=""
          ><img
            class="homeButton"
            src="../../src/assets/Bouton Retour Accueil.png"
            alt="button go back to the home page"
          /></a
        >
        <button>Inscription</button>
        <button>Connexion</button>
        <button>Scores</button>
        <a class="contact" href="#">Contact</a>
        <a class="contact" href="#">À propos</a>
      </aside>
      <Footer />
    </main>
  </div>
</body>

<style>

  /*About_us page*/
.aboutTitle {
  text-align: center;
  font-size: large;
  margin-bottom: 50px;
}

.aboutText {
  text-align: center;
}

.aboutText h3 {
  margin-top: 50px;
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
    border-radius: 2px;
    margin-left: 1rem;
  }

  aside a {
    text-decoration: none;
    color: var(--text-color);
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

  /*  Media queries tablet version  */
  @media (min-width: 426px) and (max-width: 768px) {



    .homeButton {
      max-width: 300px;
    }
  }

  /*  media queries desktop version  */
  @media (min-width: 769px) {



    aside div {
      margin: 1.9rem;
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
      max-width: 250px;
      margin: 2rem;
      font-size: 150%;
    }

    aside a.contact {
      max-width: 50%;
      text-align: center;
      margin-top: 1rem;
      font-size: large;
    }
  }
</style>
