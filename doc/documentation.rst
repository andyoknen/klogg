Klogg documentation
===================

Getting started
###############

*klogg* can be started from the command line, optionally passing the file to
open as an argument, or via the desktop environment's menu or file
association.
If no file name is passed, *klogg* will initially open the last used file.

The main window is divided in three parts : the top displays the log file. The
bottom part, called the "filtered view", shows the results of the search. The
line separating the two contains the regular expression used as a filter.

Entering a new regular expression, or a simple search term, will update the
bottom view, displaying the results of the search. The lines matching the
search criteria are listed in order in the results, and are marked with a red
circle in both windows.

Exploring log files
###################

Regular expressions are a powerful way to extract the information you are
interested in from the log file. *klogg* uses *extended regular expressions*.

One of the most useful regexp feature when exploring logs is the
*alternation*, using parentheses and the | operator. It searches for several
alternatives, permitting to display several line types in the filtered window,
in the same order they appear in the log file.

For example, to check that every connection opened is also closed, one can use
an expression similar to:

``Entering (Open|Close)Connection``

Any 'open' call without a matching 'close' will immediately be obvious in the
filtered window.
The alternation also works with the whole search line. For example if you also
want to know what kind of connection has been opened:

``Entering (Open|Close)Connection|Created a .* connection``

``.*`` will match any sequence of character on a single line, but *klogg* will only
display lines with a space and the word ``connection`` somewhere after ``Created a``

In addition to the filtered window, the match overview on the right hand side
of the screen offers a view of the position of matches in the log file. Matches
are showed as small red lines.

Using filters
*************

*Filters* can colorize some lines of the log being displayed, for example to
draw attention to lines indicating an error, or to associate a color with each
sort of event. Any number of filters can be defined in the 'filters'
configuration dialog, each using a regexp against which lines will be matched.
For each line, all filters are tried in order and the fore and back colors of
the first successful filter are applied.

Marking lines in the log file
*****************************

In addition to regexp matches, *klogg* enables the user to mark any interesting
line in the log. To do this, click on the round bullet in the left margin in
front of the line that needs to be marked or select the line and press ``'m'`` hotkey.

Marks are combined with matches and showed in the filtered window. They also
appears as blue lines in the match overview.

Browsing changing log files
***************************

*klogg* can display and search through logs while they are written to disk, as
it might be the case when debugging a running program or server.
The log is automatically updated when it grows, but the 'Auto-refresh' option
must be enabled if you want the search results to be automatically refreshed as
well.

The ``'f'`` key might be used to follow the end of the file as it grows (a la
``tail -f``).

Settings
########

Font
****

The font used to display the log file. A clear, monospace font (like the free,
open source, `DejaVu Mono <http://www.dejavu-fonts.org>`_ for example) is
recommended.

Search options
**************

Determines which type of regular expression *klogg* will use when filtering
lines for the bottom window, and when using QuickFind.

* Extended Regexp. The default, uses regular expressions similar to those used by Perl
* Wildcards. Uses wildcards (* and ?) in a similar fashion as a Unix shell
* Fixed Strings. Searches for the text exactly as it is written, no character is special

If incremental quickfind is selected *klogg* will automatically restart quickfind search
when search pattern changes

Session options
***************

If load last session is selected *klogg* will reopen files that were opened when *klogg* 
was closed.

Advanced options
****************

These options allow to customize performance related settings.

If parallel search is enabled *klogg* will try to use several cpu cores for
regular expression matching. This does not work with quickfind.

If search results cache is enabled *klogg* will store numbers of lines that matched
search pattern in memory. Repeating search for the same pattern will not go through all
file but use cached line numbers instead.

When using *klogg* to monitor updating files this option should be disabled.

Keyboard commands
#################

*klogg* keyboard commands try to approximatively emulate the default bindings
used by the classic Unix utilities *vi* and *less*.

The main commands are:

============  =======================================================================================
Keys          Actions
============  =======================================================================================
arrows        scroll one line up/down or one column left/right
[number] j/k  move the selection 'number' (or one) line down/up
h/l           scroll left/right
^ or $        scroll to beginning or end of selected line
[number] g    jump to the line number given or the first one if no number is entered
G             jump to the last line of the file (selecting it)
' or "        start a quickfind search in the current screen (forward and backward)
n or N        repeat the previous quickfind search forward/backward
\* or .        search for the next occurence of the currently selected text
/ or ,        search for the previous occurence of the currently selected text
f             activate 'follow' mode, which keep the display as the tail of the file (like "tail -f")
m             put a mark on current selected line
[ or ]        jump to previous or next marked line
\+ or -       decrease/increase filtered view size
v             switch filtered view visibilty mode (Marks and Matches -> Marks -> Matches)
============  =======================================================================================



