#
# Cookbook Name:: app
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

rightscale_marker :begin

log "  Creating database config for application"
# See cookbooks/app/providers/default.rb for the "setup_db_connection" action.
app "default" do
  database_name node[:app][:database_name]
  database_user node[:app][:database_user]
  database_password node[:app][:database_password]
  database_server_fqdn node[:app][:database_server_fqdn]
  action :setup_db_connection
end

rightscale_marker :end
