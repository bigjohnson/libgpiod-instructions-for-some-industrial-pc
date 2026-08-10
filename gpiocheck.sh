LSMOD=$(lsmod)
if [[ ${LSMOD} == *"gpio_it87"* ]]
then
        for i in {0..64}
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
