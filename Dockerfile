FROM    centos:centos6

# Enable Extra Packages for Enterprise Linux (EPEL) for CentOS
RUN     yum install -y epel-release
# Install Node.js and npm
RUN     yum install -y nodejs npm

# Install app dependencies
COPY package.json /src/package.json
RUN cd /src; npm install --production

WORKDIR /src

# Bundle app source
COPY src/index.js /src/index.js

EXPOSE  80
CMD ["node", "/src/index.js"]