\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{flyparticle}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\makeatletter

%%% import some nice packages -----------------------------------------------------------
\RequirePackage{amsmath, amssymb, amsthm}
\RequirePackage{physics}
\RequirePackage{enumerate}
\RequirePackage{booktabs}
\RequirePackage{xifthen}
%%%%%%

%%% reference setup ----------------------------------------------------------------------
\RequirePackage{varioref}
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,linkcolor=blue,citecolor=blue}
\RequirePackage[nameinlink]{cleveref}
%%%%%%

%%% reasonable margins ------------------------------------------------------------------
\RequirePackage{fullpage}
%%%%%%

%%% header configuration ----------------------------------------------------------------

\RequirePackage{fancyhdr, lastpage}

% supported header parameters:
%   \title, \author, \date, \namespace,
%   (NOT UNTIL ABLE TO MAKE CONDITIONAL:) \instsection, \instinstructor, \institution

\title{} % title not mandatory, unlike article
\newcommand{\@namespace}{}
\newcommand{\@instsection}{}
\newcommand{\@instinstructor}{}
\newcommand{\@institution}{}
\newcommand{\namespace}[1]{\renewcommand{\@namespace}{#1}}
% \newcommand{\instsection}[1]{\renewcommand{\@instsection}{#1}}
% \newcommand{\instinstructor}[1]{\renewcommand{\@instinstructor}{#1}}
% \newcommand{\institution}[1]{\renewcommand{\@institution}{#1}}

\setlength{\headheight}{15.2pt}
\pagestyle{fancyplain}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\setlength{\headsep}{0.1in}

\fancyhf{}
\fancyhead[C]{\@title}
\fancyhead[R]{\@author}%, \@institution}
\fancyfoot[L]{\@namespace}%\ (\@instsection,\ \@instinstructor)}
\fancyfoot[C]{\@date}
\fancyfoot[R]{\thepage\ of\ \pageref{LastPage}}

%%%%%%

%%% nested environment ------------------------------------------------------------------

\RequirePackage{scrextend}

% configurable length: \nesting
\newlength{\nesting}
\setlength{\nesting}{\parindent}

% command to create nested env from regular env
% \makenested{<env>} produces nested<env> env
\newcommand{\makenested}[1]{%%
  \newenvironment{nested#1}[1][]
    {\begin{#1}[##1]\begin{addmargin}{\nesting}}
    {\end{addmargin}\end{#1}}
}

%%%%%%

\makeatother
