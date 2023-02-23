<script>
    import Header from "../homepage/Header.svelte";
    import Footer from "../homepage/Footer.svelte";
</script>

<Header />


<main class="defined-theme-game">


<section id="defined-theme">
    <div>
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
            <textarea name="response" id="response" cols="28" rows="6" placeholder="Réponses"></textarea>
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
</main>
<Footer />

<style>
    /* DEFINED THEME GAME PAGE*/

.defined-theme-game {
  display: grid;
  grid-template-columns: 55% auto auto;
}

section#defined-theme {
  border: 0.7rem var(--blue-outlines)solid;
  margin-top: -0.7rem;
  margin-left: -0.7rem;
  border-radius: 0.9rem;
  text-align: center;
  padding: 1rem;
}


div.hints {
  text-align: center;
  border: 0.7rem var(--blue-outlines)solid;
  border-radius: 0.9rem;
  margin: 1.5rem auto;
  width: 60%;
}
div.gamer-response {
  width: 50%;
  display: flex;
  margin: 1rem auto;
  justify-content: center; 
}

textarea {
  border-radius: 0.5rem;
  padding: 1rem;
}

.response-buttons button {
  display: block;
  margin: 0 0 2rem 0.8rem;
  width: 100%;
  padding: 1rem;
  background-color: var(--orange-buttons);
  border: 0.7rem var(--blue-outlines)solid;
  color: var(--blue-text);
  font-weight: bolder;
  border-radius: 0.9rem;
  font-family: 'Mentimun';
  font-size: 125%;   
}

div.score {
  display: flex;
  justify-content: center;
}

nav {
  display: flex;
  flex-direction: column;
  justify-content:flex-start;
  align-items: flex-start;

}

nav div img {
  width: 100%;
  background-color: var(--bg-images);
  border: var(--blue-outlines) solid 5px;
  border-radius: 10px;
  margin-left: -5px;
  margin-top: -5px;
}

nav div img:hover {
  background-color: var(--bg-buttons);
}

.clueDark {
  background-color: #0d4240;
  border: 2px solid #0d4240;
  padding: 1rem;
  margin: 0px;
}

.clueLight {
  background-color: #0f4d4a;
  border: 2px solid #0f4d4a;
  padding: 1rem;
  margin: 0px;
}
</style>