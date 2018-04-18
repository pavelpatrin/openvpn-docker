# Base image
FROM centos

# Canonical name for server certificate
ARG hostname=yourserver.com

# Expose VPN ports
EXPOSE 1194/udp

# Enable EPEL repo
RUN yum update -y
RUN yum install -y epel-release

# Install provisioner
RUN yum install -y ansible

# Provision container
COPY ansible/ /ansible/
RUN ansible-playbook /ansible/playbook.yml -e "hostname=$hostname"

# Start container
CMD /start
