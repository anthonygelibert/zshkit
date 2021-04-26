# vim: ft=zsh

function fix-pandoc() {
    sudo mkdir -p "/opt/local/var/macports/build/_opt_local_var_macports_sources_github.com_macports_macports-ports_textproc_pandoc-citeproc/pandoc-citeproc/work/jgm-pandoc-citeproc-82833c1/.stack-work/install/x86_64-osx/e96e24e3452fcac4ef648094a8928ce7834ffaf873081ec5011df4bccc7bd890/8.6.5/share/x86_64-osx-ghc-8.6.5/pandoc-citeproc-0.17.0.2"
    cd "/opt/local/var/macports/build/_opt_local_var_macports_sources_github.com_macports_macports-ports_textproc_pandoc-citeproc/pandoc-citeproc/work/jgm-pandoc-citeproc-82833c1/.stack-work/install/x86_64-osx/e96e24e3452fcac4ef648094a8928ce7834ffaf873081ec5011df4bccc7bd890/8.6.5/share/x86_64-osx-ghc-8.6.5/pandoc-citeproc-0.17.0.2/"
    sudo wget "https://raw.githubusercontent.com/citation-style-language/styles/master/chicago-author-date.csl"
    sudo wget https://raw.githubusercontent.com/citation-style-language/styles/master/ieee-with-url.csl
    sudo mkdir "locales"
    cd locales
    sudo wget https://raw.githubusercontent.com/jgm/pandoc-citeproc/master/locales/locales-fr-FR.xml
    sudo wget https://raw.githubusercontent.com/jgm/pandoc-citeproc/master/locales/locales-en-US.xml
}
