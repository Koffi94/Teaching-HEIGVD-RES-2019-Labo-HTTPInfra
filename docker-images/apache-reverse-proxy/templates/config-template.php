<?php
    $static_app_1 = getenv('STATIC_APP_1');
    $static_app_2 = getenv('STATIC_APP_2');
    $dynamic_app_1 = getenv('DYNAMIC_APP_1');
    $dynamic_app_2 = getenv('DYNAMIC_APP_2');
?>

<VirtualHost *:80>
	ServerName demo.res.ch

    <Location /balancer-manager>
      SetHandler balancer-manager
    </Location>

    ProxyPass /balancer-manager !

    <Proxy "balancer://dynamic">
        BalancerMember 'http://<?php print "$dynamic_app_1"?>/'
        BalancerMember 'http://<?php print "$dynamic_app_2"?>/'
    </Proxy>

    ProxyPass        '/api/animals/' 'balancer://dynamic'
    ProxyPassReverse '/api/animals/' 'balancer://dynamic'

    <Proxy "balancer://static">
        BalancerMember 'http://<?php print "$static_app_1"?>/'
        BalancerMember 'http://<?php print "$static_app_2"?>/'
    </Proxy>

    ProxyPass        '/' 'balancer://static'
    ProxyPassReverse '/' 'balancer://static'
    	
</VirtualHost>
