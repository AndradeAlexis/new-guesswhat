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
    <!--On garde la div ?-->
  </div>
<div class="logoTitle">
                    <h2>Reste en contact</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Odio sint ullam quasi saepe suscipit
                        tempora alias, totam qui! Nihil dolore, aspernatur labore numquam consequuntur dolorum voluptas
                        non consequatur quisquam suscipit.</p>
                </div >
                 <div class="logos">
                    <span>
                    <img class="logoImages" src="../../src/assets/phone-call.png"
                    alt="phone logo" > 
                    <p>06060606</p>
                </span>
                <span >
                    <img class="logoImages" src="../../src/assets/at-symbol.png"
                    alt="mail logo"  >
                    <p>test@test.com</p>
                </span>
                <span >
                    <img class="logoImages" src="../../src/twitter.png"
                    alt="twitter logo" >
                    <p>@test.test.com</p>
                </span>
            </div>
            </section>
            <aside>
              <div>
                  <p>Username</p>
                  <a href="#"> <span id="statusUser">Déconnecter</span></a>
              </div>
              <a href=""><img class="homeButton" src="../../src/assets/Bouton Retour Accueil.png"
                      alt="button go back to the home page"></a>
              <button>Inscription</button>
              <button>Connexion</button>
              <button>Scores</button>
              <a class="contact" href="#">Contact</a>
              <a class="contact" href="#">À propos</a>
          </aside>
          </main>
<Footer />
</div>
</body>

<style>
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

    /*Contact page*/
.logoTitle {
  text-align: center;
  padding: 30px 30px ;
  border-radius: 0.9rem;
  font-weight: bold;
  font-size:larger;
}

.logos {
  
  border:5px var(--bg-buttons) solid;
  padding: 30px 30px;
  margin-left: 100px;
 border-radius: 0.9rem;
 
}

.logoImages {
  width : 10%;
  height : 10%;
  margin-left: 50px;
}
 h2 {
  padding-bottom: 60px;
 }



</style>