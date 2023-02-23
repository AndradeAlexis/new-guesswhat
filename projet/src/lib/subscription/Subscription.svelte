<script>
    import Header from "../homepage/Header.svelte";
    import Footer from "../homepage/Footer.svelte";
</script>

<body>
<div class="container">
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

</div>
</body>

<style>
/* SUBSCRIPTION */

#subscriptionFormTitle {
  text-align: center;
}


.subscriptionForm {
  width: 100%;
  padding: 1rem;
  display: flex;
}

.columnSubscriptionForm {
  flex: 50%;
}

.subscriptionForm label {
  font-weight: bold;
  display: flex;
  flex-direction: column;
  margin-top: 5%;
  padding: 5% 20px;

}

.subscriptionForm input {
  border: 4px solid var(--bg-buttons);
  border-radius: 10px;
  padding: 12px 20px;
  margin-top: 5%;
  display: flex;
  flex-direction: column;
}


#subscriptionFormButton {
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