<script>
    //Importing the page components
    import Header from "./Header.svelte";
    import Main from "./Main.svelte";
    import Footer from "./Footer.svelte";
    import Mentimun from '../../assets/Mentimun.ttf'; 
    import loggedInUsername from "../connection/Connection.svelte";

    //Import the "getCSRFToken" function from "db.js" file.
  import { getCSRFToken } from '../../db';
  
  //Import the "setCSRFCookie" function from "db.js" file.
  import { setCSRFCookie } from '../../db'; 
  
  // This asynchronous function  to obtain the CSRF token.
  async function SecurityCSRFToken() {
    try {
      // Attempt to fetch the CSRF token from the server.
      const csrfToken = await getCSRFToken();
      
      // Store the CSRF token in a cookie.
      setCSRFCookie(csrfToken.csrf_token);
    } catch (error) {
      // Handle errors during the CSRF token retrieval process.
      console.error('Erreur lors de la récupération du jeton CSRF :', error);
    }
  }
  
  // Call the SecurityCSRFToken function to initiate the process.
  SecurityCSRFToken();
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