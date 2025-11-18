FROM ubuntu:22.04

ENV INSTALL_DIR="/root/"
ENV HOME=/root
ENV XDG_DATA_HOME=/root/.local/share
ENV XDG_CONFIG_HOME=/root/.config

# Install required dependencies such as xclip
RUN apt-get update && \
    apt-get install -y wget curl git lsb-release software-properties-common gnupg zip xclip python3-venv gcc  && \
    rm -rf /var/lib/apt/lists/*

# Clean previous config
RUN rm -rf "${INSTALL_DIR}.config"

# Install node
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs

# Install Neovim
RUN cd "$INSTALL_DIR" && \
    wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz && \
    tar xzvf nvim-linux-x86_64.tar.gz && \
    ln -s "${INSTALL_DIR}nvim-linux-x86_64/bin/nvim" /usr/local/bin/nvim && \
    rm nvim-linux-x86_64.tar.gz

# Install ripgrep
RUN cd "$INSTALL_DIR" && \
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep_14.1.1-1_amd64.deb && \
    apt-get update && \
    apt-get install -y "./ripgrep_14.1.1-1_amd64.deb" && \
    rm ripgrep_14.1.1-1_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

# Add neovim configuration
RUN git clone https://github.com/makeevmr/nvim "${INSTALL_DIR}.config/nvim" 

# Pre-install Neovim plugins, Treesitter parsers and Mason LSPs
RUN nvim --headless \
    +'Lazy! sync' \
    +'Lazy! install' \
    +'TSUpdateSync' \
    +'MasonInstall clangd cmake-language-server lua-language-server pyright ruff typescript-language-server' \
    +qall

CMD ["bash"]
