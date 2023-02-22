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