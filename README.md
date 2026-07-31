# How to drive some industrial pc motherboard gpio with gpiod

## Tested with Rocky Linux 9.8 (Blue Onyx)

1. Install libgpiod and accessory programs: **sudo dnf install libgpiod libgpiod-utils libgpiod-devel python3-libgpiod**
2. Install development group programs: **sudo dnf group install development**
2. Download kernel module source: **wget https://github.com/Moxa-Linux/moxa-it87-gpio-driver/archive/refs/heads/master.zip**
3. Unzip kernel module source: **unzip master.zip**
4. Go into kernel module directory **cd moxa-it87-gpio-driver-master**
5. Build the module **make**
6. Install the module **loadmodule gpio-it87.ko**
7. Look the linux messages **dmesg**
```
[   80.339638] gpio_it87: loading out-of-tree module taints kernel.
[   80.339666] gpio_it87: module verification failed: signature and/or required key missing - tainting kernel
[   80.340088] gpio_it87: Found Chip IT8783 rev 0. 48 GPIO lines starting at 0a00h
```
8. Detect gpio chip **sudo gpiodetect**
```
gpiochip0 [gpio_it87] (48 lines)
```
9. List gpio lines **sudo gpiolist**
```
gpiochip0 - 48 lines:
        line   0:      unnamed       unused   input  active-high
        line   1:      unnamed       unused   input  active-high
        line   2:      unnamed       unused   input  active-high
        line   3:      unnamed       unused   input  active-high
```
