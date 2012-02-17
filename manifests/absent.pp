# Class: rabbitmq::absent
#
# Uninstalls rabbitmq.
#
# Usage:
# include rabbitmq::absent
#
class rabbitmq::absent inherits rabbitmq {

  Package['rabbitmq-server'] {
    ensure => absent,
  }

}
