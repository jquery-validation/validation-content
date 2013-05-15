/*jshint node:true */
module.exports = function( grunt ) {
"use strict";

var entryFiles = grunt.file.expandFiles( "entries/*.xml" );

grunt.loadNpmTasks( "grunt-clean" );
grunt.loadNpmTasks( "grunt-wordpress" );
grunt.loadNpmTasks( "grunt-jquery-content" );
grunt.loadNpmTasks( "grunt-check-modules" );

grunt.initConfig({
	clean: {
		folder: "dist"
	},
	lint: {
		grunt: "grunt.js"
	},
	watch: {
		files: [ "entries/**", "pages/**", "categories.xml" ],
		tasks: "deploy"
	},
	xmllint: {
		all: [].concat( entryFiles, "categories.xml", "entries2html.xsl" )
	},
	xmltidy: {
		all: [].concat( entryFiles, "categories.xml" )
	},
	"build-pages": {
		all: grunt.file.expandFiles( "pages/**" )
	},
	"build-xml-entries": {
		all: entryFiles
	},
	"build-resources": {
		all: grunt.file.expandFiles( "resources/**" )
	},
	wordpress: grunt.utils._.extend({
		dir: "dist/wordpress"
	}, grunt.file.readJSON( "config.json" ) )
});

// workaround until I figure out how to allow upload of xml files
grunt.registerTask( "delete-apixml", function() {
	// var fs = require( "fs" );
	// fs.unlinkSync( "dist/wordpress/resources/api.xml" );
});

grunt.registerTask( "default", "build-wordpress" );
grunt.registerTask( "build", "build-pages build-xml-entries build-xml-categories build-xml-full build-resources delete-apixml" );
grunt.registerTask( "build-wordpress", "check-modules clean lint xmllint build" );
grunt.registerTask( "tidy", "xmllint xmltidy" );

};
