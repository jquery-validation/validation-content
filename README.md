jqueryvalidation-content
========================

## Building

### Requirements

* <a href="http://www.xmlsoft.org/">libxml2</a>
* <a href="http://xmlsoft.org/XSLT/">libxslt</a>

The `xmllint` and `xsltproc` utilities need to be in your path. If you are on Windows, you can get libxml2 and libxslt from <a href="http://www.zlatkovic.com/libxml.en.html">GnuWin32</a>.

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

### Hacks

* Make sure your local `wordpress` nodejs module contains [this commit](https://github.com/scottgonzalez/node-wordpress/commit/2b19238cf8064dafb66b9db09d0adcc9eac7f724)
* Make sure your local config contains
  * rpc-auth and basic-auth credentials
  * a https jqueryvalidation url

### Deploy

`grunt deploy`
