% created and maintained by Noah D. Ortiz at analyticalnoa@gmail.com.
% component of the flyptex package.
% public repo availabe at github.com/analyticalnoa/flyptex.

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{flyparticle}[2019/03/04]

% deal with options.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% import core.
\RequirePackage{flypcore}

% reasonable margins.
\RequirePackage{fullpage}

% headers
% ----------------------------------------------------------------------------------------
\RequirePackage{fancyhdr, lastpage}

% supported header parameters:
%   \title, \author, \date, \namespace,
%   (NOT UNTIL BOTHER TO LEARN CONDITIONALS:) \instsection, \instinstructor, \institution

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
% ----------------------------------------------------------------------------------------
