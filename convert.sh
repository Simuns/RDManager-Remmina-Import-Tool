mkdir export
csvlenght=$(wc -l import.csv | awk '{print $1}')
csvlenght=$(($csvlenght - 1))
i=2
while [ "$i" -le "$csvlenght" ]; do
name=$(awk -F "," '{print $4}' import.csv | sed -n ''$i'p' | sed 's/ /-/g' | sed 's/---/-/g')
group=$(awk -F "," '{print $5}' import.csv | sed -n ''$i'p' | sed 's/ /-/g')
server=$(awk -F "," '{print $1}' import.csv | sed -n ''$i'p')
port=$(awk -F "," '{print $2}' import.csv | sed -n ''$i'p')
if [ -z "$port" ]
then
      :
else
      server="${server}:${port}"
fi
echo "Creating IMP-$name-$group"
cp blank.remmina export/IMP-$name-$group.remmina
cat <<EOF >> export/IMP-$name-$group.remmina
name=$name
server=$server
group=$group
EOF
i=$(($i + 1))
done