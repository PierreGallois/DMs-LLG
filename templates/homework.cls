% Document class for homework. Makes it very easy to create new LaTeX homework
% solutions. Either place the `homework.cls' and `mathOperators.sty' files in 
% the same folder as your `homework.tex' file, or place them in your latex 
% search path. This is typically something like ~/texmf/tex/latex/homework.
% 
% Example homework document:
%%% \documentclass[hidequestions]{homework}
%%% \homeworksetup{
	%%%     username={Sebastiaan Vermeulen},
	%%%     course={Quantum Computing},
	%%%     setnumber=5}
%%% \begin{document}% Automatically prints a header
	%%%
	%%% \problem*{3}% starred version for manual numbering
	%%% \question{How much is 1+1?}
	%%% 2.
	%%%
	%%% \problem% unstarred version does auto numbering
	%%% \subproblem% subproblem also has a starred version.
	%%% \question{What is 2-1?}
	%%% 1.
	%%%
	%%% \end{document}

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{homework}[2018/03/12 Sebastiaans Homework package]

% load base class
\LoadClass[a4paper]{article}

% -----------------------------------------------------------------------------
% misc packages required for makeup
\RequirePackage{xcolor} % for other colors than black
\RequirePackage{kvsetkeys} % some improvements on keyval
\RequirePackage{keyval} % to process package options
\RequirePackage{amsmath, amssymb}
\RequirePackage{amsthm}
\newtheorem*{lemma}{Lemme}


\theoremstyle{definition}
\newtheorem*{thm}{Théorème}
\RequirePackage[
% showframe,
nomarginpar,
top=1in,
bottom=1in,
left=1in,
right=1in
]{geometry} % tighter margins


% -----------------------------------------------------------------------------
% problem and subproblem definitions
\newcounter{problem}
\newcounter{subproblem}[problem]

\newcommand{\problem}{\@ifstar{\Problem}{\stepcounter{problem}\Problem{\theproblem}}}

% override this to change the appearance of the `Problem' header
\newcommand{\Problem}[2]{
	\setcounter{problem}{#1}
	\setcounter{subproblem}{0}
	\par
	{\mbox{\textbf{\Large Problème #1 - #2}}
		\leaders\hbox{\colorbox{black!40}{\phantom{\Large I}}}\hfill}
	\hspace{-2em}\colorbox{black!40}{\phantom{\Large I}}
	\par
}

\newcommand{\subproblem}{\@ifstar{\Subproblem}{\stepcounter{subproblem}\Subproblem{\thesubproblem}}}

% override this to change the appearance of the `Subproblem' header
\newcommand{\Subproblem}[1]{
	\setcounter{subproblem}{#1}
	\setcounter{questioncount}{0}
	\par\vspace{.5em}
	{\colorbox{black!10}{\makebox[\dimexpr\linewidth-2\fboxsep][l]{
				\textbf{\large #1)} 
	}}}\par
}

\newcommand{\partie}[2]{
	\par
	{\mbox{\textbf{\Large Partie #1 - #2}}
		\leaders\hbox{\colorbox{black!30}{\phantom{\Large I}}}\hfill}
	\hspace{-2em}\colorbox{black!30}{\phantom{\Large I}}
	\par
}

% -----------------------------------------------------------------------------
\newcounter{questioncount}[subproblem]
\newcommand{\questioncounter}{\alph{questioncount}}

% hidequestions class option definition
\newcommand\question[0]{
	\stepcounter{questioncount}
	\par{\textbf{\questioncounter)} }
}

% -----------------------------------------------------------------------------
% package option definitions: user, course, and set number
% set default options
\newcommand\@username{username}
\newcommand\@course{course}
\newcommand\@setnumber{0}

% override defaults if provided
\define@key{Homework}{username}{\renewcommand\@username{#1}}
\define@key{Homework}{course}{\renewcommand\@course{#1}}
\define@key{Homework}{setnumber}{\renewcommand\@setnumber{#1}}

\newcommand\homeworksetup{\kvsetkeys{Homework}}


% -----------------------------------------------------------------------------
% mark paragraphs with empty line instead of indented first line
\setlength{\parindent}{0em}
\setlength{\parskip}{1em}

% -----------------------------------------------------------------------------
% Raccourcis
\newcommand{\R}{\mathbb R}
\newcommand{\Q}{\mathbb Q}
\newcommand{\D}{\mathbb D}
\newcommand{\Z}{\mathbb Z}
\newcommand{\N}{\mathbb N}


% Troll pages
\renewcommand*{\thepage}{%
	\ifcase \value{page}
		0
	\or
		1
	\or
		2
	\or
		3
	\or % Page 4
		$\pi = 4$
	\else
		\arabic{page}
	\fi
}

% -----------------------------------------------------------------------------
% format for header
\newcommand{\@printtitle}{
	\begin{center}
		{\Large\bf\@course\ : Devoir maison n° \@setnumber} \par\vspace{.5em}
		{\@username}
	\end{center}
}

% print header at start of document, right after \begin{document}
	\let\@olddocument\document
	\def\document{\@olddocument\@printtitle}
	
	\endinput
