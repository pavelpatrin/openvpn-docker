# Base image
FROM centos

# OpenVPN server hostname and port
ARG server_host=yourserver.com
ARG server_port=1194

# Expose VPN ports
EXPOSE $server_port/udp

# Enable EPEL repo
RUN yum update -y
RUN yum install -y epel-release

# Install provisioner
RUN yum install -y ansible

# Copy dependent data
COPY ansible/ /ansible/
COPY pki/ /pki/

# Do a provision
RUN ansible-playbook /ansible/playbook.yml -e "server_host=$server_host server_port=$server_port"

# Start container
CMD /start
