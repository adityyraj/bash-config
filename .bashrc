# ==========================================
# SHELL ENVIRONMENT & PROMPT
# ==========================================
PS1='\[\033[32m\]\u@\h \[\033[33m\]\W\[\033[36m\]`__git_ps1 " (%s)"`\[\033[0m\]\n\$ '

alias ebash="${EDITOR:-code} ~/.bashrc"
alias sbash='source ~/.bashrc && printf "\n\033[1;32m[✓] ~/.bashrc reloaded successfully!\033[0m\n\n"'

# ==========================================
# SYSTEM & NAVIGATION UTILITIES
# ==========================================
# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Windows Explorer Integration
open() { explorer.exe "${1:-.}"; }

# Utilities & Shortcuts
alias c="clear"
alias h="history"
alias x="exit"
alias md="mkdir -p"

# File Safety
alias rm="rm -i"
alias rmf="rm -rf"

# Developer Tools
alias c.="code ."

# ==========================================
# GIT ALIASES
# ==========================================
# Core
alias g="git"
alias gcl="git clone"

# Status, Diff & Log
alias gs="git status"
alias gd="git diff"
alias gl="git log --oneline --graph --decorate --all"

# Staging & Commits
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit --amend"

# Branching & Switching
alias gb="git branch"
alias gba="git branch -a"
alias gco="git checkout"
alias gsw="git switch"
alias gnew="git switch -c"
alias gdel="git branch -d"

# Remote Actions
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpl="git pull --rebase"

# ==========================================
# NODE & PACKAGE MANAGEMENT
# ==========================================
alias n="npm"

# Scripts Quick-Launch
alias dev="npm run dev"
alias build="npm run build"
alias start="npm start"
alias test="npm test"

# Project Scaffolding
alias nextapp="npx create-next-app@latest"
alias vite="npm create vite@latest"

# ==========================================
# CODE FORMATTING (PRETTIER)
# ==========================================
_prettier_run() {
    if [ -f ./node_modules/.bin/prettier ]; then
        ./node_modules/.bin/prettier "$@"
    else
        npx --no-install prettier "$@"
    fi
}

alias fmt="_prettier_run --write ."
alias fmt-check="_prettier_run --check ."

# ==========================================
# CLEANUP & MAINTENANCE
# ==========================================
cn() {
  local pm="npm" icmd="npm ci" lock="package-lock.json"

  if [ -f "pnpm-lock.yaml" ]; then
    pm="pnpm"; icmd="pnpm install --frozen-lockfile"; lock="pnpm-lock.yaml"
  elif [ -f "yarn.lock" ]; then
    pm="yarn"; icmd="yarn install --frozen-lockfile"; lock="yarn.lock"
  elif [ -f "bun.lockb" ] || [ -f "bun.lock" ]; then
    pm="bun"; icmd="bun install --frozen-lockfile"; lock="bun.lock*"
  fi

  case "$1" in
    node)
      command rm -rf node_modules
      printf "\n\033[1;32m[✓] node_modules removed successfully!\033[0m\n\n"
      ;;
    next)
      command rm -rf .next
      printf "\n\033[1;32m[✓] .next cache removed successfully!\033[0m\n\n"
      ;;
    build)
      command rm -rf .next dist build .turbo .cache
      printf "\n\033[1;32m[✓] Build artifacts cleaned successfully!\033[0m\n\n"
      ;;
    in)
      printf "\n\033[1;34m[!] Detected package manager: %s\033[0m\n" "$pm"
      command rm -rf node_modules .next dist build .turbo .cache
      $icmd
      printf "\n\033[1;32m[✓] Dependencies installed cleanly!\033[0m\n\n"
      ;;
    fresh)
      printf "\n\033[1;34m[!] Detected package manager: %s\033[0m\n" "$pm"
      command rm -rf node_modules .next dist build .turbo .cache $lock
      $pm install
      printf "\n\033[1;32m[✓] Fresh installation complete!\033[0m\n\n"
      ;;
    *)
      command rm -rf node_modules .next dist build .turbo .cache
      printf "\n\033[1;32m[✓] Cleanup complete!\033[0m\n\n"
      ;;
  esac
}

nuke-deep() {
  find . \( \
    -name 'node_modules' \
    -o -name '.next' \
    -o -name 'dist' \
    -o -name 'build' \
    -o -name 'out' \
    -o -name '.turbo' \
    -o -name '.cache' \
  \) -type d -prune -exec rm -rf '{}' + && \
  printf "\n\033[1;31m[✓] Deep clean completed!\033[0m\n\n"
}

# ==========================================
# CUSTOM SHELL FUNCTIONS
# ==========================================
pretty() {
    npm install -D prettier prettier-plugin-tailwindcss

    printf '%s\n' \
    '{' \
    '  "plugins": ["prettier-plugin-tailwindcss"]' \
    '}' > .prettierrc

    printf "\n\033[1;32m[✓] Prettier setup complete!\033[0m\n\n"
}
