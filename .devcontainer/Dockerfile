FROM ubuntu:24.04

ARG USERNAME=ubuntu
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install basic dependencies
RUN apt-get update \
    && apt-get install -y \
    curl \
    build-essential \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Switch to the user
USER $USERNAME

# Install mise
RUN curl https://mise.run | sh
ENV PATH="/home/${USERNAME}/.local/bin:${PATH}"

# Install tools
RUN /home/${USERNAME}/.local/bin/mise use --global rust@latest && \
    /home/${USERNAME}/.local/bin/mise use --global uv@latest && \
    /home/${USERNAME}/.local/bin/mise use --global node@lts && \
    /home/${USERNAME}/.local/bin/mise use --global pnpm@latest

# Add mise shims to PATH
ENV PATH="/home/${USERNAME}/.local/share/mise/shims:${PATH}"

# Configure colored prompt
RUN echo 'export PS1="\[\e[32m\]\u@\h\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$ "' >> /home/${USERNAME}/.bashrc

# Persist bash history
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && mkdir -p /home/${USERNAME}/.commandhistory \
    && touch /home/${USERNAME}/.commandhistory/.bash_history \
    && echo "$SNIPPET" >> "/home/${USERNAME}/.bashrc"

# No idea why this line is necessary tbh
WORKDIR /workspaces