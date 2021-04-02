export ZSH="/home/debian/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source "$ZSH/oh-my-zsh.sh"
PROMPT="%%{$fg[yellow]%%}[%%m@%%n]%%{$reset_color%%} %%(?:%%{%%}➜ :%%{%%}➜ ) %%{$fg[cyan]%%}%%c%%{$reset_color%%} $(git_prompt_info)"
