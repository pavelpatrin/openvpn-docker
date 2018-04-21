# Base image
FROM centos

# OpenVPN server parameters
ARG server_host=yourserver.com
ARG server_port=1194
ARG server_proto=udp

# OpenVPN client parameters
ARG client_name=default

# Expose OpenVPN port
EXPOSE $server_port/server_proto

# Enable EPEL repo
RUN yum update -y
RUN yum install -y epel-release

# Install provisioner
RUN yum install -y ansible

# Copy dependent data
COPY ansible/ /ansible/
COPY pki/ /pki/

# Do a provision
RUN ansible-playbook /ansible/playbook.yml -e "server_host=$server_host server_port=$server_port server_proto=$server_proto client_name=$client_name"

# Start container
CMD /start
