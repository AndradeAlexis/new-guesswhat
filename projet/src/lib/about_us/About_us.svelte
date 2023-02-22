<script>
    import Footer from "../homepage/Header.svelte";
    import Header from "../homepage/Footer.svelte";
</script>

<Header />

<section>
    <div class="guessWhatText">
        <h1>Guess What ?</h1>
        <!--On garde la div ?-->
    </div>
    <div class="aboutTitle">
        <h2>Á propos</h2>
    </div>
    <div class="aboutText">
        <h3>Qui sommes nous</h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Odio sint ullam quasi saepe suscipit
            tempora
            alias, totam qui! Nihil dolore, aspernatur labore numquam consequuntur dolorum voluptas non
            consequatur quisquam suscipit.</p>
        <h3>Notre projet</h3>
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Corrupti id ipsam, expedita fugiat modi
            beatae nulla deserunt ab ipsa dicta accusamus nemo magnam obcaecati. Soluta voluptatem quaerat
            ab
            quos illum?</p>
    </div>
</section>
<aside>
    <div>
        <p>Username</p>
        <a href="#"> <span id="statusUser">Déconnecter</span></a>
    </div>
    <a href=""><img class="homeButton" src=".../../src/assets/Bouton Retour Accueil.png"
            alt="button go back to the home page"></a>
    <button>Inscription</button>
    <button>Connexion</button>
    <button>Scores</button>
    <a class="contact" href="#">Contact</a>
    <a class="contact" href="#">À propos</a>
</aside>
<Footer />