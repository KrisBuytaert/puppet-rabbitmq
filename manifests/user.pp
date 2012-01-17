# Define: rabbitmq::user
#
# Execute a rabbitmqctl command to create a user.
#
# Usage:
#
#	rabbitmq::user { "myuser":
#         password => 'mypass';
#       }
#	rabbitmq::user { "myuser2":
#         ensure => "absent";
#       }
#
#
define rabbitmq::user($password='', $ensure="present") {

    case $ensure {
      'present':  {
	exec { "rabbitmq_user_${$name}":
		command	    => "/usr/sbin/rabbitmqctl add_user ${name} ${password}",
                # remark: below we have multiple tabs in the argument of grep
		unless      => "/usr/sbin/rabbitmqctl list_users | /bin/grep \"^${name}	\"",
		require	    => Class["rabbitmq"],
	}
      } 
      'absent' : {
	exec { "rabbitmq_user_${$name}":
		command	    => "/usr/sbin/rabbitmqctl delete_user ${name} ${password}",
                # remark: below we have a tab in the argument of grep
		onlyif      => "/usr/sbin/rabbitmqctl list_users | /bin/grep \"^${name}	\"",
		require	    => Class["rabbitmq"],
	}
      }
    }

}
