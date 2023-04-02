<script context="module">
  export function refreshPage() {
    window.location.reload();
  }

  //Creating variables to use later to target the user's email input
  let userAddressEmail;
  let emailInput;
  let users = [];
  let userId = 0;
  export let username;

  //Creating a function to recover the username from the database based on the address email the user inputs when logging in

  export const getUsername = async () => {
    //Recovering the email value the user submits when connecting
    userAddressEmail = emailInput.value;
    //Filtering data based on email address, so when the user inputs his email, we recover the username associated with the submitted email address.
    const response = await fetch(
      import.meta.env.VITE_URL_DIRECTUS +
        "users?fields=first_name,email&filter[email]=" +
        userAddressEmail
    );
    const json = await response.json();
    users = json.data;
    username = users[userId].first_name;
    localStorage.setItem("username", username);
    return username;
  };

  getUsername();
</script>
