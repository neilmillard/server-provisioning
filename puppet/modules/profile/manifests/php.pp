class profile::php () {
  class { 'php':
    package => 'php56',
    module_prefix => 'php56-',
    config_dir => '/etc/php-5.6.d/',
    config_file => '/etc/php-5.6.d/php.ini',
  }
  $phpModules = [ 'mysqlnd', 'pdo', 'cli', 'intl', 'mcrypt', 'gd', 'mbstring']

  php::module { $phpModules: }
}