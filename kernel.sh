wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.16.1.tar.xz
mkdir linux
cd linux
mv linux-4.16.1.tar.xz ./linux
tar xf linux-4.16.1.tar.xz
cd linux-4.16.1
cp /boot/config-$(uname -r) .config
sudo apt-get install fakeroot build-essential ncurses-dev xz-utils libssl-dev
make menuconfig
sudo make -j 4 && sudo make modules_install -j 4 && sudo make install -j 4
