# vim: ft=zsh

# Search here using SpotLight
function mdhere()
{
	mdfind -onlyin . $*
}

# Search globally by name, using SpotLight
function mdloc()
{
	mdfind "kMDItemFSName == '$*'wc"
}

# Search globally by name and content, using SpotLight
function mdcontent()
{
	mdfind -interpret "$@";
}

# This function opens a search on google US
function google()
{
	python -c "import sys, webbrowser, urllib;   webbrowser.open('http://www.google.com/search?' + urllib.urlencode({'q': ' '.join(sys.argv[1:]) }))" $@
}
