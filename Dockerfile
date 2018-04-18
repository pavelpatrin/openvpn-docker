FROM centos

# Expose VPN ports
EXPOSE 1194/udp

# Enable EPEL repo
RUN yum update -y
RUN yum install -y epel-release

# Install provisioner
RUN yum install -y ansible

# Provision container
COPY ansible/ /ansible/
RUN ansible-playbook /ansible/playbook.yml

# Start container
CMD /start
