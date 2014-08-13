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
