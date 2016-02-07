#
# Cookbook Name:: oud
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "unzip_installer" do
        cwd '/home/' + node['oud']['sysuser']
        user node['oud']['sysuser']
        action :run
        command "unzip V75929-01.zip"
        creates '/home/'+node['oud']['sysuser']+'/Disk1'
end

directory node['oud']['middleware_home']+"/Oracle_OUD1" do
	owner node['oud']['sysuser']
	group node['oud']['sysuser']
	recursive true
	action :create
end

template '/tmp'+'/response.txt' do
        source 'response.erb'
end

execute "run_installer" do
	command "su oracle -l -c '/home/oracle/Disk1/runInstaller -silent -responseFile /tmp/response.txt -jreLoc /usr/java/latest -novalidation'"
	not_if { File.exist?(node['oud']['middleware_home']+"/Oracle_OUD1/oud-setup") }
	action :run
end
