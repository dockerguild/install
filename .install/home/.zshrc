export ZSH="/home/debian/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source "$ZSH/oh-my-zsh.sh"
PROMPT="%F{yellow}[%n@%M]%F{reset} %(?:%{%}➜ :%{%}➜ ) %F{cyan}%c%F{reset} $(git_prompt_info)"
