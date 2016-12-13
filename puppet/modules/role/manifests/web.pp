class role::webhost {
  include ::profile::base
  include ::profile::os_limits

  stage { 'swapfile':
    before => Stage['main'],
  }

  class { '::profile::swapfile':
    stage => swapfile
  }

  include ::profile::apache
  include ::profile::php

}