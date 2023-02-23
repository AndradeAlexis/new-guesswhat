<script>
    import Header from "../homepage/Header.svelte";
    import Footer from "../homepage/Footer.svelte";
</script>

<Header />

<main class="random-theme-game">
    <section id="random-theme">
        <div>
            <h1>Guess What ?</h1>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Veniam,
                corporis ipsam! Quos debitis deserunt fugit eaque hic, tempore
                cupiditate. Facilis, dolorum dolores nemo, officia, sint amet
                eveniet deleniti iste velit error eius.
            </p>
            <p>
                <!-- Congratulations message or losing message appearing here -->
            </p>
        </div>
        <div class="hints">
            <p>Indice 1</p>
            <p>Indice 2</p>
            <p>Indice 3</p>
            <p>Indice 4</p>
            <p>Indice 5</p>
            <p>Indice 6</p>
        </div>
        <div class="gamer-response">
            <div>
                <textarea
                    name="response"
                    id="response"
                    cols="28"
                    rows="12"
                    placeholder="Réponse"
                />
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
</main>

<Footer />

<style>
    /* RANDOM THEME GAME PAGE */

.random-theme-game {
  display: grid;
  grid-template-columns: 60% 40%;
}

section#random-theme {
  border: 0.7rem var(--orange-buttons)solid;
  border-radius: 0.9rem;
  text-align: center;
  padding: 1rem;
}
</style>
