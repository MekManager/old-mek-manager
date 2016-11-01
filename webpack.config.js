var webpack = require('webpack');


module.exports = {
  entry: './entry.js',
  resolve: {
    extensions: ['', '.js', '.elm']
  },
  module: {
    noParse: /\.elm$/,
    loaders: [
      {
        test: /\.elm$/,
        exclude: /(elm-stuff|node_modules)/,
        loader: 'elm-hot!elm-webpack?warn&pathToMake=node_modules/.bin/elm-make'
      }
    ]
  },
  plugins: [
    // Suppresses the rediculous amount of warnings minifiying Elm produces.
    new webpack.optimize.UglifyJsPlugin({compress: {warnings: false}})
  ],
  output: {
    path: __dirname,
    filename: 'index.js'
  }
};
