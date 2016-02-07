Oracle Unified Directory Server  Cookbook
============
Cookbook for Oracle Unified Directory Server installation

Requirements
------------
Installer and JDK has to be downloaded and stored on a http server.



Attributes
----------
default['oud']['inventory_path'] = '/home/oracle'

default['oud']['middleware_home'] = '/opt/oracle'
default['oud']['jdk'] = 'http://192.168.101.1/jdk-7u79-linux-x64.rpm'
default['oud']['installer_url'] = 'http://192.168.101.1/V75929-01.zip'

default['oud']['instance_name'] = 'asinst_1'
default['oud']['base_dn'] = 'dc=scendoni,dc=org'
default['oud']['ldap_port'] = 1389
default['oud']['admin_port'] = 4444
default['oud']['root_user_dn'] = 'cn=Directory Manager'


<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>

#TODO: Encrypt
default['oud']['root_password'] = 'password'
  
  <tr>
    <td><tt>default['oud']['sysuser']</tt></td>
    <td>String</td>
    <td>System user that run OUD</td>
    <td><tt>oracle</tt></td>
  </tr>
  <tr>
    <td><tt>default['oud']['sysgroup']</tt></td>
    <td>String</td>
    <td>System group that run OUD</td>
    <td><tt>oracle</tt></td>
  </tr>
</table>

Usage
-----
#### oud::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `oud` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[oud]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: 
--------
Nicola Scendoni

=======
# oud-cookbook
Chef Cookbook for Oracle Unified Directory installation
