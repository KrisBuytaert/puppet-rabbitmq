# Define: rabbitmq::ctl::reset
#
# Return a RabbitMQ node to its virgin state. Removes the node from any cluster
# it belongs to, removes all data from the management database, such as
# configured users and vhosts, and deletes all persistent messages. For reset
# and force_reset to succeed the RabbitMQ application must have been stopped,
# e.g. with stop_app.
#
# Usage:
# rabbitmq::ctl::reset { "reset": }
#
define rabbitmq::ctl::reset() {

	exec { "reset": command => "/usr/sbin/rabbitmqctl reset" }

}
