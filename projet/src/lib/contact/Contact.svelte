<script>
  import Header from "../homepage/Header.svelte";
  import Footer from "../homepage/Footer.svelte";
</script>

<body>
  <div class="container">
    <Header />
    <main>
      <section>
        <div class="guessWhatText">
          <h1>Guess What ?</h1>
        </div>
        <div class="logoTitle">
          <h2>Reste en contact</h2>
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Odio sint
            ullam quasi saepe suscipit tempora alias, totam qui! Nihil dolore,
            aspernatur labore numquam consequuntur dolorum voluptas non
            consequatur quisquam suscipit.
          </p>

          <div class="logo-container">
            <div class="logoImages">
              <img
                class="logoImagesPhone"
                src="../../src/assets/phone-call.png"
                alt="phone logo"
              />
              <img
                class="logoImagesMail"
                src="../../src/assets/at-symbol.png"
                alt="mail logo"
              />
              <img
                class="logoImagesTwitter"
                src="../../src/assets/twitter.png"
                alt="twitter logo"
              />
            </div>

            <div class="logoText">
              <p>0612345678</p>
              <p>guesswhat@fake.com</p>
              <p>@GuessWhatGame</p>
            </div>
          </div>
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
  /* Styling the aside section containing the buttons for the homepage, log in, etc. */

  /*Contact page*/

  h2 {
    padding-bottom: 30px;
  }

  .logoTitle {
    text-align: center;
    padding: 30px 30px;
    border-radius: 0.9rem;
    font-weight: bold;
    font-size: larger;
  }

  .logoTitle p {
    font-size: small;
    margin-bottom: 30px;
  }

  .logo-container {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .logoImages {
    display: flex;
    flex-direction: column;
  }

  .logoImages img {
    height: 30px;
    margin-right: 10px;
    margin-bottom: 10px;
    margin-top: 10px;
  }

  .logoText {
    display: flex;
    flex-direction: column;
  }

  .logoText p {
    height: 30px;
    margin-bottom: 10px;
    margin-top: 10px;
    padding-top: 5px;
    font-size: medium;
    text-align: start;
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
    .homeButton {
      max-width: 300px;
    }
  }
  

  /*  Media queries for desktop version */
  @media (min-width: 769px) {

 /*Contact page*/

  .logoTitle p {
    font-size: medium;
  }

  .logoImages img {
    height: 60px;
  }

  .logoText {
    display: flex;
    flex-direction: column;
  }

  .logoText p {
    height: 60px;
    padding-top: 20px;
    font-size: large;

  }

    aside div {
      margin: 1.9rem;
    }

    aside a {
      margin-top: 1.1rem;
    }

    #statusUser {
        background-color: var(--orange-buttons);
        color: var(--blue-text);
        border-radius: 20px;
        padding: 5px;
        margin-left: none;
    }

    /* Styling the homepage button */
    .homeButton {
max-width: 45%;
}

    /* Styling the remaining navigation buttons */

    aside button {
      max-width: 250px;
      margin: 2rem;
    }

    aside a.contact {
      text-align: center;
      margin-top: 1rem;
      font-size: large;
    }
  }
</style>
