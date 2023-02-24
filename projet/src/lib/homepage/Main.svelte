<script>
    import {link} from 'svelte-spa-router';
</script>

<section class="leftBlock">
    <div class="guessWhatText">
        <h1>Guess What ?</h1>
        <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis
            officiis voluptate fugit quaerat qui suscipit ratione repellendus,
            consequatur autem ipsam aut blanditiis quae saepe. Quod
            exercitationem soluta et tenetur ad reiciendis mollitia earum
            aliquid culpa animi non voluptatum eveniet, laudantium iste
            necessitatibus, debitis quos doloremque sit at magnam rerum sequi
            itaque consectetur dignissimos! Sequi, suscipit sit necessitatibus
            maxime at aperiam?
        </p>
        <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis
            officiis voluptate fugit quaerat qui suscipit ratione repellendus,
            consequatur autem ipsam aut blanditiis quae saepe. Quod
            exercitationem soluta et tenetur ad reiciendis mollitia earum
            aliquid culpa animi non voluptatum eveniet, laudantium iste
            necessitatibus, debitis quos doloremque sit at magnam rerum sequi
            itaque consectetur dignissimos! Sequi, suscipit sit necessitatibus
            maxime at aperiam?
        </p>
    </div>
    <div class="game-modes">
        <div id="random-game">
            <img
                src="../../src/assets/Mascotte.png"
                alt="logo for riddle game with a random theme"/>
            <button><a href="/random_theme_riddle" use:link>Devinettes <br /> au hasard</a></button>
        </div>
        <div id="theme-game">
            <img
                src="../../src/assets/Mascotte Thèmes.png"
                alt="logo for riddle game with a defined theme"/>
            <button><a href="/defined_theme_riddle" use:link>Devinettes <br /> par theme</a></button>
        </div>
    </div>
</section>
<aside>
    <div>
        <p>Username</p>
        <a href="/connection" use:link> <span id="statusUser">Déconnecter</span></a>
    </div>
    <a href="/" use:link
        ><img
            class="homeButton"
            src=".../../src/assets/Bouton Retour Accueil.png"
            alt="button go back to the home page"
        /></a>
    <button><a href="/subscription" use:link>Inscription</a></button>
    <button><a href="/connection" use:link>Connexion</a></button>
    <button><a href="/scores" use:link>Scores</a></button>
    <a class="contact" href="/contact" use:link>Contact</a>
    <a class="contact" href="/about_us" use:link>À propos</a>
</aside>

<style>
    /* Styling the game modes section */

    .leftBlock {
  text-align: center;
}

    .game-modes {
        margin: -30px 0;
        display: flex;
        justify-content: center;
    }

    #random-game,
    #theme-game {
        max-width: 200px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        margin: 50px 25px 50px 25px;
    }

    #random-game img,
    #theme-game img {
        background-color: var(--bg-images);
        border: 0.7rem var(--blue-outlines) solid;
        border-radius: 1.9rem;
        text-align: center;
        margin-bottom: 1rem;
        max-width: 100px;
    }

    #random-game button,
    #theme-game button {
        max-width: 100px;
        padding: 0.2rem 0;
        background-color: var(--orange-buttons);
        color: var(--blue-text);
        font-weight: bolder;
        border: 0.7rem var(--blue-outlines) solid;
        border-radius: 0.9rem;
        font-family: "Mentimun";
        font-size: 75%;
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
        display: none;
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

        .game-modes {
            margin: -30px 0;
        }

        #random-game,
        #theme-game {
            margin: 50px 25px 50px 25px;
        }

        #random-game img,
        #theme-game img {
            max-width: 500px;
        }

        #random-game button,
        #theme-game button {
            max-width: 300px;
            padding: 0.1rem 0;
            font-size: 125%;
        }
    }
  /*  media queries of desktop  */
  @media (min-width: 769px) {

        .game-modes {
    margin: -110px 0;
}

#random-game, #theme-game {
    margin: 100px 70px 100px 70px; 
}

#random-game img, #theme-game img {
    max-width: 180px;
}

#random-game button, #theme-game button {
    max-width: 300px;
    padding: 0.1rem 0;
    font-size: 125%;
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
    max-width: 300px;
       
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
