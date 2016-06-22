// Karma configuration
// Generated on Mon Nov 30 2015 17:40:45 GMT-0800 (Pacific Standard Time)

module.exports = function (config) {
    config.set({

        // base path that will be used to resolve all patterns (eg. files, exclude)
        basePath: '',


        // frameworks to use
        // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
        frameworks: ['jasmine'],


        // list of files / patterns to load in the browser
        files: [
          '../Scripts/moment.js',
      '../Scripts/angular.js',
      '../Scripts/jquery-2.1.4.js',
      '../Scripts/bootstrap.js',
      '../Scripts/*.js',
      '../app/app.js',
      '../app/Components/**/*.js',
      '../app/Shared/**/*.js',
      '../Scripts/AngularUI/ui-router.js',
      '../Scripts/angular-ui/ui-bootstrap.js',
      'Components/**/*.tests.js'
        ],


        // list of files to exclude
        exclude: [
        '../Scripts/jquery-2.1.4.intellisense.js'
        ],


        // preprocess matching files before serving them to the browser
        // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
        preprocessors: {
        },


        // test results reporter to use
        // possible values: 'dots', 'progress'
        // available reporters: https://npmjs.org/browse/keyword/karma-reporter
        reporters: ['progress'],


        // web server port
        port: 9876,


        // enable / disable colors in the output (reporters and logs)
        colors: true,


        // level of logging
        // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
        logLevel: config.LOG_INFO,


        // enable / disable watching file and executing tests whenever any file changes
        autoWatch: true,


        // start these browsers
        // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
        browsers: ['Chrome'],


        // Continuous Integration mode
        // if true, Karma captures browsers, runs the tests and exits
        singleRun: false,

        // Concurrency level
        // how many browser should be started simultanous
        concurrency: Infinity
    })
}
