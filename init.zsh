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
	  p6m7g8-dotfiles/p61password
  )
}

######################################################################
#<
#
# Function: p6df::modules::1password::external::brew()
#
#>
######################################################################
p6df::modules::1password::external::brew() {

  p6df::modules::homebrew::cli::brew::install 1password-cli
  p6df::modules::homebrew::cli::brew::install 1password --cask

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::1password::prompt::line()
#
#  Returns:
#	str - str
#
#  Environment:	 OP_ACCOUNT
#>
######################################################################
p6df::modules::1password::prompt::line() {

  local str
  str="1password:\t  [$OP_ACCOUNT] [$OP_EMAIL] [$OP_VAULT_NAME]"

  p6_return_str "$str"
}
