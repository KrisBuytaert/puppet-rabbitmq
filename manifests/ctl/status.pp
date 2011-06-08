# Define: rabbitmq::ctl::status
#
# Displays various information about the RabbitMQ broker, such as whether the
# RabbitMQ application on the current node, its version number, what nodes are
# part of the broker, which of these are running.
#
# Usage:
# rabbitmq::ctl::status
#
define rabbitmq::ctl::status() {

	exec { "status": command => "/usr/sbin/rabbitmqctl status" }

}
