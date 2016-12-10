class role::webhost {
  include ::profile::base
  include ::profile::os_limits

  include ::profile::btsync

  stage { 'swapfile':
    before => Stage['main'],
  }

  class { '::profile::swapfile':
    stage => swapfile
  }

  include ::profile::apache
  include ::profile::php

  # BUCKET_PUPPET="config.technical-infrastructures.com"
  # ROLE="web2"
  # export SYNC_DIR="/var/www/sites"
  # SECRET=DUMMY_SECRET_HERE
  #
  # AWSCMDCFG="/root/.aws/credentials"
  # mkdir /root/.aws
  # wget --output-document=/root/.aws/config https://s3-eu-west-1.amazonaws.com/config.technical-infrastructures.com/config
  #
  # mkdir /var/www
  # mkdir /var/www/sites

  # aws s3 cp s3://$BUCKET_PUPPET/run_sync /opt/run_sync
  # chmod +x /opt/run_sync
  # echo "syncing mounting /var/www/sites"
  # /opt/run_sync $SECRET

  class { 'vsftpd':
    template         => 'vsftpd/vsftpd.conf.erb',
    anonymous_enable => false,
    ftpd_banner      => 'Aloha stranger!',
    pasv_max_port    => '1048',
    pasv_min_port    => '1024',
    chroot_local_user=> true,
  }

  file { '/var/log/vsftpd/':
    ensure => 'directory',
    mode   => '0755',
  }


}