# run mc with xoria256 colorscheme
function mc
	mc -S xoria256
end

# run git installed from homebrew, not the Apple one
function git
	/usr/local/git/bin/git $argv
end

#Adding gitignore file right after git init
function gitinit
	cp ~/Develop/bitbucket/templates/.gitignore .
	git init
	git add .gitignore
end
# open files in SublimeText 2 <- still needs improvements
# Most annoying - it _always_ opens file in new window. duh
function sublime
	/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl $argv
end
