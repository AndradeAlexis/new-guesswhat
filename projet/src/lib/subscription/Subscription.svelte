<script>
    import Header from "../homepage/Header.svelte";
    import Footer from "../homepage/Footer.svelte";
</script>

<body>
<div class="container">
<Header />
<main>
<section class="leftBlock">
    <div class="guessWhatText">
        <h1>Guess What ?</h1>
        <!--On garde la div ?-->
    </div>

    <h2 id="subscriptionFormTitle">Formulaire d'inscription</h2>
    <form>
        <div class="subscriptionForm">
            <div class="columnSubscriptionForm">
                <label for="name">Adresse email</label>
                <label for="mail">Nom d'utilisateur</label>
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
</main>
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
  margin: 4%;
  padding: 5%;
}

.subscriptionForm input {
  border: 4px solid var(--bg-buttons);
  border-radius: 10px;
  padding: 2%;
  width: 100%;
  margin-top: 6%;
  display: flex;
  flex-direction: column;
}


#subscriptionFormButton {
  width: 200px;
  padding: 1rem;
  background-color: var(--orange-buttons);
  color: var(--blue-text);
  font-weight: bolder;
  border: 10px var(--blue-outlines)solid;
  border-radius: 15px;
  font-family: 'Mentimun';
  font-size: 125%;
  margin: 30px auto 0 auto;
  height: 50%;
  display: block;
}

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

    .homeButton {
        display:block;
        max-width: 80%;
        margin: 0.5rem auto;
    }

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

.homeButton {
  width: 300px;
}

input {
    margin-left: -150px;
}

#subscriptionFormButton {
    margin-top: -10px;
}
}

/*  media queries of desktop  */

@media (min-width: 769px) {
input {
  margin-left: -150px;
}

.homeButton {
max-width: 45%;
}

#statusUser {
background-color: var(--orange-buttons);
border-radius: 2px;
margin-left: none;
}

aside a {
margin-top: 1.1rem;
}

aside button {
max-width: 300px;
}

aside a.contact{
margin-top: 1rem;
font-size: large;
}

}

 

  </style>