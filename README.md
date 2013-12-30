#OS X 10.9 Clean Install
You should check out Mathias [awesome README](https://github.com/mathiasbynens/dotfiles) for more on using these dotfiles.
##Sublime
[Mensch coding font](http://robey.lag.net/2010/06/21/mensch-font.html)

This is normally installed in .cask but I am using the [Sublime 3 beta.](http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203059.dmg)
####Install package manager
	`import urllib.request,os; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); open(os.path.join(ipp, pf), 'wb').write(urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ','%20')).read())`
##Xcode + tools
`Xcode > Preferences > Downloads > Command Line Tools`
##Git
```bash
ssh-keygen -t rsa -C "zdkroot@gmail.com"

#copy ssh key to github.com
vim ~/.ssh/id_rsa.pub

#test connection
ssh -T git@github.com
```
##[Dotfiles](https://github.com/zdkroot/dotfiles)
```bash
git clone git@github.com:zdkroot/dotfiles.git ~/dotfiles && cd ~/dotfiles
source bootstrap.sh
.. && source install-deps.sh
./.osx
brew bundle Brewfile
./.cask
```
##Apache/PHP/Mysql
###Apache
#####Enable PHP
Enable php in `/etc/apache2/httpd.conf` simply by uncommenting:
`LoadModule php5_module libexec/apache2/libphp5.so`
#####User directory web root
```bash
Include /private/etc/apache2/extra/httpd-userdir.conf
mkdir ~/Sites
```
#####Vhosts
`Include /private/etc/apache2/extra/httpd-vhosts.conf`
```xml
# /etc/apache2/extra/httpd-vhosts.conf

<VirtualHost *:80>
    DocumentRoot "/Users/user/Sites/"
    ServerName localhost
</VirtualHost>
```

###PHP
####Extensions
#####Mcrypt
Homebrew will have already conf directory for us at `/usr/local/etc/php/5.4/conf.d` when building mcrypt.
We will put our other extension configs there as well.

Lets add `extension_dir = "/usr/local/etc/php/5.4/conf.d"` to php.ini

#####Xdebug
```ini
; /usr/local/etc/php/5.4/conf.d/ext-xdebug.ini

[xdebug]
zend_extension = "/usr/lib/php/extensions/no-debug-non-zts-20100525/xdebug.so"
xdebug.remote_enable = 1
xdebug.profiler_enable = 1
xdebug.profiler_enable_trigger = 1
xdebug.auto_trace = On
xdebug.show_exception_trace = On
xdebug.profiler_output_dir = /tmp
```
###Mysql
```bash
#set admin password
mysqladmin -uroot password new_password`

#setup daemon
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

#Set up databases to run as your user account
unset TMPDIR && mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

#start mysql
mysql.server start
```