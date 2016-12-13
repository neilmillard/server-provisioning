class role::jenkins {
  include ::profile::base
  include ::profile::os_limits

  include jenkins

}