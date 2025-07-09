source ./install.sh
#复制脚本
sudo cp ./start-vnc.sh /usr/local/bin/.
sudo chmod +x /usr/local/bin/start-vnc.sh
#创建 Service
sudo tee /etc/systemd/system/vnc.service > /dev/null <<EOF
[Unit]
Description=VNC 2K XFCE Desktop
After=network.target

[Service]
Type=simple
User=vscodeuser
ExecStart=/usr/local/bin/start-vnc.sh
Restart=always
RestartSec=5
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
EOF

#启动服务
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl start vnc.service
#等待4秒查看启动状态
sleep 4
sudo systemctl status vnc.service
