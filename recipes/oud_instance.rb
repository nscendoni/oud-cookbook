script "change_ownership" do
  interpreter "bash"
	code <<-EOH
		chown #{node['oud']['sysuser']} #{node['oud']['middleware_home']}
	EOH
end

bash "create_instance" do
        cwd node['oud']['middleware_home'] + '/' + 'Oracle_OUD1'
        user node['oud']['sysuser']
	environment 'INSTANCE_NAME' => node['oud']['instance_name']
	code <<-EOH
	   echo "#{node['oud']['root_password']}" >/tmp/pass ;
	   ./oud-setup \
           	--cli \
           	--baseDN dc=#{node['oud']['base_dn']} \
           	--sampleData 200 \
           	--ldapPort #{node['oud']['ldap_port']} \
           	--adminConnectorPort #{node['oud']['admin_port']} \
           	--rootUserDN "#{node['oud']['root_user_dn']}" \
           	-j /tmp/pass \
           	--no-prompt ;
	rm /tmp/pass
	EOH
        creates #{node['oud']['middleware_home']} + node['oud']['instance_name']
end

