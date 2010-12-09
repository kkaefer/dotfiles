PS1="\u@\h:\w ▶ "

export PATH="~/bin:~/.gem/ruby/1.8/bin:/usr/local/sbin:/usr/local/bin:$PATH"

export DISPLAY=:0.0
export EDITOR='mate -w'
export LC_CTYPE=de_DE.UTF-8
export LC_MESSAGES=en_US.UTF-8

NVM_DIR=$HOME/.nvm
. $NVM_DIR/nvm.sh

alias start-servers='sudo apachectl start && sudo mysqlctl start'
alias stop-servers='sudo apachectl stop && sudo mysqlctl stop'
alias restart-servers='sudo apachectl restart && sudo mysqlctl restart'

export CVSROOT=:pserver:timcn@cvs.drupal.org:/cvs/drupal-contrib
alias cvs-revert='cvs -q update -dPCR'
alias cvs-update='cvs -q update -dPR'
alias cvs-diff='cvs -q diff -udRNF^\\s*function'
alias cvs-patch='patch -p0'

alias switch='svn switch $(svn info | grep "URL:" | sed "s/URL: //")'
alias svn-add-recursive="svn stat | grep "^?" | awk '{print $2}' | xargs svn add"
alias svn-clean="svn stat | grep "^?" | awk '{print $2}' | xargs rm -rf"
alias svnup='svn up'

alias po-stat='msgfmt --statistics $1'
alias po-update='for i in *.po; do msgmerge --update $i ../drupal-pot/${i}t --no-wrap ; done'
alias po-status='for i in *.po; do echo -n "$i: " ; msgfmt --statistics $i ; done'
alias po-single='msgcat --use-first general.po [^g]*.po | msgattrib --no-fuzzy -o'
alias po-clean='for i in *.po; do msgattrib -o $i.no-o  --no-wrap --no-obsolete $i && mv $i.no-o $i; done'

alias phplint='for i in `find . -name "*.inc" -o -name "*.module" -o -name "*.php"` ; do php -l $i ; done'
alias gr='egrep -l -r --exclude="*.svn*" --exclude="*.patch" --exclude=".#*"'
alias gre='egrep -n -r --colour --exclude="*.svn*" --exclude="*.patch" --exclude=".#*"'
alias header='wget -S --spider'
alias top='top -ocpu -R -F -s 2 -n30'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias finder='open -a /System/Library/CoreServices/Finder.app .'
alias flushdns='dscacheutil -flushcache'
alias release-notes='php ~/Repositories/HEAD/tricks/cvs-release-notes/cvs-release-notes.php'
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias optipng-recurse='for i in `find . -name "*.png"` ; do optipng -o7 $i ; done'
alias jpegtran-recurse='for i in `find . -name "*.jpg" -o -name "*.jpeg"` ; do jpegtran -copy none -optimize $i > $i ; done'
alias stuck="ps ax | sed '1p;/ [U] /!d'"
alias cpwd="pwd | pbcopy"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias s='pmset sleepnow'
alias nr='rlwrap node-repl'
alias untar='ruby -e '"'"'exec "tar", "vx#{$*[0] =~ /gz$/?"z":"j"}f", $*[0]'"'"' -- '


complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

source ~/git-completion.bash
