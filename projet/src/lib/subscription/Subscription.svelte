<script>
    import Header from "../homepage/Header.svelte";
    import Footer from "../homepage/Footer.svelte";
</script>

<Header />

<section class="leftBlock">
    <div class="guessWhatText">
        <h1>Guess What ?</h1>
        <!--On garde la div ?-->
    </div>

    <h2 id="subscriptionFormTitle">Formulaire d'inscription</h2>
    <form>
        <div class="subscriptionForm">
            <div class="columnSubscriptionForm">
                <label for="name">Nom d'utilisateur</label>
                <label for="mail">Adresse email</label>
                <label for="password">Mot de passe</label>
            </div>
            <div class="columnSubscriptionForm">
                <input
                    type="email"
                    id="mail"
                    name="user_mail"
                    placeholder="Email"
                />
                <input
                    type="text"
                    id="name"
                    name="user_name"
                    placeholder="Username"
                />
                <input
                    type="password"
                    id="password"
                    name="user_password"
                    placeholder="Mot de passe"
                />
            </div>
        </div>
        <button id="subscriptionFormButton">Valider</button>
    </form>
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
    <button>Connexion</button>
    <button>Scores</button>
    <a class="contact" href="#">Contact</a>
    <a class="contact" href="#">À propos</a>
</aside>

<Footer />
