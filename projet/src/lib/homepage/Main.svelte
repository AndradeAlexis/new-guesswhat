<script>
    import {link} from 'svelte-spa-router';
    import {logout} from "../connection/Connection.svelte";
    import {refreshPage} from "../random_game/Random_game.svelte";
    import Mascotte from "../../assets/Mascotte.png";
    import Mascotte_Themes from "../../assets/Mascotte_Themes.png";
    import Accueil from "../../assets/Accueil.png";
</script>

<section class="leftBlock" aria-label="Page d'accueil, regles du jeu">
    <div class="guessWhatText">
        <h1>Guess What ?</h1>
        <p>
            Bienvenue à Guess What?, un jeu des devinettes en ligne. Vous pouvez choisir entre deux modes de jeu : jeu à thème aléatoire ou jeu à thème défini. Les thèmes que nous proposons sont les animaux, le cinéma et la musique. Si vous choisissez le mode de jeu aléatoire, vous obtiendrez automatiquement une devinette. Si vous choisissez le mode de jeu à thème défini veuillez choisir votre thème, avant d'obtenir une devinette. Si vous avez des difficultés à trouver la bonne réponse, vous pouvez demander un ou plusieurs indices pour vous aider à trouver la réponse. Une alerte vous indiquera s'il n'y a plus d'indices à demander. Attention, chaque indice que vous demandez a un impact sur votre score. Vous avez un nombre illimité de tentatives, mais gardez à l'esprit que chaque tentative retirera des points à votre score.
        </p>
        <p>
            Veuillez noter que votre réponse à une devinette doit être écrite soit en lettres minuscules, soit avec seulement la première lettre de chaque mot en majuscules, sinon votre réponse ne sera pas acceptée comme correcte. Les accents doivent également être pris en compte.
        </p>
        <p>
            Vous démarrez le jeu avec 1000 points à votre disposition. Le score final est calculé en fonction de votre nombre des tentatives et du nombre d'indices que vous avez demandé. Si vous souhaitez créer un compte utilisateur sur notre site, vous aurez la possibilité d'ajouter votre score au tableau des scores, cependant seuls les 10 meilleurs scores sont affichés. Amusez-vous bien et bonne chance !
        </p>
    </div>
    <div class="game-modes">
        <div id="random-game">
            <img
                src={Mascotte}
                alt="Mascotte pour jeu des devinettes à thème aléatoire"/>
            <button><a href="/random_theme_riddle" use:link>Devinettes <br/> au hasard</a></button>
        </div>
        <div id="theme-game">
            <img
                src="{Mascotte_Themes}"
                alt="Mascotte pour jeu des devinettes à thème défini"/>
            <button><a href="/defined_theme_riddle" use:link>Devinettes <br/> par theme</a></button>
        </div>
    </div>
</section>
<aside aria-label="menu de navigation">
    <div>
        {#if localStorage.getItem('token')} 
        <p>Username</p>
        <a href="/" use:link on:click={logout} on:click={refreshPage}> <span id="statusUser">Déconnecter</span></a>
        {/if}
    </div>
    <a href="/" use:link><img
            class="homeButton"
            src={Accueil}
            alt="Retour accueil"/></a>
    {#if !localStorage.getItem('token')}        
    <button><a href="/subscription" use:link class="aside-buttons">Inscription</a></button>
    <button><a href="/connection" use:link class="aside-buttons">Connexion</a></button>
    {/if}
    <button><a href="/scores" use:link class="aside-buttons">Scores</a></button>
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
        font-family: 'Mentimun', sans-serif;
        font-size: 75%;
        transition: all .2s ease-in-out;
    }

    #random-game button:hover {
        transform: scale(1.1);
        
        border: 0.7rem var(--bg-buttons)solid;
    }

    #theme-game button:hover {
        transform: scale(1.1);
        
        border: 0.7rem var(--bg-buttons)solid;
    }

    p {
        margin-bottom: 1rem;
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
        color: var(--blue-text);
        border-radius: 20px;
        padding: 5px;
        margin-left: 1rem;
    }

    .aside-buttons {
    color: var(--blue-text);
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
        color: var(--blue-text);
        border-radius: 20px;
        padding: 5px;
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
