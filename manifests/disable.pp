# Class: rabbitmq::disable
#
# Stops the rabbitmq service and disables it at boot time.
#
# Usage:
# include rabbitmq::disable
#
class rabbitmq::disable inherits rabbitmq {

  Service['rabbitmq-server'] {
    enable => false,
    ensure => stopped,
  }

}
