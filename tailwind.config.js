module.exports = {
    content: [
        './app/views/**/*.html.erb',
        './app/views/**/*.html.haml',
        './app/components/**/*.html.erb',
        './app/components/**/*.html.haml',
        './app/helpers/**/*.rb',
        './app/assets/stylesheets/**/*.css',
        './app/javascript/**/*.js',
        './node_modules/flowbite/**/*.js'
    ],
    plugins: [
        require('flowbite/plugin')
    ],
    theme: {
    }
}
