#!/bin/bash

set -e

echo "Updating package list..."
apt-get update -y

echo "Installing nginx..."
apt-get install -y nginx

echo "Creating test web page..."
cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vagrant VM Test</title>
</head>
<body>
    <h1>Домашнее задание 1</h1>
    <p>Похлестов Никита</p>
</body>
</html>
EOF

echo "Enabling and starting nginx..."
systemctl enable nginx
systemctl restart nginx

echo "Provisioning completed successfully."