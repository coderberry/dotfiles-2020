# Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# Use the bin folder
export PATH="$HOME/.bin:$PATH"

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Realvolve
export PATH="/usr/local/opt/elasticsearch@2.4/bin:$PATH"

# Flossbank
export PATH="/Users/eberry/.flossbank/bin:$PATH"

# Cargo (Rust)
export PATH="$HOME/.cargo/bin:$PATH"