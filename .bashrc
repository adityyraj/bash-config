# ==========================================
# SHELL ENVIRONMENT & PROMPT
# ==========================================
PS1='\[\033[32m\]\u@\h \[\033[33m\]\W\[\033[36m\]`__git_ps1 " (%s)"`\[\033[0m\]\n\$ '

# Dotfiles Management
alias cbash="${EDITOR:-code} ~/.bashrc"
alias abash="source ~/.bashrc && echo -e \"\n\e[35mbashrc config applied!\e[0m\n\""

# ==========================================
# SYSTEM & NAVIGATION UTILITIES
# ==========================================
# Quick System Commands
alias c="clear"
alias h="history"
alias x="exit"
alias open="explorer ."

# Safe File Operations
alias rm="rm -i"
alias rmrf="rm -rf"

# Directory Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Developer Tools
alias code.="code ."

# ==========================================
# GIT ALIASES
# ==========================================
alias g="git"

# Status & Log
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
alias gcl="git clone"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpl="git pull --rebase"

# ==========================================
# NODE & PACKAGE MANAGEMENT
# ==========================================
# Core NPM Commands
alias n="npm"
alias ni="npm install"
alias nid="npm install -D"
alias nrm="npm uninstall"
alias nr="npm run"

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
alias format="npx prettier --write '**/*.{js,jsx,ts,tsx,json,css,scss,md}'"
alias format-all="npx prettier --write ."
alias format-check="npx prettier --check ."

# ==========================================
# CLEANUP & MAINTENANCE
# ==========================================
alias rmnode="rm -rf node_modules"
alias rmnext="rm -rf .next"
alias clean-build="rm -rf .next node_modules dist build .turbo"
alias clean-npm="rm -rf node_modules .next package-lock.json && npm install"

# Deep Cleanup (Find and remove all build artifacts recursively)
alias nuke-deep="find . \( \
  -name 'node_modules' \
  -o -name '.next' \
  -o -name 'dist' \
  -o -name 'build' \
  -o -name 'out' \
  -o -name '.turbo' \
\) -type d -prune -exec rm -rf '{}' + && echo -e '\n\e[35mdeep clean successfully!\e[0m\n'"

# ==========================================
# CUSTOM SHELL FUNCTIONS
# ==========================================

# Setup Prettier with Tailwind Plugin
pretty() {
    npm install -D prettier prettier-plugin-tailwindcss

    printf '%s\n' \
    '{' \
    '  "plugins": ["prettier-plugin-tailwindcss"]' \
    '}' > .prettierrc

    echo -e "\n\e[35mprettier plugin added successfully!\e[0m\n"
}

# Generate shadcn-style Tailwind Merge Utility
autils() {
    npm install clsx tailwind-merge

    mkdir -p lib

    cat <<'INNER_EOF' > lib/utils.ts
import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
INNER_EOF

    echo -e "\n\e[35mcn helper added!\e[0m\n"
}
