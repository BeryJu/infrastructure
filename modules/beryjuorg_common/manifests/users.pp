# Users
#
class beryjuorg_common::users {

  user { 'jens':
    ensure => 'present',
    shell  => '/bin/bash',
  }
  ->ssh_authorized_key { 'jens@beryju.org old':
    ensure => present,
    user   => 'jens',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC+kSfa9FWWsLxzqkojz28w7xu6PntQd09+1fACTkHOI+9opduAGNJx3+0FbEiOA309HRRyeodpBe6lmzFluMb3ZrvI+r1uwOC8G+O1eiO0+CG28wGTqa/Ww6KaqdEog9EgAIpHZvewwte4t4UBs3BYjF9vf+QpjdtD3zXaKEPsVledUlFQLLiEWW1uTGHBbbPdxKqPtyurEAvoorMKtqB/+NfskkqJoJzZj/M+qHE5Ga5izaUNt11gx4C+AM7RxHYHUuXEo7cOJFfDsJFSbEgCJe947pC7WBAdKXt1yF0i78H4wD19byI4i9+G2ZGHU/wLLU+VfKWGCv5k5thUfMLt',
  }
  ->ssh_authorized_key { 'jens@beryju.org new':
    ensure => present,
    user   => 'jens',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABgQDdKEwJwQA8pazibRc+X6Z0QzuPDZz8goUU1OBF2TIzzS86MqEJ22Rwo/51mhKdpALIszOI3x/qX3QiyBtdQU3qbC+XxyxxINXLwziksd/g8JgaTg04N5f/wOw5U/N5WNV2N0kkMxaychJdO5B2NX52hY+Mr+GNNJJKvBxsBRx7jGq+0KsZdCO1vRKXTb7yHSdQlThQDKW2IpHhw/q39Y8BzO2rnV2Zz6KSC8MrCM6BH7MBAWJyLLMuFUJPY/jJa9G6jkCYY51iUGxp5RuMuJQTsnzFSzGfjh2MWgVePBPvIyy/65DPjpRLgMJ7VRKNHkW03YVYS6TJxltGp9PrcQ1e/ksncKzrDTcQX1xcl1vliwmstODFZQLgou+NHJUWL8cc0tsjUzSXgVEzQuSQmfdiB3yhqczZSsA2c9J+tGL7u3KhSaQ9IGQSlPVRnOEOhvhDxa4lGohEaQyW9iwXi1PffkBO4KPLiXCX04a+LfQeGLfm9/arh0xljmAmtEu2eUk=',
  }

  user { 'ansible':
    ensure => 'present',
    shell  => '/bin/bash',
    groups => ['sudo'],
  }
  ->ssh_authorized_key { 'ansible':
    ensure => present,
    user   => 'ansible',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABgQC8qE50n9zhBb7Z6riPt59Hh8ZyTKfHmSOZ2mkLWO7XW4k41kUBNUb0rb8LHsJ9ZvLXziAuKBmemUX3SYnRINvK187zei0+fu753g5djs3uPka1NOKuRKHt0EJNo4GdZn/SLPktYI0LBhbVY0tDlkLHlTa57UCUr4eKao/0pzhSGGDqocsHkpAK8SWQsHZLQVJ8Kc+hsq+HGGiBGQcWSz7ZvwdCv0VZbeYyecSEtPdhwcyjw+Wgxod6LdwVU+EXJC9nrK1ak+TGD86/HHoEY+qQCRXrQpoemN4+Ina7OeH0Dts5aqszdVDDd1HXIC8OsENrgTVKsL+3liONRHnmMg8tOIaMyV53bQFddsap3V7v1FQIv6UKJo2ePETg0bStjsh5UcUHXqGK+FJvIV2VRKUzjIlLDibWliUvEDz3e50177dVwKYWU8luBtAm3c95RNYLbj63DWgHITbdx6Dx9pJfXiJAh3es1/0q87cRfnstTFvsjXz4Fg/jtKKJs1P2dx0=',
  }

  user { 'vagrant':
    ensure => 'absent',
  }

}
