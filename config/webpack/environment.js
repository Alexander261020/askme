var webpack = require('webpack');

const { environment } = require('@rails/webpacker')

module.exports = environment

environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
  $: 'jquery/src/jquery',
  jQuery: 'jquery/src/jquery',
  jquery: 'jquery',
  'window.jQuery': 'jquery',
}))
