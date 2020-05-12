const { environment } = require('@rails/webpacker')

const webpack = require('webpack');
const datatables = require('./loaders/datatables');

environment.plugins.append(
    'Provide',
    new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
    })
);

environment.loaders.append('expose', {
    test: require.resolve('jquery'),
    use: [
      { loader: 'expose-loader', options: '$' },
      { loader: 'expose-loader', options: 'jQuery' }
    ]
})

environment.loaders.append('datatables', datatables)

module.exports = environment
