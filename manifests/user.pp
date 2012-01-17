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

        $cmd = $ensure ? {
          'absent'  => 'delete_user',
          'present' => 'add_user',
        }

        $check = $ensure ? {
          'absent'  => '-v',
          'present' => '',
        }
        
	exec { "rabbitmq_user_${name}":
		command	    => "/usr/sbin/rabbitmqctl ${cmd} ${name} ${password}",
                # remark: below we have a tab in the argument of grep
		unless      => "/usr/sbin/rabbitmqctl list_users | /bin/grep ${check} \"^${name}	\"",
		require	    => Class["rabbitmq"],
	}
}
