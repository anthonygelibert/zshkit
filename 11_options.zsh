# Navigation
setopt AUTO_CD                            # Un chemin saisi seul suffit pour s’y déplacer.
setopt AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT  # cd alimente une pile utile, sans doublons ni affichage parasite.
setopt PUSHD_TO_HOME                      # pushd sans argument reste un raccourci pratique vers le dossier personnel.
setopt CD_SILENT                          # Le prompt affiche déjà le chemin : cd n’a pas besoin de le répéter.
unsetopt AUTO_NAME_DIRS CDABLE_VARS       # Les variables de chemin ne deviennent ni des ~noms ni des destinations implicites.
unsetopt CHASE_DOTS CHASE_LINKS           # $PWD et .. suivent le chemin logique affiché, même à travers un lien symbolique.
unsetopt POSIX_CD                         # On conserve la pile native de Zsh, notamment cd +n et cd -n.

# Complétion
setopt AUTO_LIST AUTO_MENU                 # Tab montre les choix ambigus puis permet de les parcourir.
unsetopt MENU_COMPLETE COMPLETE_IN_WORD    # Le premier Tab complète le préfixe commun depuis la fin du mot.
unsetopt COMPLETE_ALIASES                  # La complétion voit la commande cachée derrière un alias, notamment MacPorts.
unsetopt CORRECT CORRECT_ALL               # La complétion approximative suffit ; Entrée ne réécrit ni commande ni argument.
setopt HASH_LIST_ALL                       # La complétion doit recenser les commandes disponibles dans le PATH.
unsetopt HASH_DIRS                         # Exécuter une commande ne nécessite pas d’indexer tout son répertoire.

# Historique partagé entre les terminaux
setopt SHARE_HISTORY                       # Chaque terminal publie et reçoit immédiatement les commandes des autres terminaux.
setopt HIST_FCNTL_LOCK                     # Le verrouillage système protège les écritures concurrentes dans le fichier partagé.
setopt HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_SAVE_NO_DUPS  # Les doublons disparaissent à l’ajout, à la recherche et à l’écriture.
setopt HIST_IGNORE_SPACE HIST_REDUCE_BLANKS  # Un espace initial exclut une commande ; les blancs superflus sont normalisés.
unsetopt APPEND_HISTORY INC_APPEND_HISTORY # SHARE_HISTORY reste l’unique stratégie de persistance entre les sessions.
unsetopt HIST_LEX_WORDS                    # Le gros fichier d’historique n’est pas intégralement réanalysé comme du code Zsh.
unsetopt BANG_HIST                         # Le caractère ! reste littéral dans les commandes, motifs et arguments.

# Motifs et développement de fichiers
setopt EXTENDED_GLOB BARE_GLOB_QUAL        # Les opérateurs avancés et les filtres comme *(.) restent disponibles.
setopt BAD_PATTERN CASE_GLOB CASE_MATCH    # Les motifs invalides échouent et les correspondances respectent la casse.
setopt NUMERIC_GLOB_SORT                   # fichier2 est classé avant fichier10 dans les résultats d’un motif.
unsetopt GLOB_STAR_SHORT GLOB_DOTS GLOB_SUBST  # La récursion reste **/*, * ignore les cachés et les variables ne sont pas reglobbées.
unsetopt NULL_GLOB NOMATCH                 # Un motif sans résultat reste littéral au lieu de disparaître ou de bloquer la commande.

# Processus, jobs et redirections
setopt PIPE_FAIL                           # Une erreur dans n’importe quel maillon rend tout le pipeline fautif.
setopt CHECK_JOBS CHECK_RUNNING_JOBS NO_HUP  # La fermeture avertit pour tout job sans le tuer automatiquement.
setopt LONG_LIST_JOBS NOTIFY               # Les jobs sont détaillés et leur fin est annoncée dès qu’elle survient.
unsetopt POSIX_JOBS                        # La gestion des jobs reste celle de Zsh et ne change pas dans les sous-shells.
unsetopt RM_STAR_SILENT                    # rm * doit demander une confirmation au lieu de considérer ce cas comme ordinaire.
setopt RM_STAR_WAIT                        # Dix secondes empêchent de valider cette confirmation par réflexe.

# Confort interactif et affichage
setopt COMBINING_CHARS INTERACTIVE_COMMENTS IGNORE_EOF  # Accents macOS, commentaires interactifs et protection contre Ctrl-D.
unsetopt FLOW_CONTROL BEEP                 # Ctrl-S sert à la recherche historique et aucune erreur ne déclenche de bip.
setopt PROMPT_PERCENT PROMPT_CR PROMPT_SP  # Le prompt interprète ses codes et préserve les sorties sans fin de ligne.
unsetopt PROMPT_SUBST TRANSIENT_RPROMPT    # Le prompt n’exécute rien et l’ancien état Git reste visible à droite.

# Sémantique native de Zsh
unsetopt POSIX_BUILTINS PATH_DIRS          # Ni fuite d’affectation avant un builtin, ni recherche cachée des chemins avec /.
setopt C_BASES MAGIC_EQUAL_SUBST           # Hexadécimal familier en 0xFF et développement de ~ dans les arguments nom=chemin.
