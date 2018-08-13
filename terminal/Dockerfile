FROM ubuntu

RUN apt-get update && apt-get install -y curl software-properties-common wget

RUN curl -o /usr/local/share/ca-certificates/MITRE_BA_Root.crt http://pki.mitre.org/MITRE%20BA%20Root.crt
RUN curl -o /usr/local/share/ca-certificates/MITRE_BA_NPE_CA-1.crt http://pki.mitre.org/MITRE%20BA%20NPE%20CA-1.crt
RUN curl -o /usr/local/share/ca-certificates/MITRE_BA_NPE_CA-3.crt http://pki.mitre.org/MITRE%20BA%20NPE%20CA-3.crt
RUN update-ca-certificates
RUN echo "Acquire::http::Proxy \"http://gatekeeper.mitre.org:80\";" >> /etc/apt/apt.conf

# Install common applications
RUN apt-get install -y git

# Install InSpec
RUN /bin/bash -c "curl https://omnitruck.chef.io/install.sh | bash -s -- -P inspec"

# Install ChefDK
RUN /bin/bash -c "wget https://packages.chef.io/files/stable/chefdk/3.1.0/ubuntu/18.04/chefdk_3.1.0-1_amd64.deb"
RUN /bin/bash -c "dpkg -i chefdk_3.1.0-1_amd64.deb"

RUN add-apt-repository ppa:gophers/archive
RUN apt-get update && apt-get install -y golang-1.10-go git

#RUN adduser user
#USER user

RUN /bin/bash -c "export PATH=$PATH:/usr/lib/go-1.10/bin \
    && go get -v github.com/yudai/gotty \
    && cd /root/go/src/github.com/yudai/gotty \
    && git remote add sauriol https://github.com/sauriol/gotty \
    && git pull sauriol master \
    && go install"

EXPOSE 8080

CMD ["/root/go/bin/gotty", "--permit-write", "--port", "80", "/bin/bash"]
