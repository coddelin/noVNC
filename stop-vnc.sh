#!/bin/bash

echo "停止所有相关进程..."

pkill Xvfb
pkill xfce4-session
pkill x11vnc
pkill websockify
pkill novnc_proxy

echo "已停止所有进程。"