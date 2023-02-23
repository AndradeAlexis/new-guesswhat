<script>
    import Header from "../homepage/Header.svelte";
    import Footer from "../homepage/Footer.svelte";
</script>

<Header />

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
            </div>
        </div>
        <button id="addRiddleFormButton">Valider</button>
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

<style>
    /* ADD RIDDLE */

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
  margin-top: 5%;
  padding: 2% 20%;

}

.addRiddleForm input {
  border: 4px solid var(--bg-buttons);
  border-radius: 10px;
  padding: 2%;
  width: 100%;
  margin-top: 5%;
  display: flex;
  flex-direction: column;
  text-align: center;
  z-index: 1;
  
}


#addRiddleFormButton {
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

.dropdownBtn {
  background-color: var(--orange-buttons);
  border: none;  
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
}

.dropdownMain:hover .dropdownThemes {
  display: block;
}
</style>
