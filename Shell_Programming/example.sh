#!/bin/sh

#clear

echo "Shell program starts";

echo "Hello, $USER";
echo "Today's date is `date`, this is week `date +"%V"`."
echo "This is `uname -s` running on a `uname -m` processor."
uptime
echo "################################################################"
fruit=(apple banana orange mango);
#fruit="kiwi";
echo $fruit;
veggie[0]="potato";
veggie[10]="tomato";

# For debugging purposes
#set -x
#w
#set +x

echo ${veggie[10]};
echo ${fruit[2]};
echo "################################################################"

echo "Cmdline args provided";
echo $1 $2 $3;
echo "Total number of args provided = $#";
echo "################################################################"

echo "sp{el,il,al}l";
echo sp{el,il,al}l;
echo ${bird:=kingfisher};

echo $(date);
echo "$(date)";
echo `date`;

echo $[400+20*(10+2)];

echo $VAR
set -u #treat unset variables as an error
echo $VAR
