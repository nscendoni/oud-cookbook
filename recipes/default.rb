#
# Cookbook Name:: oud
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#yum_package ['xorg-x11-server-Xorg', 'compat-libstdc++-33', 'elfutils-libelf-devel', 'gcc-c++' , 'glibc-devel' , 'libaio' , 'libaio-devel' , 'libstdc++' , 'sysstat' , 'redhat-lsb' , 'curl', 'unzip' ] do
yum_package ['compat-libstdc++-33', 'elfutils-libelf-devel', 'gcc-c++' , 'glibc-devel' , 'libaio' , 'libaio-devel' , 'libstdc++' , 'sysstat' , 'redhat-lsb' , 'curl','unzip' , 'wget'] do
	action :install
end

rpm_package '/vagrant/jdk-7u79-linux-i586.rpm' do
	action :install
end

user node['oud']['sysuser'] do
	action :create
end

template '/etc/oraInst.loc' do
	source 'oraInst.loc.erb'
end

execute "download_installer" do                                             
	cwd '/home/' + node['oud']['sysuser']
	user node['oud']['sysuser']
	action :run   
	command "wget http://192.168.101.1/V75929-01.zip"                  
	creates '/home/'+node['oud']['sysuser']+'/Disk1'
end

execute "unzip_installer" do
        cwd '/home/' + node['oud']['sysuser']
        user node['oud']['sysuser']
        action :run
        command "unzip /vagrant/V75929-01.zip"
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
	command "su oracle -l -c '/home/oracle/Disk1/runInstaller -silent -responseFile /tmp/response.txt -jreLoc /usr/java/jdk1.7.0_79 -novalidation'"
	#creates "/home/oracle/Disk1"
	not_if { File.exist?(node['oud']['middleware_home']+"/Oracle_OUD1/oud-setup") }
	action :run
end
