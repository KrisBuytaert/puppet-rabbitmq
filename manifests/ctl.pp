# Define: rabbitmq::ctl
#
# Execute a rabbitmqctl command. This is a simple wrapper around rabbitmqctl:
# http://www.rabbitmq.com/man/rabbitmqctl.1.man.html.
#
# Usage:
#
#	rabbitmq::ctl { "stop_app": }
#	rabbitmq::ctl { "cluster rabbit@r0 rabbit@r1": }
#
define rabbitmq::ctl() {

	exec { "ctl": command => "/usr/sbin/rabbitmqctl $title" }

}
