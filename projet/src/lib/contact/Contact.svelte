<script>
  import {link} from 'svelte-spa-router';
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
          <!--On garde la div ?-->
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
            <p>06060606</p>
            <p>test@test.com</p>
            <p>@test.test.com</p>
          </div>
        </div>
          <!--- </div >
                 <div class="logos">
                    <span class="logoPhone" >
                    <img class="logoImagesPhone" src="../../src/assets/phone-call.png"
                    alt="phone logo" > 
                    <p>06060606</p>
                </span>
                <span class="logoMail" >
                    <img class="logoImagesMail" src="../../src/assets/at-symbol.png"
                    alt="mail logo"  >
                    <p>test@test.com</p>
                </span>
                <span class="logoTwitter">
                    <img class="logoImagesTwitter" src="../../src/assets/twitter.png"
                    alt="twitter logo" >
                    <p>@test.test.com</p>
                </span>  -->
        </div>
      </section>
      <aside>
        <div>
          <p>Username</p>
          <a href="/connection" use:link> <span id="statusUser">Déconnecter</span></a>
        </div>
        <a href="/" use:link
          ><img
            class="homeButton"
            src="../../src/assets/Bouton Retour Accueil.png"
            alt="button go back to the home page"
          /></a
        >
        <button><a href="/subscription" use:link>Inscription</a></button>
        <button><a href="/connection" use:link>Connexion</a></button>
        <button><a href="/scores" use:link>Scores</a></button>
        <a class="contact" href="/contact" use:link>Contact</a>
        <a class="contact" href="/about_us" use:link>À propos</a>
      </aside>
    </main>
    <Footer />
  </div>
</body>

<style>
  /* Styling the aside section containing the buttons for the homepage, log in, etc. */

  .logoImages img {
    
    width: 10vw;
    height: 10vh;
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

  /*Contact page*/
  .logoTitle {
    text-align: center;
    padding: 30px 30px;
    border-radius: 0.9rem;
    font-weight: bold;
    font-size: larger;
  }

  .logoImages {
   /* max-width: 1%; */
    
  
  }

  .logo-container {
    display: flex;
  }

  

  h2 {
    padding-bottom: 60px;
  }

  /*  Media queries version tablette  */
  @media (min-width: 426px) and (max-width: 768px) {
  }

  /*  Media queries for desktop version */
  @media (min-width: 769px) {
    aside div {
      margin: 1.9rem;
    }

    aside a {
      margin-top: 1.1rem;
    }

    /* Styling the homepage button */
    .homeButton {
      max-width: 250px;
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
