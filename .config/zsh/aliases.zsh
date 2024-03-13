# ALIASES ---------------
alias vim='nvim'
alias v='nvim'
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias ls='ls --color=auto'
alias l='ls'
alias formpy='autopep8 --in-place --aggressive --aggressive *.py'
alias grep='grep --color=auto'
alias pi='tmux new -s c++ -c /home/sisoyyo/Desk/S5-6-Epita/zork/libzork/'
alias form='ra=$(find -name "*.cc"); clang-format -i $ra'
alias run="autoreconf -vfi && ./configure  CFLAGS='-fsanitize=address -g -O0' LDFLAGS='-fsanitize=address'"
alias cloner='git clone git@gitlab.cri.epita.fr:raj-sunil.mahajan-aka-mali/42sh.git'
alias tester='cd ~/Desk/school/shell/21sh/42sh/tests/categories/execution'
alias conf="cd $HOME/.config/nvim/lua/custom"
alias cat="bat"
alias pp="piscine_push"
alias tigenv="docker run --rm -it -v $PWD:/tc --workdir /tc registry.lrde.epita.fr/tc-sid"
