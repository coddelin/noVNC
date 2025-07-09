sudo apt update
# 安装桌面
sudo apt install xfce4 xfce4-terminal xfce4-goodies xorg dbus-x11 -y
#安装noVNC需要的虚拟显示服务
sudo apt install x11-xserver-utils xvfb -y
#安装novnc 套装
sudo apt install x11vnc websockify novnc -y


#设置连接密码
x11vnc -storepasswd