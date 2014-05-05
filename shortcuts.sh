###############################################################################
# Convenient aliases for quikcly editing and reloading the .bashrc file
###############################################################################
alias rebash='. ~/.bashrc'
alias editbash='vim ~/.bashrc'

# Wrap make so it alerts me with a sound when they are done
make()
{
/usr/bin/make "$@"
if [ $? -eq 0 ]; then
  aplay $HOME/aleeper-config/sounds/scifi002-trim.wav;
  return 0;
else
  aplay $HOME/aleeper-config/sounds/banana-peel.wav;
  return 1;
fi
}


function serve() {  python -m SimpleHTTPServer $1 ; }

gkl() { (gitk --all "$@" &); }
configure_tex_inputs() { export TEXINPUTS=/home/aleeper/Documents/teaching/dynamics/a_common: ; }

backup() { cp $1 $1.bak; }
alias gitinfo='. /home/$USER/.git_info.sh'

###############################################################################
# Directory navigation
###############################################################################
alias kk='cd -'
alias up='cd ..'
alias upp='cd ../..'
alias uppp='cd ../../..'
alias upppp='cd ../../../..'
alias uppppp='cd ../../../../..'

alias lsdir='for i in $(ls -d */); do echo ${i%%/}; done'
# Alternative: ls -d */ | cut -f1 -d'/'

pfp() { for i in "$@"; do readlink -e "`pwd`/$i"; done }

###############################################################################
# Add things to PATH
###############################################################################
export PATH=$HOME/aleeper-config/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH

###############################################################################
# Modify command prompt formatting
###############################################################################
#export MYPS='$(echo -n "${PWD/#$HOME/~}" | awk -F "/" '"'"'{if (length($0) > 14) { if (NF>4) print $1 "/" $2 "/.../" $(NF-1) "/" $NF; else if (NF>3) print $1 "/" $2 "/.../" $NF; else print $1 "/.../" $NF; } else print $0;}'"'"')'
#PS1='$(eval "echo ${MYPS}")$ '
#PROMPT_DIRTRIM=2
PS1="\u@\h:\w\n$"

### Don't remember if I need this.
#ssh-agent sh -c 'ssh-add < /dev/null && bash'

### Don't really remember how this works.
# auto-complete for ssh hosts
#complete -o default -o nospace -W “$(awk ‘/^Host / {print $2}’ < $HOME/.ssh/config) scp sftp SSH
