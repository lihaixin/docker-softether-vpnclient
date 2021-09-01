# lihaixin/docker-softether-vpnclient

Softether VPN Client for Linux
https://www.softether.org

- Standard authenticatin only
- Single Virtual Hub only

## Usage

```
docker run -d --name=softether-vpnclient \
--net=host --privileged \ 
-e VPN_SERVER=<Softether VPN server> \
-e VPN_PORT=<Softether VPN port> \
-e ACCOUNT_USER=<Registered username> \
-e ACCOUNT_PASS=<Registered password> \
-e TAP_IPADDR=dhcp \
-e VIRTUAL_HUB=VPNGATE \
lihaixin/docker-softether-vpnclient
```

## Extra Options

- VIRTUAL_HUB=<Virtual Hub name> # Default is DEFAULT
- TAP_IPADDR=<IP address/netmask> # Default is retrieved by DHCP
  
  
## more CLI
  
```
VPN Client>help
You can use the following 66 commands: 
 About                    - Display the version information
 AccountAnonymousSet      - Set User Authentication Type of VPN Connection Setting to Anonymous Authentication
 AccountCertGet           - Get Client Certificate to Use for Cascade Connection
 AccountCertSet           - Set User Authentication Type of VPN Connection Setting to Client Certificate Authentication
 AccountCompressDisable   - Disable Data Compression when Communicating by VPN Connection Setting
 AccountCompressEnable    - Enable Data Compression when Communicating by VPN Connection Setting
 AccountConnect           - Start Connection to VPN Server using VPN Connection Setting
 AccountCreate            - Create New VPN Connection Setting
 AccountDelete            - Delete VPN Connection Setting
 AccountDetailSet         - Set Advanced Settings for VPN Connection Setting
 AccountDisconnect        - Disconnect VPN Connection Setting During Connection
 AccountEncryptDisable    - Disable Encryption when Communicating by VPN Connection Setting
 AccountEncryptEnable     - Enable Encryption when Communicating by VPN Connection Setting
 AccountExport            - Export VPN Connection Setting
 AccountGet               - Get Setting of VPN Connection Setting 
 AccountImport            - Import VPN Connection Setting
 AccountList              - Get List of VPN Connection Settings
 AccountNicSet            - Set Virtual Network Adapter for VPN Connection Setting to Use
 AccountPasswordSet       - Set User Authentication Type of VPN Connection Setting to Password Authentication
 AccountProxyHttp         - Set Connection Method of VPN Connection Setting to be via an HTTP Proxy Server
 AccountProxyNone         - Specify Direct TCP/IP Connection as the Connection Method of VPN Connection Setting
 AccountProxySocks        - Set Connection Method of VPN Connection Setting to be via an SOCKS Proxy Server
 AccountRename            - Change VPN Connection Setting Name
 AccountRetrySet          - Set Interval between Connection Retries for Connection Failures or Disconnections of VPN Connection Setting
                            
 AccountSecureCertSet     - Set User Authentication Type of VPN Connection Setting to Smart Card Authentication
 AccountServerCertDelete  - Delete Server Individual Certificate for VPN Connection Setting
 AccountServerCertDisable - Disable VPN Connection Setting Server Certificate Verification Option
 AccountServerCertEnable  - Enable VPN Connection Setting Server Certificate Verification Option
 AccountServerCertGet     - Get Server Individual Certificate for VPN Connection Setting
 AccountServerCertSet     - Set Server Individual Certificate for VPN Connection Setting
 AccountSet               - Set the VPN Connection Setting Connection Destination
 AccountStartupRemove     - Remove Startup Connection of VPN Connection Setting 
 AccountStartupSet        - Set VPN Connection Setting as Startup Connection
 AccountStatusGet         - Get Current VPN Connection Setting Status
 AccountStatusHide        - Set Connection Status and Error Screen to be Hidden when Connecting to VPN Server
 AccountStatusShow        - Set Connection Status and Error Screen to Display when Connecting to VPN Server
 AccountUsernameSet       - Set User Name of User to Use Connection of VPN Connection Setting
 CertAdd                  - Add Trusted CA Certificate
 CertDelete               - Delete Trusted CA Certificate
 CertGet                  - Get Trusted CA Certificate
 CertList                 - Get List of Trusted CA Certificates
 Check                    - Check whether SoftEther VPN Operation is Possible
 KeepDisable              - Disable the Keep Alive Internet Connection Function
 KeepEnable               - Enable the Keep Alive Internet Connection Function
 KeepGet                  - Get the Keep Alive Internet Connection Function
 KeepSet                  - Set the Keep Alive Internet Connection Function
 MakeCert                 - Create New X.509 Certificate and Private Key (1024 bit)
 MakeCert2048             - Create New X.509 Certificate and Private Key (2048 bit)
 NicCreate                - Create New Virtual Network Adapter
 NicDelete                - Delete Virtual Network Adapter
 NicDisable               - Disable Virtual Network Adapter
 NicEnable                - Enable Virtual Network Adapter
 NicGetSetting            - Get Virtual Network Adapter Setting
 NicList                  - Get List of Virtual Network Adapters
 NicSetSetting            - Change Virtual Network Adapter Setting
 NicUpgrade               - Upgrade Virtual Network Adapter Device Driver
 PasswordGet              - Get Password Setting to Connect to VPN Client Service
 PasswordSet              - Set the password to connect to the VPN Client service.
 RemoteDisable            - Deny Remote Management of VPN Client Service
 RemoteEnable             - Allow Remote Management of VPN Client Service
 SecureGet                - Get ID of Smart Card Type to Use
 SecureList               - Get List of Usable Smart Card Types
 SecureSelect             - Select the Smart Card Type to Use
 TrafficClient            - Run Network Traffic Speed Test Tool in Client Mode
 TrafficServer            - Run Network Traffic Speed Test Tool in Server Mode
 VersionGet               - Get Version Information of VPN Client Service

To reference the usage for each command, input "command name ?" to view a help.
The command completed successfully.

```
