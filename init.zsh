# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::1password::deps()
#
#>
######################################################################
p6df::modules::1password::deps() {
  ModuleDeps=(
  )
}

######################################################################
#<
#
# Function: p6df::modules::1passsword::external::brew()
#
#>
######################################################################
p6df::modules::1passsword::external::brew() {

  brew install 1password-cli
  brew install 1password --cask
 
  p6_return_void
}
 
