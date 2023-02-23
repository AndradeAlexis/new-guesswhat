<script>
    import Header from "../homepage/Header.svelte";
    import Footer from "../homepage/Footer.svelte";
</script>

<Header />

<section>
    <div class="guessWhatText">
        <h1>Guess What?</h1>
    </div>
    <div class="score-table">
        <h2>Tableau des scores</h2>
        <!-- je ne pense pas qu'on fera un tableau en HTML comme ça mais c'est pour l'exemple ....-->
        <table>
            <tr>
                <td>Rang</td>
                <td>Nom</td>
                <td>Score</td>
            </tr>
            <tr>
                <td>1</td>
                <td>User1</td>
                <td>999</td>
            </tr>
            <tr>
                <td>2</td>
                <td>User2</td>
                <td>879</td>
            </tr>
            <tr>
                <td>3</td>
                <td>User3</td>
                <td>769</td>
            </tr>
            <tr>
                <td>4</td>
                <td>User4</td>
                <td>634</td>
            </tr>
            <tr>
                <td>5</td>
                <td>User5</td>
                <td>514</td>
            </tr>
        </table>
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

    <a class="contact" href="#">Contact</a>
    <a class="contact" href="#">À propos</a>
</aside>


<Footer />

<style>
/* SCORE PAGE */

div.score-table {
  margin-left: 3rem;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.score-table h2 {
  text-align: center;
  margin-bottom: 1rem; 
}

table {
  margin: 1rem;
  width: 100%;
  border: 2px var(--text-color) solid;
}

td {
  padding: 1rem;
}

  </style>