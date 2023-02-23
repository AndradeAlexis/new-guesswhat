<script>
import Header from "../homepage/Header.svelte";
import Footer from "../homepage/Footer.svelte";
</script>

<Header />

<section>
<div class="logoTitle">
                    <h2>Reste en contact</h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Odio sint ullam quasi saepe suscipit
                        tempora alias, totam qui! Nihil dolore, aspernatur labore numquam consequuntur dolorum voluptas
                        non consequatur quisquam suscipit.</p>
                </div >
                 <div class="logos">
                    <span>
                    <img class="logoImages" src="../../src/assets/phone-call.png"> 
                    <p>06060606</p>
                </span>
                <span >
                    <img class="logoImages" src="../../src/assets/at-symbol.png">
                    <p>test@test.com</p>
                </span>
                <span >
                    <img class="logoImages" src="../../src/twitter.png">
                    <p>@test.test.com</p>
                </span>
            </div>
            </section>

<Footer />

<style>
    /*Contact page*/
.logoTitle {
  text-align: center;
  padding: 30px 30px ;
  margin-left: 100px;
  border-radius: 0.9rem;
  font-weight: bold;
  font-size:larger;
}

.logos {
  
  border:5px var(--bg-buttons) solid;
  padding: 30px 30px;
  margin-left: 100px;
 border-radius: 0.9rem;
 
}

.logoImages {
  width : 10%;
  height : 10%;
  margin-left: 50px;
  
}
</style>