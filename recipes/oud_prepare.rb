#
# Cookbook Name:: oud
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

yum_package ['compat-libcap1', 'compat-libstdc++-33', 'elfutils-libelf-devel', 'gcc-c++' , 'glibc-devel' , 'libaio' , 'libaio-devel' , 'libstdc++' , 'sysstat' , 'redhat-lsb' , 'curl','unzip' , 'wget'] do
	action :install
end

# rpm resource doesn't work for http rpm
execute "unzip_installer" do
        cwd '/tmp/'
        action :run
        command "rpm -ivh " + node['oud']['jdk']
	creates '/usr/java'
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
	command "wget " +node['oud']['installer_url']
end

