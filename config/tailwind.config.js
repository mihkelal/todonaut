const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  separator: '_',
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*'
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          black: '#565656',
          blood: '#76323F',
          grain: '#D7CEC7',
          tan: '#C09F80',
        }
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
