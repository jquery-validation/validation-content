jqueryvalidation-content
========================

## Building

### Requirements

* <a href="http://www.xmlsoft.org/">libxml2</a>
* <a href="http://xmlsoft.org/XSLT/">libxslt</a>

The `xmllint` and `xsltproc` utilities need to be in your path. If you are on Windows, you can get libxml2 and libxslt from <a href="http://sourceforge.net/projects/gnuwin32/files/">GnuWin32</a>.

* Install [WordPress](http://wordpress.org/download/)
* Install [jqueryvalidation-theme](https://github.com/jzaefferer/validation-theme) - clone that repo, then symlink it into your `wp-content/themes` folder
* Install [gilded-wordpress plugin](https://raw.githubusercontent.com/scottgonzalez/gilded-wordpress/v1.0.0/gilded-wordpress.php)
* Install [jquery-static-index plugin](https://raw.githubusercontent.com/jquery/jquery-wp-content/v4.0.1/plugins/jquery-static-index.php)

### Installation

In this repo:
* Make sure nodejs (with npm) is installed, otherwise install from nodejs.org
* `cp config-sample.json config.json`, edit config.json to match login for local WordPress
* run `npm install -g grunt-cli`
* run `npm install`

### Deploy

`grunt deploy`
