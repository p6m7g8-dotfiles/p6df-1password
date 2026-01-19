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
# Function: str str = p6df::modules::1password::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 OP_ACCOUNT OP_EMAIL OP_VAULT_NAME P6_DFZ_PROFILE_1PASSWORD
#>
######################################################################
p6df::modules::1password::prompt::mod() {

  local str

  if ! p6_string_blank "$P6_DFZ_PROFILE_1PASSWORD"; then
    str="1password:\t  $P6_DFZ_PROFILE_1PASSWORD:"
  fi

  if ! p6_string_blank "$OP_ACCOUNT"; then
    str=$(p6_string_append "$str" "$OP_ACCOUNT")
  fi
  if ! p6_string_blank "$OP_EMAIL"; then
    str=$(p6_string_append "$str" "$OP_EMAIL" "/")
  fi
  if ! p6_string_blank "$OP_VAULT_NAME"; then
    str=$(p6_string_append "$str" "$OP_VAULT_NAME" "/")
  fi

  p6_return_str "$str"
}
