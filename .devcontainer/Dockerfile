FROM ubuntu:24.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install base dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    pkg-config \
    libssl-dev \
    ca-certificates \
    sudo \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Ensure ubuntu user has sudo privileges (user already exists in ubuntu:24.04)
RUN usermod -aG sudo ubuntu && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to ubuntu user
USER ubuntu
WORKDIR /home/ubuntu

# Install Mise
RUN curl https://mise.run | sh

# Add Mise to PATH
ENV PATH="/home/ubuntu/.local/bin:/home/ubuntu/.local/share/mise/shims:${PATH}"

# Configure Mise to activate automatically
RUN echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc

# Install tools via Mise
RUN ~/.local/bin/mise use -g rust@latest && \
    ~/.local/bin/mise use -g uv@latest && \
    ~/.local/bin/mise use -g node@lts && \
    ~/.local/bin/mise use -g pnpm@latest

# Verify installations (this also caches the shims)
RUN ~/.local/bin/mise exec -- rustc --version && \
    ~/.local/bin/mise exec -- uv --version && \
    ~/.local/bin/mise exec -- node --version && \
    ~/.local/bin/mise exec -- pnpm --version

# Set up command history persistence
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && echo "$SNIPPET" >> "/home/ubuntu/.bashrc"

# Set up colorful bash prompt
RUN echo '' >> ~/.bashrc && \
    echo '# Colorful prompt' >> ~/.bashrc && \
    echo 'export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "' >> ~/.bashrc

# Add npm alias to use pnpm
RUN echo '' >> ~/.bashrc && \
    echo '# Use pnpm instead of npm' >> ~/.bashrc && \
    echo 'alias npm=pnpm' >> ~/.bashrc

# Set working directory to where the project will be mounted
WORKDIR /workspaces

# Default command
CMD ["/bin/bash"]