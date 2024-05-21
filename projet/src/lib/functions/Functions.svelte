<script context="module">
  export function refreshPage() {
    window.location.reload();
  }
// Méthod which is used to prohibit special characters.
  export function isNotValidAnswer(userAnswer) {
    const specialCharacters = /[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
    const containsSpecialCharacter = specialCharacters.test(userAnswer);
    return containsSpecialCharacter;
  }
</script>
