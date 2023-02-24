<script>
    import Header from "../homepage/Header.svelte";
    import Footer from "../homepage/Footer.svelte";
</script>

<body>
    <div class="container">
  <Header />
  <main>
<section>
    <div class="guessWhatText">
        <h1>Guess What?</h1>
    </div>
    <div class="score-table">
        <h2>Tableau des scores</h2>
        <table>
            <tr class="tabDarkBlue">
                <td>Rang</td>
                <td>Nom</td>
                <td>Score</td>
            </tr>
            <tr class="tabLight">
                <td>1</td>
                <td>User1</td>
                <td>999</td>
            </tr>
            <tr class="tabDark">
                <td>2</td>
                <td>User2</td>
                <td>879</td>
            </tr>
            <tr class="tabLight">
                <td>3</td>
                <td>User3</td>
                <td>769</td>
            </tr>
            <tr class="tabDark">
                <td>4</td>
                <td>User4</td>
                <td>634</td>
            </tr>
            <tr class="tabLight">
                <td>5</td>
                <td>User5</td>
                <td>514</td>
            </tr>
            <tr class="tabDark">
                <td>6</td>
                <td>User6</td>
                <td>510</td>
            </tr>
            <tr class="tabLight">
                <td>7</td>
                <td>User7</td>
                <td>485</td>
            </tr>
            <tr class="tabDark">
                <td>8</td>
                <td>User8</td>
                <td>436</td>
            </tr>
            <tr class="tabLight">
                <td>9</td>
                <td>User9</td>
                <td>401</td>
            </tr>
            <tr class="tabDark">
                <td>10</td>
                <td>User10</td>
                <td>389</td>
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
</main>
</div>
</body>

<style>
/* SCORE PAGE */

div.score-table {
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
  width: 90%;
  border: 0.7rem var(--blue-outlines) solid;
  border-radius: 0.9rem;
  margin: 1.5rem 1rem;
}


.tabDarkBlue {
  background-color: #083a38;
  border: 2px solid #083a38;
  padding: 1rem;
  margin: 0px;
  font-size: small;
  text-align: center;
}

.tabDark {
  background-color: #0d4240;
  border: 2px solid #0d4240;
  padding: 1rem;
  margin: 0px;
  font-size: small;
  text-align: center;
}

.tabLight {
  background-color: #0f4d4a;
  border: 2px solid #0f4d4a;
  padding: 1rem;
  margin: 0px;
  font-size: small;
  text-align: center;
}

td {
    padding: 0.2rem;
}

     /* Styling the aside section containing the buttons for the homepage, log in, etc. */
  
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
  
      /* Styling the homepage button */
      .homeButton {
        display:block;
          max-width: 80%;
          margin: 0.5rem auto;
  
      }
  
      /* Styling the remaining navigation buttons */
  
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
      display:block;
        max-width: 300px;
        margin: 0.5rem auto;
    }

    .tabDark {
  background-color: #0d4240;
  border: 2px solid #0d4240;
  padding: 7rem;
  margin: 0px;
  font-size: small;
  text-align: center;
}

.tabLight {
  background-color: #0f4d4a;
  border: 2px solid #0f4d4a;
  padding: 7rem;
  margin: 0px;
  font-size: small;
  text-align: center;
}

td {
    padding: 0.5rem;
}

     }


            /*  media queries of desktop  */
  @media (min-width: 769px) {

    main {
  grid-template-columns: 70% auto;

}


    td {
    padding: 0.5rem;
}

/* Styling the aside section containing the buttons for the homepage, log in, etc. */


aside {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

aside div {
  margin: 1.9rem;
}

#statusUser {
    background-color: var(--orange-buttons);
    border-radius: 2px;;
    margin-left: none;
}

aside a {
    margin-top: 1.1rem;
}

/* Styling the homepage button */
.homeButton {
    max-width: 60%;
    display: block;
    
    
}

/* Styling the remaining navigation buttons */

aside button {
    max-width: 250px;

}

aside a.contact{
    margin-top: 1rem;
    font-size: large;
}

  }

  </style>