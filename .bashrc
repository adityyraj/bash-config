# ==============================
# GENERAL & NAVIGATION
# ==============================
alias c="clear"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias h="history"
alias x="exit"

# Safety flags for file deletion
alias rm="rm -i"
alias rmf="rm -rf"

# Shell configuration helpers
alias cbash="${EDITOR:-code} ~/.bashrc"
alias abash="source ~/.bashrc"

# ==============================
# GIT
# ==============================
alias g="git"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gca="git commit --amend"
alias gs="git status"
alias gl="git log --oneline --graph --decorate --all"
alias gp="git push"
alias gpf="git push"
alias gpl="git pull --rebase"

# ==============================
# NPM & SCRIPTS
# ==============================
alias n="npm"
alias ni="npm install"
alias nid="npm install -D"
alias nrm="npm uninstall"

alias dev="npm run dev"
alias build="npm run build"
alias start="npm start"
alias test="npm test"

# Project Initializers
alias nextapp="npx create-next-app@latest"
alias vite="npm create vite@latest"

# Prettier + Tailwind Plugin setup via NPM
alias pretty='npm install -D prettier prettier-plugin-tailwindcss && echo '\''{
  "plugins": ["prettier-plugin-tailwindcss"]
}'\'' > .prettierrc'

# ==============================
# CLEANUP UTILITIES
# ==============================
# Remove local project build folders
alias rmnode="rm -rf node_modules"
alias rmnext="rm -rf .next"
alias clean-build="rm -rf .next node_modules dist build .turbo"

# Total fresh re-install for NPM
alias clean-npm="rm -rf node_modules .next package-lock.json && npm install"

# Deep Clean: Recursively purge ALL node_modules, .next, dist, build, and out folders in subdirectories
alias nuke-deep="find . \( -name 'node_modules' -o -name '.next' -o -name 'dist' -o -name 'build' -o -name 'out' \) -type d -prune -exec rm -rf '{}' +"

# ==============================
# CODE FORMATTING
# ==============================
# Formats only specific file types``
alias format="npx prettier --write \"**/*.{js,jsx,ts,tsx,json,css,scss,md}\""

# Formats all supported files in the current project
alias format-all="npx prettier --write ."

# Checks for formatting issues without modifying files
alias format-check="npx prettier --check ."