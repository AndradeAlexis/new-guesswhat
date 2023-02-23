<script>
    import Header from "../homepage/Header.svelte";
    import Footer from "../homepage/Footer.svelte";
</script>

<Header/>

<section>
    <div class="guessWhatText">
        <h1>Guess What ?</h1>
        <!--On garde la div ?-->
    </div>

    <div class="text404">
        <h2>La page que vous avez demandée n'existe pas</h2>
        <img class="image404" src="../../src/assets/Mascotte 404.png" />
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
        /></a>
    
    <button>Inscription</button>
    <button>Connexion</button>
    <button>Scores</button>
    <a class="contact" href="#">Contact</a>
    <a class="contact" href="#">À propos</a>
</aside>

<Footer/>

<style>
/*404 page*/
.text404 {

text-align: center;
border:5px var(--bg-buttons) solid;
padding: 50px 50px;
margin-left: 35px;
border-radius: 0.9rem;
}

.image404 {
  width : 300px;
  height : 300px;
  
}
</style>