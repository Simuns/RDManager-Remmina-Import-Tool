mkdir export
csvlenght=$(wc -l import.csv | awk '{print $1}')
i=2
while [ "$i" -le "$csvlenght" ]; do
i=$(($i + 1))
name=$(awk -F "," '{print $4}' import.csv | sed -n ''$i'p' | sed 's/ /-/g' | sed 's/---/-/g')
group=$(awk -F "," '{print $5}' import.csv | sed -n ''$i'p' | sed 's/ /-/g')
server=$(awk -F "," '{print $1}' import.csv | sed -n ''$i'p')
port=$(awk -F "," '{print $2}' import.csv | sed -n ''$i'p')
if [ -z "$port" ]
then
      echo "no custom port" 
else
      server="${server}:${port}"
fi
echo "----NEW HOST------"
echo "name $name"
echo "group $group"
echo "server $server"
cp blank.remmina export/IMP-$name-$group.remmina
cat <<EOF >> export/IMP-$name-$group.remmina
name=$name
server=$server
group=$group
EOF
done