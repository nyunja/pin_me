/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.{rb,erb,haml,html,slim}",
    "./app/views/**/*.{erb,haml,html,slim}",
    "./app/frontend/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}

