# Define: rabbitmq::ctl::start_app
#
# Starts the RabbitMQ application. This command is typically run after
# performing other management actions that required the RabbitMQ application to
# be stopped, e.g. reset.
#
# Usage:
# rabbitmq::ctl::start_app { "start_app": }
#
define rabbitmq::ctl::start_app() {

	exec { "start_app": command => "/usr/sbin/rabbitmqctl start_app" }

}
