# RDManager-Remmina-Import-Tool
Import RDP connections from Remote Desktop Manager to Remmina using CSV file  
This only works for follwing variables:
- name
- group
- server
- port


### 1  
Rename your csv file import.csv and insert into "RDManager-Remmina-Import-Tool" directory
### 2  
Change directory to RDManager-Remmina-Import-Tool/
### 3  
run script 'bash convert.sh'
### 4  
run 'cp export/* ~/.local/share/remmina/'
### 5  
your RDP connections should now be accessable through remmina


#### Author: Símun Højgaard Lutzen | simunhojgaard@gmail.com
