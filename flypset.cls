\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{flypset}

\LoadClass{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\makeatletter

%%% ams mathematics packages %%%
\RequirePackage{amsmath, amssymb, amsthm}
%%%%%%

%%% nice enumeration packages %%%
\RequirePackage{enumerate, booktabs}
%%%%%%

%%% useful mathematical and other macros %%%
\RequirePackage{flypmacros}
%%%%%%

%%% reasonable margins %%%
\RequirePackage{fullpage}
%%%%%%

%%% header configuration %%%
\RequirePackage{fancyhdr, lastpage}

% supported header parameters:
%   \title, \author, \date, \namespace,
%   \instsection, \instinstructor, \institution

\newcommand{\@namespace}{}
\newcommand{\@instsection}{}
\newcommand{\@instinstructor}{}
\newcommand{\@institution}{}
\newcommand{\namespace}[1]{\renewcommand{\@namespace}{#1}}
\newcommand{\instsection}[1]{\renewcommand{\@instsection}{#1}}
\newcommand{\instinstructor}[1]{\renewcommand{\@instinstructor}{#1}}
\newcommand{\institution}[1]{\renewcommand{\@institution}{#1}}

\setlength{\headheight}{15.2pt}
\pagestyle{fancyplain}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\setlength{\headsep}{0.1in}

\fancyhead[C]{\@title}
\fancyhead[R]{\@author, \@institution}
\fancyfoot[L]{\@namespace\ (\@instsection,\ \@instinstructor)}
\fancyfoot[C]{\@date}
\fancyfoot[R]{\thepage\ of\ \pageref{LastPage}}
%%%%%%

%%% theorem configuration %%%
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
\theoremstyle{problem}\newtheorem{subproblem}{}[problem]
\theoremstyle{plain}\newtheorem*{proposition}{\@propositiontitle}
\theoremstyle{remark}\newtheorem*{discussion}{\@discussiontitle}
\renewcommand{\thesubproblem}{(\alph{subproblem})}
%%%%%%

%%% nested environment (wrapper for addmargin) %%%
\RequirePackage{scrextend}

\newenvironment{nested}
  {\begin{addmargin}{\parindent}}
  {\end{addmargin}}
%%%%%%

\makeatother
