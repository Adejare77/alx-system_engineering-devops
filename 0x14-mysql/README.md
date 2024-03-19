# MySQL

Installing MySQL 5.7
- wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
- sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb
Select Ubuntu Bionic and then mysql 5.7 and OK
- sudo apt update
if there is error in locating key e.g NO_PUBKEY 467B942D3A79BD29, then use the next step else if no error, skip it
- sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29
- sudo apt update
- sudo apt-cache policy mysql-server
The above must show 5.7 included in the list
- sudo apt install -f mysql-client=5.7* mysql-community-server=5.7* mysql-server=5.7*
- sudo mysql_secure_installation
