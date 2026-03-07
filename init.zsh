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

  p6df::core::homebrew::cli::brew::install 1password-cli
  p6df::core::homebrew::cli::brew::install 1password --cask

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

  if p6_string_blank_NOT "$P6_DFZ_PROFILE_1PASSWORD"; then
    str="1password:\t  $P6_DFZ_PROFILE_1PASSWORD:"
  fi

  if p6_string_blank_NOT "$OP_ACCOUNT"; then
    str=$(p6_string_append "$str" "$OP_ACCOUNT")
  fi
  if p6_string_blank_NOT "$OP_EMAIL"; then
    str=$(p6_string_append "$str" "$OP_EMAIL" "/")
  fi
  if p6_string_blank_NOT "$OP_VAULT_NAME"; then
    str=$(p6_string_append "$str" "$OP_VAULT_NAME" "/")
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::1password::profile::on(profile, account, vault_name)
#
#  Args:
#	profile -
#	account -
#	vault_name -
#
#  Environment:	 P6_DFZ_PROFILE_1PASSWORD
#>
######################################################################
p6df::modules::1password::profile::on() {
  local profile="$1"
  local account="$2"
  local vault_name="$3"

  p6_env_export "P6_DFZ_PROFILE_1PASSWORD" "$profile"
  p6_1password_account_signin "$account"
  p6_1password_whoami_email
  p6_1password_vault_select "$vault_name"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::1password::profile::off()
#
#  Environment:	 OP_ACCOUNT OP_EMAIL OP_VAULT_NAME P6_DFZ_PROFILE_1PASSWORD
#>
######################################################################
p6df::modules::1password::profile::off() {

  p6_env_export_un P6_DFZ_PROFILE_1PASSWORD
  p6_env_export_un OP_ACCOUNT
  p6_env_export_un OP_EMAIL
  p6_env_export_un OP_VAULT_NAME

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::1password::mcp()
#
#  Environment:	 HOME
#>
######################################################################
p6df::modules::1password::mcp() {

  p6df::core::path::if "$HOME/.config/op/plugins"
  p6_js_npm_global_install "@takescake/1password-mcp"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::1password::mcp::env()
#
#  Environment:	 OP_SERVICE_ACCOUNT_TOKEN
#>
######################################################################
p6df::modules::1password::mcp::env() {

  if p6_string_blank "$OP_SERVICE_ACCOUNT_TOKEN"; then
    p6_env_export_un "OP_SERVICE_ACCOUNT_TOKEN"
  fi

  p6_return_void
}
