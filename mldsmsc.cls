% mldsmsc.cls file created by Dean Bodenham (2021), 
% Last updated April 2023 
% Based on statsmsc.cls
% Partially based on Paul Ginzberg's template (2015).
% Using part of icmathsthesis to sort out fonts for chapter/section headings

% Imperial College's logo from Imperial College's website

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{statsmsc}[2021/09/24 Thesis template for MSc in Statistics]

\LoadClass[11pt,headings=optiontohead,twoside=false]{scrbook}

\RequirePackage{scrtime}
\RequirePackage{setspace}
% From icmathsthesis.cls
\RequirePackage{ifthen}
\RequirePackage{booktabs}
\RequirePackage{algpseudocode}
\RequirePackage{algorithm}


% Remove blank page between chapters
\KOMAoptions{twoside=false}

% AMS packages
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}

% for bold symbols, e.g. bold Greek symbols, use the bm package
%\usepackage{bm} 

% Graphics, importing figures
\RequirePackage{graphicx}
\RequirePackage{xcolor}

% for positioning Imperial logo
\RequirePackage[absolute]{textpos}

% for bibtex
\RequirePackage[round,authoryear,sort]{natbib}
%\usepackage[authoryear]{natbib}
%\usepackage[numbers]{natbib}
\RequirePackage[colorlinks=true, citecolor=red, linkcolor=blue, urlcolor=blue]{hyperref}


%% Theorem environment and numbering
\theoremstyle{definition}
\newtheorem{definition}{Definition}[section]
\newtheorem{theorem}[definition]{Theorem}
\newtheorem{proposition}[definition]{Proposition}
\newtheorem{lemma}[definition]{Lemma}
\newtheorem{corollary}[definition]{Corollary}
%% making example same as definition style
\newtheorem{example}[definition]{Example}
\newtheorem{remark}[definition]{Remark}

% fixing proof environment
\renewenvironment{proof}[1][\proofname]%
{\noindent\trivlist\item\ignorespaces{\bfseries #1. }}%
    {\hfill $\square$}

%a command for quoting:
\newcommand*{\usequote}[1]{``{#1}''}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Title page
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Title style
\renewcommand{\titlefont}{\normalcolor \normalfont \bfseries \Huge}

%% Title page
%\makeatletter
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\CID}[1]{\gdef\@CID{#1}}
\newcommand*{\logoimg}{\gdef\@logoimg}
%\newcommand*{\logoimg}[1]{\gdef\@logoimg{#1}}

\renewcommand{\maketitle}{
% set to front matter
\frontmatter


\begin{titlepage}
\ifdefined\@logoimg
\centering
\includegraphics[width=85mm]{imperial_logo.pdf}
\vspace*{1cm}
\else
%\vspace*{0cm}
\fi
\begin{center}
\vspace*{\stretch{0.1}}
%{\large Imperial College London}\\
{\large Department of Mathematics}\par
\vspace*{\stretch{1}} % This inserts vertical space and allows you to specify a relative size for the vertical spaces.
{\titlefont \@title\par} % If your title is long, you may wish to use \huge instead of \Huge.
\vspace*{\stretch{2}}
{\Large \@author \par}
\vspace*{1em}
{\large CID: \@CID \par}
\vspace*{\stretch{0.5}}
{\large Supervised by \@supervisor \par}
\vspace*{\stretch{3}}
{\Large \@date \par}
\vspace*{\stretch{1}}
{\large Submitted in partial fulfilment of the requirements for the \\
MSc in Machine Learning and Data Science of \\ Imperial College London}
\vspace*{\stretch{0.1}}
\end{center}%
\end{titlepage}%
}
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Declaration
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand*{\declarationdate}[1]{\gdef\@declarationdate{#1}}
\newcommand*{\declarationname}[1]{\gdef\declarationname{#1}}

% Plagiarism delcaration
\newcommand*{\declaration}{%

\newpage
\thispagestyle{plain}
\hphantom{1}
\vfill
\noindent The work contained in this thesis is my own work unless
otherwise stated.
\vfill
{Signed: {\declarationname}  \hfill} 
{\hfill  Date: {\@declarationdate} \hfill}
\vfill
%setting the declaration page to start on page i
\setcounter{page}{1}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Abstract
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{abstract}%
{\chapter*{Abstract}\thispagestyle{plain}}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Acknowledgements
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{acknowledgements}%
{\chapter*{Acknowledgements}\thispagestyle{plain}}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Header style
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[headsepline,plainheadsepline]{scrlayer-scrpage}
\clearpairofpagestyles
\automark{chapter}
\ohead*{\pagemark}
% "*" means it is included on the chapter page, 
% no "* means it is not included on that page
\ihead{\headmark}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Section fonts
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% used koma commands to set the sections to use the same font as title
% had to manually specify font sizes
% if this is not included, different font types are used


% This is the golden line: will fix fonts to be same as body, and not weird 'Arial'
%https://groups.google.com/g/comp.text.tex/c/V8cZRmLU6sY
\setkomafont{sectioning}{\normalcolor\bfseries}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     References/Bibliography
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% change Bibliography to References
\renewcommand{\bibname}{References}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
