\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{flypset}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{flyparticle}}
\ProcessOptions\relax
\LoadClass{flyparticle}

\makeatletter


%%% useful mathematical and other macros ------------------------------------------------
\RequirePackage{flypmacros}
%%%%%%

%%% theorem configuration ---------------------------------------------------------------

\RequirePackage{amsthm}

% defined theorems
%   problem, subproblem, proposition, discussion

% custom title interface
\newcommand{\@problemtitle}{Problem}
\newcommand{\@propositiontitle}{Proposition}
\newcommand{\@discussiontitle}{Discussion}
\newcommand{\problemtitle}[1]{\renewcommand{\@problemtitle}{#1}}
\newcommand{\propositiontitle}[1]{\renewcommand{\@propositiontitle}{#1}}
\newcommand{\discussiontitle}[1]{\renewcommand{\@discussiontitle}{#1}}

% theorem styles
\newtheoremstyle{problem}
  {}{}{}{}{\bfseries}{}{ }
  {\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}
\newtheoremstyle{problem*}
  {}{}{}{}{\bfseries}{}{ }
  {\thmname{#1}\thmnote{ #3}}

% theorem definitions
\theoremstyle{problem}\newtheorem{problem}{\@problemtitle}
\theoremstyle{problem*}\newtheorem{problem*}[problem]{\@problemtitle}
\theoremstyle{problem}\newtheorem{subproblem}{}[problem]
\theoremstyle{plain}\newtheorem{proposition}{\@propositiontitle}
\theoremstyle{remark}\newtheorem*{discussion}{\@discussiontitle}
\renewcommand{\thesubproblem}{(\alph{subproblem})}

% make %problem% nested
\makenested{problem} % produces `nestedproblem' env
\makenested{problem*}
\makenested{subproblem} % produces `nestedsubproblem' env

%%%%%%

\makeatother
