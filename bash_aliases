#  Customize BASH PS1 prompt to show current GIT repository and branch.
#  by Mike Stewart - http://MediaDoneRight.com

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

# Reset
Color_Off="\[\033[0m\]" # Text Reset

# Regular Colors
Green="\[\033[38;2;106;135;89m\033[1m\]"
Yellow="\[\033[38;2;187;181;41m\033[1m\]"
Red="\[\033[0;91m\033[1m\]"
Blue="\[\033[38;2;104;151;187m\033[1m\]"
Purple="\[\033[38;2;152;118;170m\033[1m\]"

# Various variables you might want for your PS1 prompt instead
Time24h="\D{%T}"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better

export PS1=$Purple[$Time24h]$Color_Off' $(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Blue'git:{'$Green'"$(__git_ps1 "%s'$Blue'}"); \
  else \
    # @5 - Changes to working tree
    echo ""$(__git_ps1 "'$Blue'git:{'$Red'%s'$Blue'}"); \
  fi) '$Yellow$PathShort$Color_Off'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo "'$Yellow$PathShort$Color_Off'\$ "; \
fi)'
