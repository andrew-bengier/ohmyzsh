# Enhanced Profile

# ------------------------------------- #
# - Functions -                         #
# ------------------------------------- #
check() {
  if [ -z "$1" ]; then
    seciton='-'
  else
    section=$*
  fi

  python $HOME/.oh-my-zsh/custom/enhanced/check_sections.py ${section}
}

nato() {
  python $HOME/.oh-my-zsh/custom/enhanced/nato_alpha.py $1
}

check_git() {
    python $HOME/.oh-my-zsh/custom/enhanced/check_git_defaults.py
}

gcam_story() {
  git commit -a -m "${STORY_NUM}$1"
}

change_story() {
 python $HOME/.oh-my-zsh/custom/enhanced/change_story_num.py $1;
 sze
}

project_notes() {
 mkdir -p $NOTES/project/$1
}

project_section() {
 mkdir -p $NOTES/project/$1/$2
}

project_doc() {
 touch $NOTES/project/$1/$2/$(3 +".md")
 code -n $NOTES/project/$1
}

jdk() {
  version=$1
  case "$version" in
    "8") jenv global 1.8
    ;;
    "11") jenv global 11
    ;;
    "15") jenv global 15
  esac

  java -version
}

hostInfo() {
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Current network location :$NC " ; scselect
  echo -e "\n${RED}Public facing IP Address :$NC " ;myip
}

myuptime () {
  uptime | awk '{ print "Uptime:", $3, $4, $5 }' | sed 's/,//g'
  return;
}

theme() {
 python $HOME/.oh-my-zsh/custom/enhanced/change_theme.py $1
 szsh
}

# ------------------------------------- #
# - Zsh Alias -                         #
# ------------------------------------- #
alias zshTips='open -a "Google Chrome" https://devhints.io/zsh'  # zshTips: opens Google Chrome with ZSH tips site

alias szsh='source $HOME/.zshrc'                                 # szsh:    source zshrc

alias sze='source $HOME/.oh-my-zsh/custom/enhanced_profile.zsh'  # sze:     source zsh enhanced profile
alias eze='code -n $HOME/.oh-my-zsh/custom/enhanced_profile.zsh' # eze:     edits zsh enhanced profile

alias quit='exit'                                                # quit:    works like exit ( closes terminal session )

alias ll='ls -lahF'                                              # ll:      ls replacement ( includes l,a,h and F flags )
alias rm='rm -i'                                                 # rm:      overrides rm ( include i flag )
alias cp='cp -i'                                                 # rm:      overrides cp ( include i flag )
alias mv='mv -i'                                                 # rm:      overrides mv ( include i flag )

alias cls='clear'                                                # cls:     windows compatible clear 

alias finder='open -a Finder ./'                                 # finder:  opens a file directory in Finder
alias edit='code'                                                # edit:    opens a file or directory using VSCode
alias code='code $PWD'                                           # code:    opens current direcoty using VSCode

# ------------------------------------- #
# - Git -                               #
# ------------------------------------- #
export STORY_NUM='[MASTER] - '

alias gitTips='open -a "Google Chrome" https://git-scm.com/docs' # gitTips: opens chrome page with git references

alias story='echo Current JIRA story for git: $STORY_NUM'        # story:   prints current story
alias cstory='change_story'                                      # cstory:  change git story number ( for JIRA tagging )
alias gcam='gcam_story'                                          # gcam:    overrides current gcam with appended story number

alias gro="git config --get remote.origin.url"                   # gro:     checks origin url
alias gpo="git push origin"                                      # gpo:     pushes to origin remotely

# ------------------------------------- #
# - Notes -                             #
# ------------------------------------- #
export NOTES=$HOME/Documents/Notes
export logs=$NOTES/daily-notes

alias markdownTips='open -a "Google Chrome" https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet'                            # markdownTips:    opens tips on markdown 

alias log='mkdir -p $logs/$(date +"%Y/%m") && touch $logs/$(date +"%Y/%m/%Y-%m-%d.md")'                                                  # log:             creates a log entry for today ( markdown ) 
alias log-o='mkdir -p $logs/$(date +"%Y/%m") && touch $logs/$(date +"%Y/%m/%Y-%m-%d.md") && code -n $logs'                               # log-o:           creates a log entry for today and opens in editor ( markdown )

alias yesterday='mkdir -p $logs/$(date -d yesterday +"%Y/%m") && touch $logs/$(date -d yesterday +"%Y/%m/%Y-%m-%d.md") && code -n $logs' # yesterday:       creates log entry for yesterday ( same as current log )

alias lsnotes='ll $NOTES'                                                                                                                # lsnotes:         lists all notes folders
alias lsprojects='ll $NOTES/projects'                                                                                                    # lsprojects:      lists all project notes folders

alias project-notes='project_notes'                                                                                                      # project-notes:   creates new folder for project notes 
alias project-section='project_section'                                                                                                  # project-section: creates new folder in provided project ( ex. features, issues )
alias project-doc='project_doc'                                                                                                          # project-doc:     creates log ( markdown ) file for specific doc in project section

# ------------------------------------- #
# - JDK -                               #
# ------------------------------------- #
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# ------------------------------------- #
# - IntelliJ Tips -                     #
# ------------------------------------- #
alias ideTips='open -a "Google Chrome" https://www.jetbrains.com/help/idea/debugging-code.html'              # ideTips: opens chrome with JetBrains page with debugging tips
alias ideKeys='open -a "Google Chrome" https://www.jetbrains.com/help/rider/Reference_Keymap_Rider_OSX.html' # ideTips: opens chrome with JetBrains page with key bindings

# ------------------------------------- #
# - Music -                             #
# ------------------------------------- #
alias playYT='open -a "Google Chrome" https://www.youtube.com/'      #playYT:      opens chrome with YouTube
alias playYTM='open -a "Google Chrome" https://music.youtube.com/'   #playYTM:     opens chrome with YouTube Music
alias playPandora='open -a "Google Chrome" https://www.pandora.com/' #playPandora: opens chrome with Pandora
alias playSpot='open -a "Google Chrome" https://open.spotify.com/'   #playSpot:    opens chrome with Spotify
alias playALB='open -a "Google Chrome" http://www.alexlbates.com/'   #playALB:     opens chrome with alex ( alb ) play site

echo "Sourced enhanced profile!"