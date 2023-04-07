<script context="module">
  export function refreshPage() {
    window.location.reload();
  }

  export function isNotValidAnswer(userAnswer) {
    const specialCharacters = /[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
    const containsSpecialCharacter = specialCharacters.test(userAnswer);
    return containsSpecialCharacter;
  }
</script>
