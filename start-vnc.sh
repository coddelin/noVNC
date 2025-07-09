#!/bin/bash

# 分辨率固定为 3840x2160x24
RESOLUTION="2560x1440x24"
DISPLAY_NUM=":1"

echo "Starting virtual display $DISPLAY_NUM with resolution $RESOLUTION..."

# 杀掉旧进程，避免冲突
pkill Xvfb
pkill xfce4-session
pkill x11vnc
pkill websockify

sleep 1

# 启动虚拟显示服务器
Xvfb $DISPLAY_NUM -screen 0 $RESOLUTION &
XVFB_PID=$!

sleep 2

export DISPLAY=$DISPLAY_NUM

# 启动 XFCE 桌面
startxfce4 &
XFCE_PID=$!

sleep 3

# 启动 x11vnc，使用已存密码
x11vnc -display $DISPLAY_NUM -rfbauth ~/.vnc/passwd -forever -noxdamage &
X11VNC_PID=$!

sleep 2
# 启动网页noVNC
/usr/bin/websockify --web=/usr/share/novnc 6080 localhost:5900 &

echo "启动完成！请在浏览器访问：http://<服务器IP>:6080/vnc.html"
echo "进程信息:"
echo "  Xvfb PID: $XVFB_PID"
echo "  XFCE PID: $XFCE_PID"
echo "  x11vnc PID: $X11VNC_PID"
echo "  noVNC PID: $NOVNC_PID"
