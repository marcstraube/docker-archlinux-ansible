FROM archlinux:latest
RUN pacman -Syu --noconfirm ansible sudo

# Create 'ansible' user with sudo permissions
ENV ANSIBLE_USER=ansible SUDO_GROUP=wheel
RUN set -xe && \
    groupadd -r ${ANSIBLE_USER} && \
    useradd -m -g ${ANSIBLE_USER} ${ANSIBLE_USER} && \
    echo "%${ANSIBLE_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/10-ansible
