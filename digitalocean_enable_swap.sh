#!/bin/bash

# Show free memory
free

# Create swap file
touch /var/swap.img

# Set swap file permissions
chmod 600 /var/swap.img

# Convert file
dd if=/dev/zero of=/var/swap.img bs=2048k count=1000

# Tell the system it's a swap file
mkswap /var/swap.img

# Turn the swap file on
swapon /var/swap.img

# Make the swap file come on at startup
echo "/var/swap.img    none    swap    sw    0    0" >> /etc/fstab

# Show free memory
free
