#!/bin/bash
cat > ghostinit.sh <<EOF
sudo systemctl disable ghostinit
cd /home/ubuntu/
wget https://raw.githubusercontent.com/RunsetTech/above_open_u/master/bottom.sh && sudo bash bottom.sh
EOF

sudo cp ghostinit.sh /usr/bin/ghostinit.sh
sudo chmod +x /usr/bin/ghostinit.sh

cat > ghostinit.service <<EOF
[Unit]
Description=Ghost Init Service
[Service]
Type=simple
ExecStart=/bin/bash /usr/bin/ghostinit.sh
[Install]
WantedBy=multi-user.target
EOF

sudo cp ghostinit.service /etc/systemd/system/ghostinit.service
sudo chmod 644 /etc/systemd/system/ghostinit.service

sudo systemctl enable ghostinit
