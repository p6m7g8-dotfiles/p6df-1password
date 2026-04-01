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
# Function: p6df::modules::1password::external::brews()
#
#>
######################################################################
p6df::modules::1password::external::brews() {

  p6df::core::homebrew::cli::brew::install 1password-cli
  p6df::core::homebrew::cli::brew::install 1password --cask

  p6_return_void
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
#>
######################################################################
p6df::modules::1password::profile::on() {
  local profile="$1"
  local account="$2"
  local vault_name="$3"

  p6_1password_account_signin "$account"
  p6_1password_whoami_email
  p6_1password_vault_select "$vault_name"

  p6_return_void
}

######################################################################
#<
#
# Function: words 1password = p6df::modules::1password::profile::mod()
#
#  Returns:
#	words - 1password
#
#  Environment:	 OP_ACCOUNT OP_EMAIL OP_VAULT_NAME
#>
######################################################################
p6df::modules::1password::profile::mod() {

  p6_return_words '1password' '$OP_ACCOUNT' '$OP_EMAIL' '$OP_VAULT_NAME'
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

  p6df::modules::anthropic::mcp::server::add "1password" "npx" "-y" "@takescake/1password-mcp"
  p6df::modules::openai::mcp::server::add "1password" "npx" "-y" "@takescake/1password-mcp"

  p6_return_void
}
