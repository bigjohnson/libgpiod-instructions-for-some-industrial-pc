#This is a bash script to search gpio pins on gpio industrial pc boards.
#Sometimes the datasheet pins is wrong or there is not board datasheet, you can use this script wit a DMM to test the board and find the correct pin port couple.
LSMOD=$(lsmod)
if [[ ${LSMOD} == *"gpio_it87"* ]]
then
        for i in {0..63}
        do
                gpioset gpiochip0 ${i}=1
        done
        for i in {0..64}
        do
                echo ${i}
                gpioset gpiochip0 ${i}=0
                read -p "Press [Enter] to continue."
        done
else
        echo "Module gpio_it87 not load. Load it before!"
fi
