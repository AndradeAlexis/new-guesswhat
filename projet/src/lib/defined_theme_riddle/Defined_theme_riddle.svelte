<script>
    import Header from "../homepage/Header.svelte";
    import Footer from "../homepage/Footer.svelte";
</script>


<body>
  <div class="container">
<Header />
<main  class="defined-theme-game">
<section id="defined-theme">
    <div class="guessWhatText">
        <h1>Guess What ?</h1>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Veniam, corporis ipsam! Quos debitis deserunt fugit eaque hic, tempore cupiditate. Facilis, dolorum dolores nemo, officia, sint amet eveniet deleniti iste velit error eius.</p>
        <p>
            <!-- Congratulations message or losing message appearing here -->
        </p>
    </div>
    <div class="hints">
        <p class="clueLight">Indice 1</p>
        <p class="clueDark">Indice 2</p>
        <p class="clueLight">Indice 3</p>
        <p class="clueDark">Indice 4</p>
        <p class="clueLight">Indice 5</p>
        <p class="clueDark">Indice 6</p>
    </div>
    <div class="gamer-response">
        <div>
            <textarea name="response" id="response" placeholder="Réponses"></textarea>
        </div>
        <div class="response-buttons">
            <button>Demandez un indice</button>
            <button>Valider</button>
        </div>
    </div>
    <div class="score">
        <p>Score:</p>
        <p>952</p>
    </div>
    
</section>
<nav>
    <div>
        <a href="#"><img src=".../../src/assets/Mascotte Thème Animaux.png" alt="Mascot for animal riddle theme"></a>
    </div>
    <div>
        <a href="#"><img src=".../../src/assets//Mascotte Thème Cinéma.png" alt="Mascot for cinema riddle theme"></a>
    </div>
    <div>
        <a href="#"><img src=".../../src/assets//Mascotte Thème Musique.png" alt="Mascot for music riddle theme"></a>
    </div>
</nav>
<aside>
    <div>
        <p>Username</p>
        <a href="#"> <span id="statusUser" >Déconnecter</span></a>
    </div>
        <a href=""><img class="homeButton" src=".../../src/assets//Bouton Retour Accueil.png" alt="button go back to the home page"></a>
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
    /* DEFINED THEME GAME PAGE*/



section#defined-theme {
  border: 0.7rem var(--blue-outlines)solid;
  margin-top: -0.7rem;
  margin-left: -0.7rem;
  margin-right: -0.7rem;
  padding-bottom: 0.7rem;
  border-radius: 0.9rem;
  text-align: center;
}


div.hints {
  text-align: center;
  border: 0.7rem var(--blue-outlines)solid;
  border-radius: 0.9rem;
  margin: 1.5rem auto;
  width: 250px;
}
div.gamer-response {
  width: 250px;
  display: block;
  margin: 1rem auto;
  justify-content: center; 
}

textarea {
  border-radius: 0.5rem;
  padding: 1rem;
  width: 100%;
  height: 75px;
}


.response-buttons button {
  display: block;
  margin-bottom: 5px;
  width: 100%;
  padding: 1rem;
  background-color: var(--orange-buttons);
  border: 0.7rem var(--blue-outlines)solid;
  color: var(--blue-text);
  font-weight: bolder;
  border-radius: 0.9rem;
  font-family: 'Mentimun';
  font-size: 75%;   
}

div.score {
  display: flex;
  justify-content: center;
}

nav {
  display: flex;
  justify-content: space-around;
  width: 100%;

}

nav div img {
  width: 100%;
  background-color: var(--bg-images);
  border: var(--blue-outlines) solid 5px;
  border-radius: 10px;
  margin-top: -0.7rem;
}

nav div img:hover {
  background-color: var(--bg-buttons);
}

.clueDark {
  background-color: #0d4240;
  border: 2px solid #0d4240;
  padding: 0.5rem;
  margin: 0px;
  font-size: x-small;
}

.clueLight {
  background-color: #0f4d4a;
  border: 2px solid #0f4d4a;
  padding: 0.5rem;
  margin: 0px;
  font-size: x-small;
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
      display:block;
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

      div.hints {
  width: 50%;
}

div.gamer-response {
  width: 50%;
}

.response-buttons button {
  font-size: 100%;   
}


nav div img {
  margin-top: -0.3rem;
  
}

.clueDark {
  padding: 1rem;
  margin: 0px;
  font-size: medium;
}

.clueLight {
  padding: 1rem;
  margin: 0px;
  font-size: medium;
}

.homeButton {
      display:block;
        max-width: 300px;
        margin: 0.5rem auto;

    }

     }



       /*  media queries of desktop  */
  @media (min-width: 769px) {

/* DEFINED THEME GAME PAGE*/

h1 {
    font-size: 3rem;
}

p {
    font-size: medium;
}

.defined-theme-game {
  display: grid;
  grid-template-columns: 55% auto auto;
}

section#defined-theme {
    margin-right: none;
    padding-bottom: none;
    padding: 1rem;
}


div.hints {
    width: 60%;
}
div.gamer-response {
    width: 50%;
    display: flex;
}

textarea {
    border-radius: 0.5rem;
    padding: 1rem;
    width: 200px;
    height: 150px;
}

.response-buttons button {
    margin: 0 0 2rem 0.8rem;
    color: var(--blue-text);
    font-size: 125%;   
}


nav {
    flex-direction: column;
    justify-content:flex-start;
    align-items: flex-start;

}

nav div img {
    margin-left: 0.35rem;
    margin-top: -5px;
    width: 150%;
}



.clueDark {
    padding: 1rem;
    font-size: medium;
}

.clueLight {
    padding: 1rem;
    font-size: medium;
}

/* Styling the aside section containing the buttons for the homepage, log in, etc. */


aside {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

aside div {
  margin: 1.9rem;
  margin-top: -15rem;
}

#statusUser {
    background-color: var(--orange-buttons);
    border-radius: 2px;;
    margin-left: none;
}

aside a {
    margin-top: 1.1rem;
}

/* Styling the homepage button */
.homeButton {
    max-width: 60%;
    display: block;
    
    
}

/* Styling the remaining navigation buttons */

aside button {
    max-width: 250px;

}

aside a.contact{
    margin-top: 1rem;
    font-size: large;
}
  }
</style>