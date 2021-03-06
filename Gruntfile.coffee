# Generated on 2015-04-19 using generator-angular 0.11.1
'use strict'
# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'

module.exports = (grunt) ->
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
    watch:
      bower:
        files: [ 'bower.json' ]
        tasks: [ 'wiredep' ]
      coffee:
        files: [ '<%= yeoman.app %>/scripts/{,*/}*.{coffee,litcoffee,coffee.md}' ]
        tasks: [ 'newer:coffee:dist' ]
      coffeeTest:
        files: [ 'test/spec/{,*/}*.{coffee,litcoffee,coffee.md}' ]
        tasks: [
          'newer:coffee:test'
          'karma'
        ]
      styles:
        files: [ '<%= yeoman.app %>/styles/{,*/}*.css' ]
        tasks: [
          'newer:copy:styles'
          'autoprefixer'
        ]
      gruntfile: files: [ 'Gruntfile.js' ]
      livereload:
        options: livereload: '<%= connect.options.livereload %>'
        files: [
          '<%= yeoman.app %>/{,*/}*.html'
          '.tmp/styles/{,*/}*.css'
          '.tmp/scripts/{,*/}*.js'
          '<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}'
        ]
    connect:
      options:
        port: 9000
        hostname: 'localhost'
        livereload: 35729
      livereload: options:
        open: true
        middleware: (connect) ->
          [
            connect.static('.tmp')
            connect().use('/bower_components', connect.static('./bower_components'))
            connect().use('/app/styles', connect.static('./app/styles'))
            connect.static(appConfig.app)
          ]
      test: options:
        port: 9001
        middleware: (connect) ->
          [
            connect.static('.tmp')
            connect.static('test')
            connect().use('/bower_components', connect.static('./bower_components'))
            connect.static(appConfig.app)
          ]
      dist: options:
        open: true
        base: '<%= yeoman.dist %>'
    jshint:
      options:
        jshintrc: '.jshintrc'
        reporter: require('jshint-stylish')
      all: src: [ 'Gruntfile.js' ]
    clean:
      dist: files: [ {
        dot: true
        src: [
          '.tmp'
          '<%= yeoman.dist %>/{,*/}*'
          '!<%= yeoman.dist %>/.git{,*/}*'
        ]
      } ]
      server: '.tmp'
    autoprefixer:
      options: browsers: [ 'last 1 version' ]
      server:
        options: map: true
        files: [ {
          expand: true
          cwd: '.tmp/styles/'
          src: '{,*/}*.css'
          dest: '.tmp/styles/'
        } ]
      dist: files: [ {
        expand: true
        cwd: '.tmp/styles/'
        src: '{,*/}*.css'
        dest: '.tmp/styles/'
      } ]
    wiredep:
      app:
        src: [ '<%= yeoman.app %>/index.html' ]
        ignorePath: /\.\.\//
      test:
        devDependencies: true
        src: '<%= karma.unit.configFile %>'
        ignorePath: /\.\.\//
        fileTypes: coffee:
          block: /(([\s\t]*)#\s*?bower:\s*?(\S*))(\n|\r|.)*?(#\s*endbower)/gi
          detect:
            js: /'(.*\.js)'/gi
            coffee: /'(.*\.coffee)'/gi
          replace:
            js: '\'{{filePath}}\''
            coffee: '\'{{filePath}}\''
    coffee:
      options:
        sourceMap: true
        sourceRoot: ''
      dist: files: [ {
        expand: true
        cwd: '<%= yeoman.app %>/scripts'
        src: '{,*/}*.coffee'
        dest: '.tmp/scripts'
        ext: '.js'
      } ]
      test: files: [ {
        expand: true
        cwd: 'test/spec'
        src: '{,*/}*.coffee'
        dest: '.tmp/spec'
        ext: '.js'
      } ]
    filerev: dist: src: [
      '<%= yeoman.dist %>/scripts/{,*/}*.js'
      '<%= yeoman.dist %>/styles/{,*/}*.css'
      '<%= yeoman.dist %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}'
      '<%= yeoman.dist %>/styles/fonts/*'
    ]
    useminPrepare:
      html: '<%= yeoman.app %>/index.html'
      options:
        dest: '<%= yeoman.dist %>'
        flow: html:
          steps:
            js: [
              'concat'
              'uglifyjs'
            ]
            css: [ 'cssmin' ]
          post: {}
    usemin:
      html: [ '<%= yeoman.dist %>/{,*/}*.html' ]
      css: [ '<%= yeoman.dist %>/styles/{,*/}*.css' ]
      options: assetsDirs: [
        '<%= yeoman.dist %>'
        '<%= yeoman.dist %>/images'
        '<%= yeoman.dist %>/styles'
      ]
    imagemin: dist: files: [ {
      expand: true
      cwd: '<%= yeoman.app %>/images'
      src: '{,*/}*.{png,jpg,jpeg,gif}'
      dest: '<%= yeoman.dist %>/images'
    } ]
    svgmin: dist: files: [ {
      expand: true
      cwd: '<%= yeoman.app %>/images'
      src: '{,*/}*.svg'
      dest: '<%= yeoman.dist %>/images'
    } ]
    htmlmin: dist:
      options:
        collapseWhitespace: true
        conservativeCollapse: true
        collapseBooleanAttributes: true
        removeCommentsFromCDATA: true
        removeOptionalTags: true
      files: [ {
        expand: true
        cwd: '<%= yeoman.dist %>'
        src: [
          '*.html'
          'views/{,*/}*.html'
        ]
        dest: '<%= yeoman.dist %>'
      } ]
    ngAnnotate: dist: files: [ {
      expand: true
      cwd: '.tmp/concat/scripts'
      src: '*.js'
      dest: '.tmp/concat/scripts'
    } ]
    cdnify: dist: html: [ '<%= yeoman.dist %>/*.html' ]
    copy:
      dist: files: [
        {
          expand: true
          dot: true
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
        }
        {
          expand: true
          cwd: '.tmp/images'
          dest: '<%= yeoman.dist %>/images'
          src: [ 'generated/*' ]
        }
      ]
      styles:
        expand: true
        cwd: '<%= yeoman.app %>/styles'
        dest: '.tmp/styles/'
        src: '{,*/}*.css'
    concurrent:
      server: [
        'coffee:dist'
        'copy:styles'
      ]
      test: [
        'coffee'
        'copy:styles'
      ]
      dist: [
        'coffee'
        'copy:styles'
        'imagemin'
        'svgmin'
      ]
    karma: unit:
      configFile: 'test/karma.conf.coffee'
      singleRun: true
  grunt.registerTask 'serve', 'Compile then start a connect web server', (target) ->
    if target == 'dist'
      return grunt.task.run([
        'build'
        'connect:dist:keepalive'
      ])
    grunt.task.run [
      'clean:server'
      'wiredep'
      'concurrent:server'
      'autoprefixer:server'
      'connect:livereload'
      'watch'
    ]
    return
  grunt.registerTask 'server', 'DEPRECATED TASK. Use the "serve" task instead', (target) ->
    grunt.log.warn 'The `server` task has been deprecated. Use `grunt serve` to start a server.'
    grunt.task.run [ 'serve:' + target ]
    return
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
  return

# ---
# generated by js2coffee 2.0.3
