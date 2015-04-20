# Generated on 2015-04-19 using generator-angular 0.11.1
'use strict'
# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'

module.exports = (grunt) ->
  modRewrite = require('connect-modrewrite')
# Load grunt tasks automatically
  require('load-grunt-tasks') grunt
  # Time how long tasks take. Can help when optimizing build times
  require('time-grunt') grunt
  # Configurable paths for the application
  appConfig =
    app: require('./bower.json').appPath or 'app'
    dist: 'dist'
  # Define the configuration for all the tasks
  grunt.initConfig
    yeoman: appConfig
# Watches files for changes and runs tasks based on the changed files
    watch:
      bower:
        files: ['bower.json']
        tasks: ['wiredep']
      coffee:
        files: ['<%= yeoman.app %>/scripts/{,*/}*.{coffee,litcoffee,coffee.md}',
                '<%= yeoman.app %>/common/{,*/}*.{coffee,litcoffee,coffee.md}']
        tasks: ['newer:coffee:dist']
      coffeeTest:
        files: ['test/spec/{,*/}*.{coffee,litcoffee,coffee.md}']
        tasks: ['newer:coffee:test', 'karma']
      less:
        files: ['<%= yeoman.app %>/styles/{,*/}*.less']
        tasks: ['less', 'autoprefixer']
      gruntfile:
        files: ['Gruntfile.coffee']
      livereload:
        options:
          livereload: '<%= connect.options.livereload %>'
        files: [
          '<%= yeoman.app %>/{,*/}{,*/}*.html'
          '<%= yeoman.app %>/static/**'
          'Gruntfile.coffee'
          '.tmp/styles/{,*/}*.css'
          '.tmp/scripts/{,*/}*.js'
          '.tmp/common/{,*/}*.js'
          '<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}'
        ]
    connect:
      options:
        port: 9000
        hostname: 'localhost'
        livereload: 35729
      livereload:
        options:
          open: true
          middleware: (connect) ->
            [
              modRewrite(['!\\.html|\\.js|\\.css|\\.ttf|\\.woff|\\.eot|\\.coffee|\\.appcache|\\.svg|\\.swf|\\.gif|\\.jpg|\\.jpeg|\\.mp3|\\.png$ /index.html [L]'])
              connect.static('.tmp')
              connect().use('/bower_components', connect.static('./bower_components'))
              connect.static(appConfig.app)
            ]
      test:
        options:
          port: 9001
          middleware: (connect) ->
            [
              connect.static('.tmp')
              connect.static('test')
              connect().use('/bower_components', connect.static('./bower_components'))
              connect.static(appConfig.app)
            ]
      dist:
        options:
          open: true
          base: '<%= yeoman.dist %>'
          middleware: (connect) ->
            return [
              modRewrite(['!\\.html|\\.js|\\.css|\\.ttf|\\.woff|\\.eot|\\.coffee|\\.appcache|\\.svg|\\.swf|\\.gif|\\.jpg|\\.jpeg|\\.mp3|\\.png$ /index.html [L]'])
              connect.static(appConfig.dist)
            ]
# Make sure code styles are up to par and there are no obvious mistakes
    jshint:
      options:
        jshintrc: '.jshintrc'
        reporter: require('jshint-stylish')
    clean:
      dist:
        files: [
          dot: true
          src: [
            '.tmp'
            '<%= yeoman.dist %>/{,*/}*'
            '!<%= yeoman.dist %>/.git{,*/}*'
          ]
        ]
      server: '.tmp'
    autoprefixer:
      options:
        browsers: ['last 1 version']
      dist:
        files: [
          expand: yes
          cwd: '.tmp/styles/'
          src: '{,*/}*.css'
          dest: '.tmp/styles/'
        ]
    wiredep:
      app:
        src: ['<%= yeoman.app %>/index.html']
        ignorePath: /\.\.\//
      less:
        src: ['<%= yeoman.app %>/styles/main.less']
        exclude: []
# Compiles CoffeeScript to JavaScript
    coffee:
      options:
        sourceMap: yes
        sourceRoot: ''
      dist:
        files: [
          expand: yes
          cwd: '<%= yeoman.app %>/scripts'
          src: '{,*/}*.coffee'
          dest: '.tmp/scripts'
          ext: '.js'
        ]
      test:
        files: [
          expand: yes
          cwd: 'test/spec'
          src: '{,*/}*.coffee'
          dest: '.tmp/spec'
          ext: '.js'
        ]
    less:
      dist:
        options:
          paths: ['<%= yeoman.app %>/styles', './bower_components']
          relativeUrls: yes
        files:
          ".tmp/styles/main.css": "<%= yeoman.app %>/styles/main.less"

    filerev:
      dist:
        src: [
          '<%= yeoman.dist %>/scripts/{,*/}*.js'
          '<%= yeoman.dist %>/styles/{,*/}*.css'
          '<%= yeoman.dist %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}'
          '<%= yeoman.dist %>/styles/fonts/*'
        ]
# Reads HTML for usemin blocks to enable smart builds that automatically
# concat, minify and revision files. Creates configurations in memory so
# additional tasks can operate on them
    useminPrepare:
      html: '<%= yeoman.app %>/index.html'
      options:
        dest: '<%= yeoman.dist %>'
        flow:
          html:
            steps:
              js: [
                'concat'
                'uglifyjs'
              ]
              css: ['cssmin']
            post: {}
# Performs rewrites based on filerev and the useminPrepare configuration
    usemin:
      html: ['<%= yeoman.dist %>/{,*/}*.html']
      css: ['<%= yeoman.dist %>/styles/{,*/}*.css']
      options:
        assetsDirs: [
          '<%= yeoman.dist %>'
          '<%= yeoman.dist %>/images'
          '<%= yeoman.dist %>/styles'
        ]
    imagemin:
      dist:
        files: [{
          expand: yes
          cwd: '<%= yeoman.app %>/images'
          src: '{,*/}*.{png,jpg,jpeg,gif}'
          dest: '<%= yeoman.dist %>/images'
        }]
    svgmin:
      dist:
        files: [{
          expand: yes
          cwd: '<%= yeoman.app %>/images'
          src: '{,*/}*.svg'
          dest: '<%= yeoman.dist %>/images'
        }]
    htmlmin:
      dist:
        options:
          collapseWhitespace: yes
          conservativeCollapse: yes
          collapseBooleanAttributes: yes
          removeCommentsFromCDATA: yes
          removeOptionalTags: yes
        files: [{
          expand: yes
          cwd: '<%= yeoman.dist %>'
          src: [
            '*.html'
            'views/{,*/}*.html'
          ]
          dest: '<%= yeoman.dist %>'
        }]
# ngAnnotate tries to make the code safe for minification automatically by
# using the Angular long form for dependency injection. It doesn't work on
# things like resolve or inject so those have to be done manually.
    ngAnnotate:
      dist:
        files: [{
          expand: yes
          cwd: '.tmp/concat/scripts'
          src: '*.js'
          dest: '.tmp/concat/scripts'
        }]
# Replace Google CDN references
    cdnify:
      dist:
        html: ['<%= yeoman.dist %>/*.html']
# Copies remaining files to places other tasks can use
    copy:
      dist:
        files: [
          expand: yes
          dot: yes
          cwd: '<%= yeoman.app %>'
          dest: '<%= yeoman.dist %>'
          src: [
            '*.{ico,png,txt}'
            '.htaccess'
            '*.html'
            'views/{,*/}*.html'
            'images/{,*/}*.{webp}'
            'styles/fonts/{,*/}*.*'
          ]
        ,
          expand: yes
          dot: yes
          cwd: '<%= yeoman.app %>'
          dest: '<%= yeoman.dist %>'
          src: [
            '*.{ico,png,txt}'
            '*.html'
            'views/{,*/}*.html'
            'images/{,*/}*.{webp}'
            'fonts/**'
            'static/translations/*'
          ]
        ,
          expand: yes
          cwd: '.tmp/images'
          dest: '<%= yeoman.dist %>/images'
          src: ['generated/*']
        ]
      index:
        files: [
          expand: yes
          cwd: "<%= yeoman.app %>"
          dest: ".tmp"
          src: ["index.html"]
        ]
      styles:
        expand: yes
        cwd: '<%= yeoman.app %>/styles'
        dest: '.tmp/styles/'
        src: '{,*/}*.css'
# Run some tasks in parallel to speed up the build process
    concurrent:
      options:
        logConcurrentOutput: yes
        limit: 5
      server: [
        'coffee:dist'
        'less:dist'
        'copy:index'
      ]
      test: [
        'coffee'
        'less:dist'
      ]
      dist: [
        'coffee'
        'less:dist'
        'copy:dist'
        'imagemin'
        'svgmin'
        'ngtemplates:app'
      ]
      postDist: [
        'htmlmin'
        'minjson'
      ]
# Test settings
    karma:
      unit:
        configFile: 'test/karma.conf.coffee'
        singleRun: yes
  grunt.registerTask 'serve', 'Compile then start a connect web server', (target) ->
    if target is 'dist'
      grunt.task.run([
        'build'
        'connect:dist:keepalive'
      ])
    else
      grunt.task.run [
        'clean:server'
        'wiredep'
        'concurrent:server'
        'autoprefixer'
        'connect:livereload'
        'watch'
      ]
  grunt.registerTask "bowerinstall", "Run bower install.", ->
    bower = require("bower")
    inquirer = require('inquirer')
    done = @async()
    bower.commands.install(null, null, {interactive: yes})
    .on('error', (error)->
      grunt.log.error "Bower: " + error
      done(false)
    )
    .on('log', (log)->
      grunt.log.ok "Bower: " + log.message
    ).on('prompt', (prompts, callback)->
      inquirer.prompt(prompts, callback)
    ).on('end', (installed)->
      done()
    )

  grunt.registerTask 'server', 'DEPRECATED TASK. Use the "serve" task instead', (target) ->
    grunt.log.warn 'The `server` task has been deprecated. Use `grunt serve` to start a server.'
    grunt.task.run ['serve:' + target]
  grunt.registerTask 'test', [
    'clean:server'
    'wiredep'
    'concurrent:test'
    'autoprefixer'
    'connect:test'
    'karma'
  ]
  grunt.registerTask 'build', [
    'clean:dist'
    'wiredep'
    'useminPrepare'
    'concurrent:dist'
    'autoprefixer'
    'concat'
    'ngAnnotate'
    'copy:dist'
    'cdnify'
    'cssmin'
    'uglify'
    'filerev'
    'usemin'
    'htmlmin'
  ]
  grunt.registerTask 'default', [
    'newer:jshint'
    'test'
    'build'
  ]

