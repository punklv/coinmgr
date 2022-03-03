# TODO
#
# sudo setfacl -m u:boss:rwx -R /etc/puppetlabs/
# sudo setfacl -m default:boss:rwx -R /etc/puppetlabs/
#
#

node "snode03.dx" {

  $includes = lookup('classes', Array, deep, {})
  
  include base
  include setup
  include $includes
  
}


node "snode02.dx" {
  include setup
  include base
}

node "snode01.dx" {
  include setup
  include base
}

node "gethnode01.dx" {
  include setup
  include base
}

