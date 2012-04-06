# Class: rabbitmq::disableboot
#
# Disables the rabbitmq service from starting at boot time, but won't stop the
# service from being run any other way. This is useful if another program needs
# to start rabbitmq, and you don't want the OS getting in the way.
#
# Usage:
# include rabbitmq::disableboot
#
class rabbitmq::disableboot inherits rabbitmq {

  Service['rabbitmq-server'] {
    enable => false,
  }

}
