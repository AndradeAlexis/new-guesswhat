
// Import the Axios library for making HTTP requests.
import axios from 'axios';

// Base URL for API requests.
const BASE_URL = 'http://127.0.0.1:8000';

// Async function  which allows to fetch riddles by their id.
export async function getRiddles(id) {
  try {
    // GET request to fetch riddles by ID from the API.
    const response = await axios.get(`${BASE_URL}/api/riddles/${id}`);
    
    // Extracting data from the HTTP response and storing it in the riddle variable.
    const riddle = response.data; 
    
    // Creates a riddles array containing the name of the riddle extracted from the riddle object.
    const riddles = [riddle.name];
    console.log(riddles);
    // Extract the riddle name from the response.
    return riddles;
  } catch (error) {
    // Handle and log any errors that occur during the API request.
    console.error('Une erreur s\'est produite lors de la récupération des énigmes :', error);
    throw error;
  }
};

// Async function  which allows to fetch the answer of a riddle based on its id.
export async function getAllRiddlesAnswer(id) {
  try {
    // Send a GET request to the API to retrieve the riddle's answer.
    const response = await axios.get(`${BASE_URL}/api/riddles/answer/${id}`);
    
    // Extract the answer from the response.
    const riddleAnswer = response.data;
    return riddleAnswer;
  } catch (error) {
    console.error("Une erreur s'est produite lors de la récupération de l'énigme :", error);
    throw error;
  }
}

// Async function  which allows to fetch the theme of a riddle based on its id.
export async function getRiddleTheme(id) {
  try {
    // Send a GET request to the API to retrieve the riddle's theme.
    const response = await axios.get(`${BASE_URL}/api/riddles/${id}/theme`);
    
    // Extract the theme (theme_id) from the response.
    return response.data.theme_id;
  } catch (error) {
    // Error handling: in case of an error during the request or response.
    console.error('Une erreur s\'est produite lors de la récupération du thème :', error);
    throw error;
  }
}

// Async function which allows to fetch the clues of a riddle based on its riddle_id.
export async function getHints (id) {
  try {
    // Send a GET request to the API to retrieve the riddle's clues.
    const response = await axios.get(`${BASE_URL}/api/clues/riddle_id/${id}`);
    
    // Extract the clues from the response.
    const hints = response.data; 
    return hints;
  } catch (error) {
    console.error('Une erreur s\'est produite lors de la récupération des énigmes :', error);
    throw error;
  }
};

// Async function  which allows to save the score in the database.
export async function submitScore(scoreToSubmit,loggedInUsername, theme) {
  try {
    
    // Get the CSRF token
    const csrfToken = await getCSRFToken();
    
    // If the CSRF token is available, add it to the headers.
    if (csrfToken) {
      
      // Send a POST request to the API to save the score with the name of the user and the theme of the riddle as JSON data.
      let endpoint = `${BASE_URL}/api/add-score`;
      const response = await fetch(endpoint, {
        method: "POST",
        headers: {
          "content-type": "application/json",
          // Add CSRF token to headers
          "X-CSRF-TOKEN": csrfToken.csrf_token,
        },
        body: JSON.stringify({
          score: scoreToSubmit,
          name: loggedInUsername,
          theme_code: theme,
        }),
      });
      if (response.ok) {
        // Score submitted successfully.
        return response.json();
      } else {
        // Handle the error response.
        console.error('Erreur lors de la soumission du score.');
      }
    } else {
      console.error('CSRF token is not available.');
    }
  } catch (error) {
    // Alert is displayed if an error occurred while trying to submit the score.
    console.error('Erreur lors de la soumission du score :', error);
    return [];
  }
}

// Async function  which allows to create a user.
export async function createUser(password, name, role, email) {
  try {
    // Send a POST request to the API to create a user with the password, name, role and email as JSON data.
    let endpoint = `${BASE_URL}/api/users`;
    
    const response = await fetch(endpoint, {
      method: "POST",
      headers: {
        "content-type": "application/json",
      },
      body: JSON.stringify({
        password: password,
        name: name,
        role: role,
        email: email,
      }),
    });
    // If user creation was successful.
    if (response.status === 201) {
      console.log("Utilisateur créé avec succès !");
    } else {
      // If user creation failed.
      console.error("Erreur lors de la création de l'utilisateur");
    }
  } catch (error) {
    console.error("Une erreur s'est produite lors de la création de l'utilisateur :", error);
  }
}

// Async function  which allows to recover the user's name by email.
export const getUsernameFromEmail = async (email) => {
  try {
    // Send a GET request to the API to retrieve the user's name.
    const response = await fetch(`${BASE_URL}/api/get-username-by-email?email=${email}`);
    // If user is found. 
    if (response.status === 200) {
      const data = await response.json();
      // Extract the username from the response.
      const username = data.username;
      console.log(username);
      return username;
    } else {
      // If user is not found a error message is displayed in the console. 
      console.error('Error fetching username');
      return null;
    }
  } catch (error) {
    console.error('Error fetching username:', error);
    return null;
  }
};

// Async function  which allows to recover the riddles according to their themeId.
export async function getRiddlesByTheme(themeId) {
  try {
    // Send a GET request to the API to recover the riddles by their themeId.
    const response = await axios.get(`${BASE_URL}/api/riddles/theme/${themeId}`);
    // Extract the riddles from the response.
    const riddles = response.data; 
    return riddles;
  } catch (error) {
    // If the resquest failed a error message is displayed in the console.
    console.error('Une erreur s\'est produite lors de la récupération des énigmes par thème :', error);
    throw error;
  };
};

// Async function which allows to recover scores according to their theme.
export async function getScoresByTheme(themeId) {
  try {
    // Send a GET request to the API to recover scores according to their theme.
    const response = await axios.get(`${BASE_URL}/api/scores/${themeId}`);
    // Extract the scores from the response.
    const scores = response.data;
    return scores;
  } catch (error) {
    // If the resquest failed a error message is displayed in the console.
    console.error("Une erreur s'est produite lors de la récupération des scores :", error);
    throw error;
  }
};

// Async function which allows to recover all the games.
export async function getAllGames() {
  try {
    // Send a GET request to the API to recover all the games.
    const response = await axios.get(`${BASE_URL}/api/games`);
    // Extract the games from the response.
    const AllGames = response.data;
    return AllGames;
  } catch (error) {
    // If the resquest failed a error message is displayed in the console.
    console.error("Une erreur s'est produite lors de la récupération des score  :", error);
    throw error;
  }
}

// Async function which allows to add a riddle in the database when an administrator is connected.
export async function addRiddle(name, answer, theme_id, clues) {
  
  try {
    // Get the CSRF token.
    const csrfToken = await getCSRFToken();
    
    // If the CSRF token is available, add it to the headers.
    if (csrfToken) {
      
      // Send a GET request to the API to add a riddle the name, answer, theme_id, clues as JSON data.
      let endpoint = `${BASE_URL}/api/add-riddle`;
      const response = await fetch(endpoint, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-TOKEN": csrfToken.csrf_token,
        },
        body: JSON.stringify({
          name: name,
          answer: answer,
          theme_id: theme_id,
          clues: clues, 
        }),
      });
      // If riddle creation was successful.
      if (response.ok) {
        const data = await response.json();
        return data;
      } else {
        // If riddle creation failed.
        throw new Error("Erreur lors de l'ajout de l'énigme");
      }
    } else {
      console.error('CSRF token is not available.');
    }
  } catch (error) {
    console.error("Erreur lors de l'ajout de l'énigme :", error);
    throw error;
  }
}

// Function to obtain the CSRF token from the server.
export async function getCSRFToken() {
  const response = await axios.get(`${BASE_URL}/api/csrf-token`);
  const csrfToken  = await response.data;
  return csrfToken;
  
}

// Function to set the CSRF token as a cookie.
export function setCSRFCookie(token) {
  document.cookie = `XSRF-TOKEN=${token}; path=/`;
}

// Get the XSRF-TOKEN cookie.
export function getCookie(name) {
  const value = `; ${document.cookie}`;
  const parts = value.split(`; ${name}=`);
  if (parts.length === 2) return parts.pop().split(';').shift();
}

// Get the CSRF token from the cookie.
const XSRF = getCookie('XSRF-TOKEN');
console.log('Jetons CSRF stocké dans le cookie :', XSRF);
