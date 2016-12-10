class profile::loggly (
  $customer_token = undef
) {

  if $customer_token == undef {
    notice('No customer token found. Logging disabled')
  }

  # Send syslog events to Loggly
  class { 'loggly::rsyslog':
    customer_token => $customer_token,
  }
  loggly::rsyslog::logfile { "apache-mts-logfile":
    logname  => "apache-mts-logfile",
    filepath => "/var/log/httpd/millardtechnicalservices.co.uk-access_log"
  }
  loggly::rsyslog::logfile { "apache-mts-errorlogfile":
    logname  => "apache-mts-errorlogfile",
    filepath => "/var/log/httpd/millardtechnicalservices.co.uk-error_log",
    severity => "error"
  }

}