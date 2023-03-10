<script>
    //Importing the page components
    import Header from "./Header.svelte";
    import Main from "./Main.svelte";
    import Footer from "./Footer.svelte";
    import Mentimun from '../../assets/Mentimun.ttf'; 
</script>

<body style="">
    <div class="container">
        <Header/>
        <main>
            <Main/>
            <Footer/>
        </main>
    </div>
    </body>

<style lang="scss">
/* Importing font */
@font-face {
    font-family: "Mentimun";
    src: 
        url('${Mentimun}'),
        format('truetype');
}

</style>