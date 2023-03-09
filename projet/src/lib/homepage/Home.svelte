<script>
    //Importing the page components
    import Header from "./Header.svelte";
    import Main from "./Main.svelte";
    import Footer from "./Footer.svelte";
</script>

<body>
    <div class="container">
        <Header/>
        <main>
            <Main/>
            <Footer/>
        </main>
    </div>
    </body>

<style>
    /* Importing font */
    @font-face {
        font-family: "Mentimun";
        src: 
        local('Mentimun'),
        url("../../src/assets/Mentimun.ttf")
      }
</style>