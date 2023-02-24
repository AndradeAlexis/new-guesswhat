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
        </div>
    
        <h2 id="addRiddleFormTitle">Ajouter une devinette</h2>
        <form>
            <div class="addRiddleForm">
                <div class="columnAddRiddleForm">
                    <label for="riddle">Choisissez le thème</label>
                    <label for="riddle">Ecrivez votre énigme</label>
                    <label for="answer">Ecrivez votre réponse</label>
                    <label for="clue">Donnez des indices</label>
                    <label for="clue" />
                    <label for="clue" />
                </div>
                <div class="columnAddRiddleForm">
                    <div class="dropdownMain">
                        <button class="dropdownBtn">Thème</button>
                        <div class="dropdownThemes">
                            <p>Cinéma</p>
                            <p>Animaux</p>
                            <p>Musique</p>
                        </div>
                    </div>
                    <div>
                    <input
                        type="text"
                        id="riddle"
                        name="riddle_name"
                        placeholder="Énigme"
                    />
                    <input
                        type="text"
                        id="answer"
                        name="answer_name"
                        placeholder="Réponse"
                    />
                    <input
                        type="text"
                        id="clue_1"
                        name="clue_name"
                        placeholder="Indice 1"
                    />
                    <input
                        type="text"
                        id="clue_2"
                        name="clue_name"
                        placeholder="Indice 2"
                    />
                    <input
                        type="text"
                        id="clue_3"
                        name="clue_name"
                        placeholder="Indice 3"
                    />
                    <input
                        type="text"
                        id="clue_4"
                        name="clue_name"
                        placeholder="Indice 4"
                    />
                    <input
                        type="text"
                        id="clue_5"
                        name="clue_name"
                        placeholder="Indice 5"
                    />
                    <input
                        type="text"
                        id="clue_6"
                        name="clue_name"
                        placeholder="Indice 6"
                    />
                    <button id="addRiddleFormButton">Valider</button>
                </div>
                
            </div>
            <!-- <button id="addRiddleFormButton">Valider</button> -->
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
  
    /* ADD A RIDDLE FORM */

#addRiddleFormTitle {
  text-align: center;
}

.addRiddleForm {
  width: 100%;
  padding: 1rem;
  display: flex;
}

.columnAddRiddleForm {
  flex: 50%;
}

.addRiddleForm label {
  font-weight: bold;
  display: flex;
  flex-direction: column;
  margin: 5%;
  padding: 5%;
}

.addRiddleForm input {
  border: 4px solid var(--bg-buttons);
  border-radius: 10px;
  padding: 2%;
  width: 100%;
  margin-top: 8%;
  display: flex;
  flex-direction: column;
  text-align: center;
  z-index: 1;
  
}

#addRiddleFormButton {
  width: 100%;
  padding: 1rem;
  background-color: var(--orange-buttons);
  color: var(--blue-text);
  font-weight: bolder;
  border: 10px var(--blue-outlines)solid;
  border-radius: 15px;
  font-family: 'Mentimun';
  font-size: 125%;
  display: block;
  margin: 30px auto 0 auto; 
}

.dropdownMain {
  display: inline-block;
  background-color: var(--orange-buttons);
  color: var(--blue-text);
  border: 4px var(--blue-outlines)solid;
  cursor: pointer;
  border-radius: 10px;
  padding: 2%;
  width: 100%;
  margin-top: 5%;
}

button.dropdownBtn {
  background-color: var(--orange-buttons);
  border: none;  
  font-family: 'Mentimun';
  text-align: center;
}

.dropdownThemes {
  background-color: var(--bg-images);
  color: var(--bg-buttons);
  border: 2px solid var(--blue-outlines);
  border-radius: 4px;
  display: none;
  z-index: 2;
  right: 52%;
}

.dropdownThemes p {
  color: var(--bg-buttons);
  background-color: var(--bg-images);
  text-decoration: none;
  display: block;
  text-align: center;
}

.dropdownMain:hover .dropdownThemes {
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

h2 {
  margin-bottom: 1rem;
}

input, .dropdownMain {
    margin-bottom: 12px;
    margin-left: -50px;
    width: 100%; 
}

#addRiddleFormButton {
  margin-left: -50px;
 
}


}

/*  Media queries for desktop version */
@media (min-width: 769px) {

  main {
  grid-template-columns: 55% auto;
} 

.addRiddleForm {
  width: 80%;
  display: flex;
  justify-content: center;
}

input,  .dropdownMain {
    margin-bottom: 11px;
    margin-left: -30px;
    width: 100%;
}

#addRiddleFormButton {
 margin-left: -2.5rem;
  
}

aside div {
margin: 1.9rem;
margin-top: -15rem;
}

#statusUser {
background-color: var(--orange-buttons);
border-radius: 2px;
margin-left: none;
}

aside a {
margin-top: 1.1rem;
}

/* Styling the homepage button */
.homeButton {
max-width: 45%;
}

/* Styling the remaining navigation buttons */

aside button {
max-width: 300px;
}

aside a.contact{
margin-top: 1rem;
font-size: large;
}

}

</style>
