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
	  p6m7g8-dotfiles/p6common
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

  p6df::modules::homebrew::cli::brew::install 1password-cli
  p6df::modules::homebrew::cli::brew::install 1password --cask
 
  p6_return_void
}
