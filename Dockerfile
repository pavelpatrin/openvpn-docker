# Base image
FROM centos

# OpenVPN server hostname
ARG server=yourserver.com

# Expose VPN ports
EXPOSE 1194/udp

# Enable EPEL repo
RUN yum update -y
RUN yum install -y epel-release

# Install provisioner
RUN yum install -y ansible

# Do a provision with persistent keys
COPY ansible/ /ansible/
COPY pki/ /pki/
RUN ansible-playbook /ansible/playbook.yml -e "server=$server"

# Start container
CMD /start
