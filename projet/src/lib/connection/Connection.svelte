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

    <h2 id="loginFormTitle">Formulaire de connexion</h2>
    <form>
        <div class="loginForm">
            <div class="columnLoginForm">
                <label for="mail">Adresse email</label>
                <label for="password">Mot de passe</label>
            </div>

            <div class="columnLoginForm">
                <input
                    type="email"
                    id="mail"
                    name="user_mail"
                    placeholder="Email"
                />
                <input
                    type="password"
                    id="password"
                    name="user_password"
                    placeholder="Mot de passe"
                />
            </div>
        </div>
        <button id="loginFormButton">Connexion</button>
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
    <button>Inscription</button>
    <button>Scores</button>
    <a class="contact" href="#">Contact</a>
    <a class="contact" href="#">À propos</a>
</aside>

<Footer />


<style>

/* LOGIN */

#loginFormTitle {
  text-align: center;
}

.loginForm {
  width: 100%;
  padding: 1rem;
  display: flex;
}

.columnLoginForm {
  flex: 50%;
}

.loginForm label {
  font-weight: bold;
  display: flex;
  flex-direction: column;
  margin-top: 5%;
  padding: 5% 20px;

}

.loginForm input {
  border: 4px solid var(--bg-buttons);
  border-radius: 10px;
  padding: 12px 20px;
  margin-top: 5%;
  display: flex;
  flex-direction: column;
}


#loginFormButton {
  width: 250px;
  padding: 1rem;
  background-color: var(--orange-buttons);
  color: var(--blue-text);
  font-weight: bolder;
  border: 10px var(--blue-outlines)solid;
  border-radius: 15px;
  font-family: 'Mentimun';
  font-size: 125%;
  margin-top: 40px;
  height: 50%;

}

</style>
