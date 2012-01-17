# Define: rabbitmq::permission
#
# Execute a rabbitmqctl command to create a permission.
#
# Usage:
#
#	rabbitmq::permission { "myuser":
#         vhostpath => '/', #default
#         $conf     => "^amq.gen-.*",
#         $write    => ".*",
#         $read     => ".*";
#       }
#	rabbitmq::permission { "myuser":
#         ensure => "absent",
#         vhostpath => '/', #default
#         $conf     => "^amq.gen-.*",
#         $write    => ".*",
#         $read     => ".*";
#       }
#
#
define rabbitmq::permission( $vhostpath = "/", $user=$name, $conf, $write, $read, $ensure="present") {

    case $ensure {
      'present':  {
	exec { "rabbitmq_permission_${$user}":
		command	    => "/usr/sbin/rabbitmqctl set_permissions -p ${vhostpath} ${user} \"${conf}\" \"${write}\" \"${read}\"",
                # remark: below we have multiple tabs in the argument of grep
		unless      => "/usr/sbin/rabbitmqctl list_permissions -p ${vhostpath} | /bin/grep '^${name}	${conf}	${write}	${read}\$'",	
		require	    => Class["rabbitmq"],
	}
      } 
      'absent' : {
	exec { "rabbitmq_permission_${$user}":
		command	    => "/usr/sbin/rabbitmqctl clear_permissions -p ${vhostpath} ${user}",
                # remark: below we have a tab in the argument of grep
		onlyif      => "/usr/sbin/rabbitmqctl list_permissions -p ${vhostpath} | /bin/grep '^${name}	",	
		require	    => Class["rabbitmq"],
	}
      }
    }

}
