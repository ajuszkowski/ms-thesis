This project contains the Aalto Beamer theme files. 

In addition you need to install the aaltologo package.

This material is from 2011, so it would be surprising if it worked
out of the box :-)

---

Jussi Pekonen (2011):

How to use the official Aalto University Beamer themes

The required Beamer theme files are attached. You also need the
aaltologo package (version ≥ 1.1.2) which you can download from
the Aalto-LaTeX Wiki
(https://wiki.aalto.fi/display/aaltolatex/).

You need to give the document preamble as

\documentclass[<class options>]{beamer} % Include the packages
you want to use

%% Required if you are writing in other language than English 
\usepackage[<language option>]{babel} %% Required if you are
writing in other language than English

% More packages...

% Now set the theme \usetheme[<theme options>]{Aalto}

%% Document contents \begin{document} %... \end{document}

See the example file for further information.

If you are preparing a presentation in other language than
English it is recommended that you use the babel package that
sets the correct hyphenation patterns and translates some
automatic texts.

There are several theme options available, and they are listed
below. If no options are given, the following options are
executed as the default options: 'default' and 'colors'.

Options for the overall theme: - default: as the name states, the
default theme - sidebar: a theme that has the table of contents
(of the current part) in the left sidebar - outline: an alias for
option 'sidebar' - invariant: the Aalto University logo remains
fixed throughout one part of the presentation

Options for the logo: - school={<SCHOOL NAME>}: adds the school
name to the Aalto University logo, see the documentation of the
aaltologo package for the available options -
institute={<INSTITUTE NAME>}: adds the institute name to the
Aalto University logo, see the documentation of the aaltologo
package for the available options

Theme specific options - default theme: - showpartcontents: shows
the table of contents of the newly started part automatically -
hidesubsections: hides the subsections from the table of contents
of the newly started part

Theme specific options - sidebar theme: - hideothersubsections:
hides the subsections of other sections from the sidebar table of
contents - hideallsubsections: hides all subsections from the
sidebar table of contents

Color themes: - colors: uses the colors of Aalto University, the
Aalto University logo has either a red, blue, or yellow mark -
blackandwhite: uses only black and white, the Aalto University
logo has a black mark - grayscale: uses the gray scale version of
the Aalto University gray, black and white, the Aalto University
logo has a black mark
