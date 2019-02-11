# vim: ft=zsh

###################
### ZSH OPTIONS
### Info : http://zsh.sourceforge.net/Doc/Release/Options.html

setopt   ALIASES                # Expand aliases.
unsetopt ALL_EXPORT             # NO -> All parameters subsequently defined are automatically exported.
unsetopt ALWAYS_TO_END          # NO -> If a completion with the cursor in the word was started and it results in only one match, the cursor is placed at the end of the word.
setopt   APPEND_HISTORY         # If this is set, zsh sessions will append their history list to the history file, rather than overwrite it.
setopt   AUTO_CD                # If a command is issued that can't be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory.
setopt   AUTO_CONTINUE          # With this option set, stopped jobs that are removed from the job table with the disown builtin command are automatically sent a CONT signal to make them running.
setopt   AUTO_LIST              # Automatically list choices on an ambiguous completion.
setopt   AUTO_MENU              # Automatically use menu completion after the second consecutive request for completion, for example by pressing the tab key repeatedly. This option is overridden by MENU_COMPLETE.
setopt   AUTO_NAME_DIRS         # Any parameter that is set to the absolute name of a directory immediately becomes a name for that directory in the usual form ~param.
setopt   AUTO_PARAM_KEYS        # If a parameter name was completed and the next character typed is one of those that have to come directly after the name (like }, :, etc.), they are placed there automatically.
setopt   AUTO_PARAM_SLASH       # If a parameter is completed whose content is the name of a directory, then add a trailing slash instead of a space.
setopt   AUTO_PUSHD             # Make cd push the old directory onto the directory stack.
setopt   AUTO_REMOVE_SLASH      # When the last character resulting from a completion is a slash and the next character typed is a word delimiter, a slash, or a character that ends a command (such as a semicolon or an ampersand), remove the slash.
setopt   BAD_PATTERN            # If a pattern for filename generation is badly formed, print an error. If this option is unset, the pattern will be left unchanged.
setopt   BANG_HIST              # Perform textual history expansion, csh-style, treating the character `!' specially.
unsetopt BASH_AUTO_LIST         # NO -> On an ambiguous completion, automatically list choices when the completion function is called twice in succession.
unsetopt BEEP                   # NO -> Beep on error in ZLE.
setopt   BG_NICE                # Run all background jobs at a lower priority.
setopt   BRACE_CCL              # Expand expressions in braces which would not otherwise undergo brace expansion to a lexically ordered list of all the characters.
setopt   C_BASES                # Output hexadecimal numbers in the standard C format, for example '0xFF' instead of the usual '16#FF'.
unsetopt CASE_GLOB              # NO -> Make globbing (filename generation) sensitive to case.
unsetopt CASE_MATCH             # NO -> Make regular expressions using the zsh/regex module (including matches with =~) sensitive to case.
setopt   CDABLE_VARS            # If the argument to a cd command (or an implied cd with the AUTO_CD option set) is not a directory, and does not begin with a slash, try to expand the expression as if it were preceded by a '~'
setopt   CHASE_DOTS             # When changing to a directory containing a path segment '..' which would otherwise be treated as canceling the previous segment in the path (in other words, 'foo/..' would be removed from the path, or if '..' is the first part of the path, the last part of $PWD would be deleted), instead resolve the path to the physical directory.
unsetopt CHASE_LINKS            # NO -> Resolve symbolic links to their true values when changing directory.
setopt   CHECK_JOBS             # Report the status of background and suspended jobs before exiting a shell with job control; a second attempt to exit the shell will succeed. NO_CHECK_JOBS is best used only in combination with NO_HUP, else such jobs will be killed automatically.
setopt   CHECK_RUNNING_JOBS     # Check for both running and suspended jobs when CHECK_JOBS is enabled.
setopt   CLOBBER                # Allows `>' redirection to truncate existing files, and `>>' to create files. Otherwise `>!' or `>|' must be used to truncate a file, and `>>!' or `>>|' to create a file.
setopt   COMBINING_CHARS        # Assume that the terminal displays combining characters correctly.  The shell cannot determine this by itself, hence the option.  This is highly recommended for MacOS X where file names are stored with accented characters split into basic and combining characters.
unsetopt COMPLETE_ALIASES       # NO -> Prevents aliases on the command line from being internally substituted before completion is attempted.
unsetopt COMPLETE_IN_WORD       # If unset, the cursor is moved to the end of the word if completion is started. Otherwise it stays where it is and completion is done from both ends.
setopt   CORRECT                # Try to correct the spelling of commands.
unsetopt CORRECT_ALL            # NO -> Try to correct the spelling of all arguments in a line.
setopt   CSH_JUNKIE_HISTORY     # A history reference without an event specifier will always refer to the previous command.
setopt   CSH_JUNKIE_LOOPS       # Allow loop bodies to take the form `list; end' instead of `do list; done'.
unsetopt CSH_JUNKIE_QUOTES      # NO -> Complain if a quoted expression runs off the end of a line; prevent quoted expressions from containing un-escaped newlines.
unsetopt CSH_NULL_GLOB          # NO -> If a pattern for filename generation has no matches, delete the pattern from the argument list; do not report an error unless all the patterns in a command have no matches. Overrides NULL_GLOB.
setopt   EQUALS                 # Perform = filename expansion. (See the section 'Filename Expansion'.)
setopt   EXTENDED_GLOB          # Treat the `#', `~' and `^' characters as part of patterns for filename generation, etc.
setopt   EXTENDED_HISTORY       # Save each command's beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file.
unsetopt FLOW_CONTROL           # NO -> If this option is unset, output flow control via start/stop characters (usually assigned to ^S/^Q) is disabled in the shell's editor.
setopt   FUNCTION_ARGZERO       # When executing a shell function or sourcing a script, set $0 temporarily to the name of the function/script.
setopt   GLOB                   # Perform filename generation
unsetopt GLOB_ASSIGN            # NO -> If this option is set, filename generation (globbing) is performed on the right hand side of scalar parameter assignments of the form name=pattern (e.g. `param=*'). If the result has more than one word the parameter will become an array with those words as arguments. This option is provided for backwards compatibility only: globbing is always performed on the right hand side of array assignments of the form `name=( value )' (e.g. `param=(*)') and this form is recommended for clarity; with this option set, it is not possible to predict whether the result will be an array or a scalar.
unsetopt GLOB_COMPLETE          # NO -> When the current word has a glob pattern, do not insert all the words resulting from the expansion but generate matches as for completion and cycle through them like MENU_COMPLETE.
unsetopt GLOB_DOTS              # NO -> Do not require a leading `.' in a filename to be matched explicitly.
unsetopt GLOB_SUBST             # NO -> Treat any characters resulting from parameter substitution as being eligible for file expansion and filename generation, and any characters resulting from command substitution as being eligible for filename generation.
setopt   HIST_ALLOW_CLOBBER     # Add | to output redirections in the history. This allows history references to clobber files even when CLOBBER is unset.
setopt   HASH_CMDS              # Note the location of each command the first time it is executed
setopt   HASH_DIRS              # Whenever a command name is hashed, hash the directory containing it, as well as all directories that occur earlier in the path.
setopt   HASH_LIST_ALL          # Whenever a command completion is attempted, make sure the entire command path is hashed first. This makes the first completion slower.
setopt   HIST_ALLOW_CLOBBER     # Add '|' to output redirections in the history.
unsetopt HIST_BEEP              # NO -> Beep when an attempt is made to access a history entry which isn't there.
setopt   HIST_EXPIRE_DUPS_FIRST # If the internal history needs to be trimmed to add the current command line, setting this option will cause the oldest history event that has a duplicate to be lost before losing a unique event from the list.
setopt   HIST_FCNTL_LOCK        # When writing out the history file, by default zsh uses ad-hoc file locking to avoid known problems with locking on some operating systems.
setopt   HIST_FIND_NO_DUPS      # When searching for history entries in the line editor, do not display duplicates of a line previously found, even if the duplicates are not contiguous.
unsetopt HIST_IGNORE_ALL_DUPS   # NO -> If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event).
unsetopt HIST_IGNORE_DUPS       # NO -> Do not enter command lines into the history list if they are duplicates of the previous event.
setopt   HIST_IGNORE_SPACE      # Remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases contains a leading space.
setopt   HIST_LEX_WORDS         # When this option is set, words read in from a history file are divided up in a similar fashion to normal shell command line handling.
unsetopt HIST_NO_FUNCTIONS      # NO -> Remove function definitions from the history list.
unsetopt HIST_NO_STORE          # NO -> Remove the history (fc -l) command from the history list when invoked.
setopt   HIST_REDUCE_BLANKS     # Remove superfluous blanks from each command line being added to the history list.
unsetopt HIST_SAVE_NO_DUPS      # NO -> When writing out the history file, older commands that duplicate newer ones are omitted.
setopt   HIST_VERIFY            # Whenever the user enters a line with history expansion, don't execute the line directly; instead, perform history expansion and reload the line into the editing buffer.
unsetopt HUP                    # NO -> Send the HUP signal to running jobs when the shell exits.
unsetopt IGNORE_BRACES          # NO -> Do not perform brace expansion.
setopt   IGNORE_EOF             # Do not exit on end-of-file. Require the use of exit or logout instead.
unsetopt INC_APPEND_HISTORY     # NO -> This options works like APPEND_HISTORY except that new history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits.
setopt   INTERACTIVE_COMMENTS   # Allow comments even in interactive shells.
setopt   LIST_AMBIGUOUS         # This option works when AUTO_LIST or BASH_AUTO_LIST is also set.
unsetopt LIST_BEEP              # NO -> Beep on an ambiguous completion.
unsetopt LIST_PACKED            # NO -> Try to make the completion list smaller (occupying less lines) by printing the matches in columns with different widths.
unsetopt LIST_ROWS_FIRST        # NO -> Lay out the matches in completion lists sorted horizontally, that is, the second match is to the right of the first one, not under it as usual.
setopt   LIST_TYPES             # When listing files that are possible completions, show the type of each file with a trailing identifying mark.
setopt   LONG_LIST_JOBS         # List jobs in the long format by default.
setopt   MAGIC_EQUAL_SUBST      # All unquoted arguments of the form identifier=expression appearing after the command name have file expansion (that is, where expression has a leading `~' or `=') performed on expression as if it were a parameter assignment. The argument is not otherwise treated specially: in other words, it is subsequently treated as a single word, not as an assignment.
unsetopt MAIL_WARNING           # NO -> Print a warning message if a mail file has been accessed since the shell last checked.
setopt   MARK_DIRS              # Append a trailing / to all directory names resulting from filename generation (globbing).
setopt   MENU_COMPLETE          # On an ambiguous completion, instead of listing possibilities or beeping, insert the first match immediately.
setopt   MONITOR                # Allow job control.
setopt   MULTIOS                # Perform implicit tees or cats when multiple redirections are attempted
unsetopt MULTI_FUNC_DEF         # NO -> Allow definitions of multiple functions at once in the form ‘fn1 fn2...()’; if the option is not set, this causes a parse error.
setopt   NOMATCH                # If a pattern for filename generation has no matches, print an error, instead of leaving it unchanged in the argument list. This also applies to file expansion of an initial ~ or =.
setopt   NO_HUP                 #
setopt   NOTIFY                 # Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
unsetopt NULL_GLOB              # NO -> If a pattern for filename generation has no matches, delete the pattern from the argument list instead of reporting an error.
setopt   NUMERIC_GLOB_SORT      # If numeric filenames are matched by a filename generation pattern, sort the filenames numerically rather than lexicographically.
unsetopt OCTAL_ZEROES           # NO -> Interpret any integer constant beginning with a 0 as octal, per IEEE Std 1003.2-1992 (ISO 9945-2:1993). This is not enabled by default as it causes problems with parsing of, for example, date and time strings with leading zeroes.
setopt   PATH_DIRS              # Perform a path search even on command names with slashes in them. Thus if `/usr/local/bin' is in the user's path, and he types `X11/xinit', the command `/usr/local/bin/X11/xinit' will be executed (assuming it exists). This applies to the . builtin as well as to command execution. Commands explicitly beginning with `./' or `../' are not subject to path search.
setopt   POSIX_BUILTINS         # When this option is set the command builtin can be used to execute shell builtin commands. Parameter assignments specified before shell functions and special builtins are kept after the command completes unless the special builtin is prefixed with the command builtin. Special builtins are ., :, break, continue, declare, eval, exit, export, integer, local, readonly, return, set, shift, source, times, trap and unset.
setopt   POSIX_CD               # Modifies the behaviour of cd, chdir and pushd commands to make them more compatible with the POSIX standard.
setopt   POSIX_JOBS             # This option makes job control more compliant with the POSIX standard.
unsetopt PROMPT_SUBST           # NO -> If set, parameter expansion, command substitution and arithmetic expansion are performed in prompts.
unsetopt PRINT_EXIT_VALUE       # NO -> Print the exit value of programs with non-zero exit status.
setopt   PUSHD_IGNORE_DUPS      # Don't push multiple copies of the same directory onto the directory stack.
setopt   PUSHD_MINUS            # Exchanges the meanings of `+' and `-' when used with a number to specify a directory in the stack.
setopt   PUSHD_SILENT           # Do not print the directory stack after pushd or popd.
setopt   PUSHD_TO_HOME          # Have pushd with no arguments act like `pushd $HOME'.
setopt   RC_EXPAND_PARAM        # Array expansions of the form foo${xx}bar, where the parameter xx is set to (a b c), are substituted with fooabar foobbar foocbar instead of the default fooa b cbar.
unsetopt RC_QUOTES              # NO -> Allow the character sequence '' to signify a single quote within singly quoted strings.
setopt   RM_STAR_SILENT         # Do not query the user before executing `rm *' or `rm path/*'.
setopt   SHARE_HISTORY          # This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file (the latter is like specifying INC_APPEND_HISTORY).
unsetopt SH_FILE_EXPANSION      # NO -> Perform filename expansion (e.g., ~ expansion) before parameter expansion, command substitution, arithmetic expansion and brace expansion. If this option is unset, it is performed after brace expansion, so things like ~$USERNAME and ~{pfalstad,rc} will work.
setopt   SHORT_LOOPS            # Allow the short forms of for, select, if, and function constructs.
unsetopt SINGLE_LINE_ZLE        # NO -> Use single-line command line editing instead of multi-line.
unsetopt SUN_KEYBOARD_HACK      # NO -> If a line ends with a back-quote, and there are an odd number of back-quotes on the line, ignore the trailing back-quote. This is useful on some keyboards where the return key is too small, and the back-quote key lies annoyingly close to it.
unsetopt TRANSIENT_RPROMPT      # NO -> Right prompt goes away after edit.
setopt   UNSET                  # Treat unset parameters as if they were empty when substituting. Otherwise they are treated as an error.
unsetopt VERBOSE                # NO -> Print shell input lines as they are read.
unsetopt WARN_CREATE_GLOBAL     # NO -> Print a warning message when a global parameter is created in a function by an assignment.
unsetopt XTRACE                 # NO -> Display all the actions of the shell
