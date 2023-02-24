<script>
    
    import {link} from 'svelte-spa-router';

    export let links = [
        {
            linkName: 'Accueil',
            URL: '/',
        },

        {
            linkName: 'Inscription',
            URL: '/subscription',
        },

        {
            linkName: 'Connexion',
            URL: '/connection',
        },

        {
            linkName: 'Scores',
            URL: '/scores',
        },

        {
            linkName: 'Contact',
            URL: '/contact',
        },

        {
            linkName: 'À propos',
            URL: '/about_us',
        },

        {
            linkName: 'Devinettes au hasard',
            URL: '/random_theme_riddle',
        },

        {
            linkName: 'Devinettes par theme',
            URL: '/defined_theme_riddle',
        },
    ];
</script>