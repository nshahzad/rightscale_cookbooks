#
# Cookbook Name:: lb
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

include RightScale::LB::Helper

action :install do
  raise "The :install action is not supported for the generic lb provider."
end


action :add_vhost do
  raise "The :add_vhost action is not supported for the generic lb provider."
end


action :attach do
  raise "The :attach action is not supported for the generic lb provider."
end

action :advanced_configs do
  raise "The :advanced_configs action is not supported for the generic " +
    "lb provider."
end


action :attach_request do

  pool_name = new_resource.pool_name

  log "  Attach request for #{new_resource.backend_id} / " +
    "#{new_resource.backend_ip} / #{pool_name}"

  # Runs remote_recipe for each vhost the app server wants to be part of.
  # See http://support.rightscale.com/12-Guides/Chef_Cookbooks_Developer_Guide/Chef_Resources#RemoteRecipe
  # for the "remote_recipe" resource.
  remote_recipe "Attach to load balancer" do
    recipe "lb::handle_attach"
    attributes :remote_recipe => {
      :backend_ip => new_resource.backend_ip,
      :backend_id => new_resource.backend_id,
      :backend_port => new_resource.backend_port,
      :pools => pool_name
    }
    recipients_tags "loadbalancer:#{pool_name}=lb"
  end

end


action :detach do
  raise "The :detach action is not supported for the generic lb provider."
end


action :detach_request do

  pool_name = new_resource.pool_name

  log "  Detach request for #{new_resource.backend_id} / #{pool_name}"

  # Runs remote_recipe for each vhost the app server is part of.
  # See http://support.rightscale.com/12-Guides/Chef_Cookbooks_Developer_Guide/Chef_Resources#RemoteRecipe
  # for the "remote_recipe" resource.
  remote_recipe "Detach from load balancer" do
    recipe "lb::handle_detach"
    attributes :remote_recipe => {
      :backend_id => new_resource.backend_id,
      :pools => pool_name
    }
    recipients_tags "loadbalancer:#{pool_name}=lb"
  end

end


action :setup_monitoring do
  raise "The :setup_monitoring action is not supported for the generic " +
    "lb provider."
end


action :restart do
  raise "The :restart action is not supported for the generic lb provider."
end
