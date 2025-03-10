FROM debian:12

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget git sudo && \
    apt-get clean

# Add a non-root user
RUN useradd -ms /bin/bash dockeruser
RUN adduser dockeruser sudo

# Switch to non-root user
USER dockeruser
WORKDIR /home/dockeruser

# Clone LAMP installation script
RUN git clone https://github.com/teddysun/lamp.git

# Set execute permission
RUN chmod +x lamp/lamp.sh

# Run LAMP installation script
RUN sudo ./lamp/lamp.sh

# Expose ports
EXPOSE 80 443
