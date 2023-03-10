// svelte.config.js

import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
import url from '@rollup/plugin-url'; // Importer le plugin URL

const __dirname = new URL('.', import.meta.url).pathname; // Utiliser __dirname

export default {
  preprocess: [
    vitePreprocess({
      scss: {
        prependData: `@import '${__dirname}/src/styles/global.scss';`, // Utiliser __dirname
      },
    }),
  ],
  rollupInputOptions: {
    plugins: [
      // Inclure la police de caractères dans le bundle de l'application
      url({ // Utiliser le plugin URL importé
        limit: 10 * 1024, // 10KB
        include: ['**/*.ttf'],
        emitFiles: true,
      }),
    ],
  },
};
