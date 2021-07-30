module.exports = {
  separator: '_',
  purge: [
    './app/views/**/*.slim',
    './app/webpacker/**/*.scss'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        brand: {
          black: '#565656',
          blood: '#76323F',
          grain: '#D7CEC7',
          tan: '#C09F80',
        }
      }
    }
  },
  variants: {},
  plugins: []
}
