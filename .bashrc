#
# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

setxkbmap us -variant dvorak
set -o vi
alias vim='nvim'
alias v='nvim'

alias ls='ls --color=auto'
alias formpy='autopep8 --in-place --aggressive --aggressive *.py'
alias l='ls'
alias grep='grep --color=auto'
alias scan='nmcli device wifi list'
alias con='nmcli device wifi connect "David’s iPhone" password holachavales'
alias pi='tmux new -s c++ -c /home/sisoyyo/Desk/S5-6-Epita/zork/libzork/'
alias graph='tmux new -s graph -c /home/sisoyyo/Desk/graph'
alias shelling='tmux new -s 42sh -c /home/sisoyyo/Desk/school/shell/21sh/42sh'
alias sk='cd ~/Desk/school'
alias ht='tmux new -s httpd -c ~/Desk/school/httpd'
alias adv='tmux new -s christmas -c ~/Desk/AdventOfCode2023'
alias form='ra=$(find -name "*.[ch]"); clang-format -i $ra'
alias run="autoreconf -vfi && ./configure  CFLAGS='-fsanitize=address -g -O0' LDFLAGS='-fsanitize=address'"
alias cloner='git clone git@gitlab.cri.epita.fr:raj-sunil.mahajan-aka-mali/42sh.git'
alias tester='cd ~/Desk/school/shell/21sh/42sh/tests/categories/execution'
alias conf="cd $HOME/.config/nvim/lua/custom"


br() { echo "$1" > /sys/class/backlight/amdgpu_bl2/brightness; }

jump() { mkdir "$1" && cd "$1";}

function create_makefile() {
    if [ $# -eq 0 ]; then
        echo "Usage: create_makefile <arglist without extensions>"
        return 1
    fi

  echo "CC = gcc" >> Makefile
  echo "CFLAGS = -std=c99 -Wall -Wextra -Werror -pedantic -Wvla" >> Makefile

  #echo "LDFLAGS = -fsanitize=address">> Makefile
  echo >> Makefile

  echo -n "OBJS = " >> Makefile
  for var in $@; do
      echo -n $var.o >> Makefile
  done

  echo >> Makefile

  echo "BIN = $1" >> Makefile

  echo >> Makefile

  echo 'all: $(BIN)' >> Makefile

  echo >> Makefile

  echo '$(BIN): $(OBJS)' >> Makefile

  echo >> Makefile

  echo "clean:" >> Makefile
  echo -en '\t' >> Makefile
  echo '$(RM) $(BIN) $(OBJS) compile_commands.json' >> Makefile

  if [ -e Makefile ]; then
      echo -e "\e[32mMakefile created!\e[0m"  # Green success message
  else
      echo -e "\e[32mMakefile could not be created ):\e[0m"  # Red message
  fi
}
export -f create_makefile


function create_h_file() {
    if [ $# -eq 0 ]; then
        echo "Usage: chf <header_name>"
        return 1
    fi

    header_name="$1"
    header_file_name="${header_name//[^a-zA-Z0-9]/_}.h"  # Replace punctuations with underscores and add .h extension
    protection_key=$(echo "${header_name^^}_H" | sed 's/[^A-Z0-9]/_/g')  # Convert to uppercase and replace punctuations with underscores

  # Create the header file with the specified content
  echo "#ifndef ${protection_key}" > "$header_file_name"
  echo "#define ${protection_key}" >> "$header_file_name"
  echo >> "$header_file_name"
  echo "#include <assert.h>" >> "$header_file_name"
  echo "#include <err.h>" >> "$header_file_name"
  echo "#include <errno.h>" >> "$header_file_name"
  echo "#include <stddef.h>" >> "$header_file_name"
  echo "#include <stdio.h>" >> "$header_file_name"
  echo >> "$header_file_name"
  echo >> "$header_file_name"
  echo >> "$header_file_name"
  echo "#endif /* ! ${protection_key} */" >> "$header_file_name"

  if [ -e "$header_file_name" ]; then
      echo -e "\e[32mHeader file created successfully: $header_file_name\e[0m"  # Green success message
  else
      echo -e "\e[31mFailed to create header file :(\e[0m"  # Red error message
  fi
}
export -f create_h_file

function create_file() {
    if [ $# -eq 0 ]; then
        echo "Usage: create_file <file_name>"
        return 1
    fi

    echo \#include \"$1.h\" >> $1.c
}
export -f create_file

function piscine_push()
{
    foldername=$1
    comment=$2

    if [ $# -eq 0 ]; then
        echo "Usage: pp <folder_name> \"commit_message (opt. for first tag)\""
        return 1
    fi

    $(clang-format -i */*.[ch])

    if [ -z "$comment" ]; then
        last_tag=$(git tag -l "exercises-$foldername-*" | sort -V | tail -n 1)
        if [ -z "$last_tag" ]; then
            i=1
            comment="Added C script base"
        else
            i=$(echo "$last_tag" | awk -F- '{print $NF}' | awk '{$0=$0+1}1')
            echo -e "\033[0;33mYou need to provide a comment for the current push.\033[0m"
            exit 1
        fi
    fi

    git add "$foldername" > /dev/null 2>&1
    git commit -m "$foldername: $comment" > /dev/null 2>&1
    last_tag=$(git tag -l "exercises-$foldername-*" | sort -V | tail -n 1)

    if [ -z "$last_tag" ]; then
        i=1
    else
        i=$(echo "$last_tag" | awk -F- '{print $NF}' | awk '{$0=$0+1}1')
    fi

    git tag -ma "exercises-$foldername-$i" > /dev/null 2>&1
    git push --follow-tags > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo -e "\033[0;32mPushed tag 'exercises-$foldername-$i' successfully!\033[0m"
    else
        echo -e "\033[0;31mCouldn't push tag 'exercises-$foldername-$i' properly :(\033[0m"
    fi
}



#randEmoji=$(shuf -n 1 ~/Desk/emoji_cut/emoji_list | sed -n 's/.*\(.\)/\1/p')
#randColor=$(($RANDOM % 10))
#bracketBase="\[\e[1;3$(echo $randColor)m\][\[\e[1;37m\]\W\[\e[1;3$(echo $randColor)m\]]\[\e[0m\]"
#cursor="\e[6 q"

#export PS1="$randEmoji ➜ $bracketBase "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
