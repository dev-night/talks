var webpack = require('webpack');
module.exports = {
    entry: './app.js',
    output: {filename: './bundle.js'},
    module: {
        loaders: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                loaders: ["babel-loader"]
            }
        ]
    },
};
