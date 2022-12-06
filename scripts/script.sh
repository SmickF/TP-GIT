#!/bin/bash


# Copier le fichier de configuration sur le serveur

cp ./config_files/ssh/sshd_config /etc/ssh/sshd_config

cp ./config_files/ssh/Banner /etc/Banner

# Création utilisateur

echo "Nom d'utilisateur :"
read username

useradd -m -d/home/$username -s /bin/bash -c "$username" $username
passwd $username
usermod -aG sudo $username


# Insertion clé public

echo "Clé SSH :"
read key_ssh

echo $key_ssh >> ~/.ssh/authorized_keys


# Redemarrer le service sshd 

systemctl restart sshd 