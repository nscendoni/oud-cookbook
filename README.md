Oracle Unified Directory Server  Cookbook
============
Cookbook for Oracle Unified Directory Server 11.1.2.3 installation

Requirements
------------
Installer and JDK has to be downloaded and stored on a http server.



Attributes
----------


<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>


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
  <tr>
    <td><tt>default['oud']['inventory_path']</tt></td>
    <td>String</td>
    <td>Path for OUD inventory</td>
    <td><tt>/home/oracle</tt></td>
  </tr>
  <tr>
    <td><tt>default['oud']['middleware_home']</tt></td>
    <td>String</td>
    <td>Path for OUD Middleware installation</td>
    <td><tt>/opt/oracle</tt></td>
  </tr>
  <tr>
    <td><tt>default['oud']['jdk']</tt></td>
    <td>String</td>
    <td>Url for jdk installation.  RPM is required</td>
    <td><tt>http://192.168.101.1/jdk-7u79-linux-x64.rpm</tt></td>
  </tr>
  <tr>
    <td><tt>default['oud']['installer_url']</tt></td>
    <td>String</td>
    <td>Url for OUD installation.</td>
    <td><tt>http://192.168.101.1/V75929-01.zip</tt></td>
  </tr>
  <tr>
    <td><tt>default['oud']['instance_name']</tt></td>
    <td>String</td>
    <td>OUD instance name</td>
    <td><tt>asinst_1</tt></td>
  </tr>
  <tr>
    <td><tt>default['oud']['base_dn']</tt></td>
    <td>String</td>
    <td>Base DN</td>
    <td><tt>dc=scendoni,dc=org</tt></td>
  </tr>
  <tr>
    <td><tt>default['oud']['ldap_port']</tt></td>
    <td>String</td>
    <td>LDAP Port</td>
    <td><tt>1389</tt></td>
  </tr>
  <tr>
    <td><tt>default['oud']['admin_port']</tt></td>
    <td>String</td>
    <td>Admin Instance Port</td>
    <td><tt>4444</tt></td>
  </tr>
  <tr>
    <td><tt>default['oud']['root_user_dn']</tt></td>
    <td>String</td>
    <td>Admin DN</td>
    <td><tt>cn=Directory Manager</tt></td>
  </tr>
  <tr>
    <td><tt>default['oud']['root_password']</tt></td>
    <td>String</td>
    <td>Admin DN password. TODO: encrypt it</td>
    <td><tt>password</tt></td>
  </tr>
  
</table>

Usage
-----
#### oud::default
Install requried packages, jdk, OUD package and create one OUD Server instance.

#### oud::oud_prepare
Install requried packages, jdk, create oraInst.loc file and download installer

#### oud::oud_install
Install OUD packages

#### oud::oud_instance
Install OUD Server instance

Contributing
------------

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
