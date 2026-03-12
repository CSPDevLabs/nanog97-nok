FROM mcr.microsoft.com/devcontainers/python:3.11-bookworm

## RUN echo "deb [trusted=yes] https://netdevops.fury.site/apt/ /" | \
##    tee -a /etc/apt/sources.list.d/netdevops.list

# setup keyring for github cli
RUN sudo mkdir -p -m 755 /etc/apt/keyrings \
    && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# install tools
RUN rm -f /etc/apt/sources.list.d/yarn.list \
    && apt update \
    && apt install -y --no-install-recommends \
        direnv \
        btop \
        gh \
        iputils-ping \
        dnsutils \
        skopeo \
        bat \
    && rm -rf /var/lib/apt/lists/*

# install kubectl
RUN bash -c "curl -LO 'https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl'" && chmod +x kubectl && mv kubectl /usr/local/bin/

# install kind
RUN bash -c "$(curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64)" && chmod +x kind && mv kind /usr/local/bin/


# maintain SSH_AUTH_SOCK env var when using sudo
RUN mkdir -p /etc/sudoers.d && echo 'Defaults env_keep += "SSH_AUTH_SOCK"' > /etc/sudoers.d/ssh_auth_sock

COPY ./.devcontainer/bash/install_bash_autocompletion.sh /tmp/install_bash_autocompletion.sh
RUN bash -c "/tmp/install_bash_autocompletion.sh"
RUN usermod -s /bin/zsh vscode

RUN skopeo copy docker://kindest/node:v1.33.1 docker-archive:/var/cache/kindest-node.tar:kindest/node:v1.33.1


# vscode user is created in the MS devcontainer image
USER vscode

# create ssh key for vscode user to enable passwordless ssh to devices
RUN ssh-keygen -t ecdsa -b 256 -N "" -f ~/.ssh/id_ecdsa

# install pyenv
RUN bash -c "$(curl https://pyenv.run)"


# setup zsh
COPY ./.devcontainer/zsh/.zshrc /home/vscode/.zshrc
COPY ./.devcontainer/zsh/.p10k.zsh /home/vscode/.p10k.zsh
COPY ./.devcontainer/zsh/install-zsh-plugins.sh /tmp/install-zsh-plugins.sh


RUN bash -c "/tmp/install-zsh-plugins.sh "