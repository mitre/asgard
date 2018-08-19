FROM ubuntu

RUN apt-get update && apt-get install -y curl software-properties-common wget tar

# Install common applications
RUN apt-get install -y git

# Install ChefDK
RUN /bin/bash -c "curl -L https://omnitruck.chef.io/install.sh | bash -s -- -P chefdk -c current"

# Install InSpec
RUN /bin/bash -c "curl -L https://omnitruck.chef.io/install.sh | bash -s -- -P inspec -c current"

RUN /bin/bash -c "curl https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz > go.tar.gz \
    && tar -C /usr/local -xvf go.tar.gz"
#RUN add-apt-repository ppa:gophers/archive
#RUN apt-get update && apt-get install -y golang-1.10-go git

#RUN adduser user
#USER user

RUN /bin/bash -c "export PATH=$PATH:/usr/local/go/bin \
    && go get -v github.com/yudai/gotty \
    && cd /root/go/src/github.com/yudai/gotty \
    && git remote add sauriol https://github.com/sauriol/gotty \
    && git pull sauriol master \
    && go install"

EXPOSE 8080

CMD ["/root/go/bin/gotty", "--permit-write", "/bin/bash"]
