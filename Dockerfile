FROM jenkins/jenkins

USER root

# Install python-pip
RUN apt-get update && apt-get install python3-pip -y
#RUN python3 -m pip install --upgrade pip

# Install ansible
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python3 get-pip.py

RUN python3 -m pip install --user ansible

# Install Docker
RUN apt-get update && \
 apt-get install \
 ca-certificates \
 curl \
 gnupg \
 lsb-release

RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && \
 apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

RUN usermod -aG docker jenkins

#RUN chown jenkins:jenkins /var/run/docker.sock

USER jenkins

