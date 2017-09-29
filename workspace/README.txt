Installation Procedure
======================

Pre-condition (SQL Connection):
1) Please import the "Dump20130208.sql" into your MySQL Workbench 5.2 CE
2) Schema name: mwn
3) The Decrypted Web.config file is in the folder 2_Source (Same as this text file)
4) Replace it with the original Web.config file in the MWN project folder, or u may decrypt it yourself:
	- *This step onwards is for decrypting of the Web.config file*
	- Run your "Developer Command Prompt for VS2012"
	- Enter this command: aspnet_regiis -pdf connectionStrings *pathname of the Web.config*
	- *Note: -pdf = Decrypt, -pef = Encrypt
	- A "webconfig_XMLEncryption.PNG" is also in the folder 2_Source (Same as this text file) for your
	reference
5) Open the decrypted Web.config file in the MWN project folder
6) Change the connectionString="server=*your ip address*;User Id=*your sql user id*;database=mwn;password=*your sql password*;"
	- Example: connectionString="server=192.168.0.1;User Id=admin;database=mwn;password=123;"

Main Flow:
1) Open the "MWN.sln" file using Visual Studio 2012 (MWN -> MWN.sln)
*Note: Visual Studio 2010 may not be compatiable
2) Run the "Homepage.aspx" as that will be the main/index page of our website application
3) Login using the following accounts:
Admin User
Username: admin
Password: P@ssw0rd

Normal User:
Username: username
Password: P@ssw0rd

Alternate Flow:
3a) You may also register a new account, but make sure the email address you entered are valid as
the verification code sent to the registered email are required to verify your account
*Note: You are unable to login without your new registered account being verified

If you have any problems/difficulties, you may email me at 113340E@mymail.nyp.edu.sg or 
SMS me via HP: 8366-4422