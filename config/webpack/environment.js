const { environment } = require('@rails/webpacker')
const erb =  require('./loaders/erb')
const webpack = require('webpack')

environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  "window.jQuery": "jquery",
  "window.$": "jquery",
  Masonry: "masonry-layout",
  imagesLoaded: "imagesloaded",
  jQueryBridget: "jquery-bridget",
  Popper: ['popper.js', 'default'],
  Rails: ['@rails/ujs']
}))

environment.loaders.prepend('erb', erb)
module.exports = environment
