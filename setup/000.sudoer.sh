echo "tony    ALL=(ALL)  NOPASSWD:   ALL" >> /etc/sudoers.d/custom-user
EDITOR=vi visudo -f /etc/sudoers.d/custom-user