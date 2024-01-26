// See the Tailwind default theme values here:
// https://github.com/tailwindcss/tailwindcss/blob/master/stubs/defaultConfig.stub.js
const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
    content: [
        './app/views/**/*.html.erb',
        './app/components/**/*.html.erb',
        './app/helpers/**/*.rb',
        './app/assets/stylesheets/**/*.css',
        './app/javascript/**/*.js',
        './node_modules/flowbite/**/*.js'
    ],
    plugins: [
        require('flowbite/plugin')
    ],
    theme: {
        extend: {
            colors: {
                primary: colors.red,
                secondary: colors.indigo,
                tertiary: colors.pink,
                success: colors.green,
                danger: colors.rose,
                warning: colors.yellow,
                info: colors.cyan,
                muted: colors.gray
            },
            fontFamily: {
                sans: ['Inter', ...defaultTheme.fontFamily.sans]
            }
        }
    }
}
