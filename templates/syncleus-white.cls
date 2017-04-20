% ---------------------------------------------------------------------
% White paper template by Syncleus, Inc.
% Released under the OSCL Type C, version 1.0 or later
% July 2013
% ---------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SyncleusWhite}[7/8/2013, v1.0]
\RequirePackage{ifthen}
\RequirePackage{calc}
\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
\LoadClass{article}

\RequirePackage{times}      % Loads the Times-Roman Fonts
\RequirePackage{mathptmx}   % Loads the Times-Roman Math Fonts
\RequirePackage{ifpdf}      % Needed to pick between latex and pdflatex

% ---------------------------------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{graphicx,xcolor}
\RequirePackage[english]{babel}
\RequirePackage{booktabs}
\RequirePackage{eso-pic}
\RequirePackage{hyperref}

% ---------------------------------------------------------------------

%%%%% for abstract+authors frames


% ---------------------------------------------------------------------        

\RequirePackage[labelfont={bf,sf},%
                labelsep=period,%
                justification=raggedright]{caption}

% styles
\setlength{\fboxrule}{0.75pt} % Width of the border around the abstract
\definecolor{color1}{RGB}{0,0,90} % Color of the article title and sections
\definecolor{color2}{RGB}{0,20,20} % Color of the boxes behind the abstract and headings
\newlength{\tocsep}
\setlength\tocsep{1.5pc} % Sets the indentation of the sections in the table of contents
% ---------------------------------------------------------------------

%------------------ Various commands ----------------------------------

%Some commands for sections without titles but in the TOC
\newcommand{\nopart}[1]{%
  \refstepcounter{part}%
  \addcontentsline{toc}{part}{\protect\numberline{\thepart}#1}%
  \markright{#1}}
\newcommand{\nochapter}[1]{%
  \refstepcounter{chapter}%
  \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}%
  \markright{#1}}
\newcommand{\nosection}[1]{%
  \refstepcounter{section}%
  \addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}%
  \markright{#1}}
\newcommand{\nosubsection}[1]{%
  \refstepcounter{subsection}%
  \addcontentsline{toc}{subsection}{\protect\numberline{\thesubsection}#1}%
  \markright{#1}}
\newcommand{\nosubsubsection}[1]{%
  \refstepcounter{subsubsection}%
  \addcontentsline{toc}{subsubsection}{\protect\numberline{\thesubsubsection}#1}%
  \markright{#1}}


\newcommand{\draft}[1]{
    \makeatletter
    \AddToShipoutPicture{%
    \setlength{\@tempdimb}{.5\paperwidth}%
    \setlength{\@tempdimc}{.5\paperheight}%
    \setlength{\unitlength}{1pt}%
    \protect{\put(\strip@pt\@tempdimb,\strip@pt\@tempdimc){%
    \makebox(-565,0){\rotatebox{90}{\textcolor[gray]{0.90}%
       {\Huge Draft: #1}}}
    \makebox(565,0){\rotatebox{270}{\textcolor[gray]{0.90}%
       {\Huge  Draft: #1}}}}}}
    \makeatother
  }

\newcommand{\keywordname}{Keywords} % Defines the keywords heading name

\newcommand{\copyrightfrom}[1]{
        \affiliation{\textcopyright #1 - \today}
    }
\newcommand{\copyrightrange}[2]{
        \affiliation{\textcopyright #1 - #2}
    }

%-------------------------------------------------------------------------------


\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers
% Headers
\lhead{}%
\chead{}%
\rhead{\small\sffamily\bfseries\@PaperTitle\  --- \thepage/\pageref{LastPage}}
% Footers
\lfoot{}%
\cfoot{}%
\rfoot{}%
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule
% ---------------------------------------------------------------------
% section/subsection/paragraph set-up
\RequirePackage[explicit]{titlesec}
\titleformat{\section}
  {\color{color1}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering\arabic{section}. #1}}}
  []
\titleformat{name=\section,numberless}
  {\color{color1}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering#1}}}
  []
\titleformat{\subsection}
  {\color{color1}\sffamily\bfseries}
  {\thesubsection}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}
  {\sffamily\small\bfseries}
  {\thesubsubsection}
  {0.5em}
  {#1}
  []
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1}
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}
% ---------------------------------------------------------------------
% tableofcontents set-up
\usepackage{titletoc}
\contentsmargin{0cm}
\titlecontents{section}[\tocsep]
  {\addvspace{4pt}\small\bfseries\sffamily}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\hfill\thecontentspage}
  []
\titlecontents{subsection}[\tocsep]
  {\addvspace{2pt}\small\sffamily}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\ \titlerule*[.5pc]{.}\ \thecontentspage}
  []
\titlecontents*{subsubsection}[\tocsep]
  {\footnotesize\sffamily}
  {}
  {}
  {}
  [\ \textbullet\ ]
% ---------------------------------------------------------------------
% Get the multiple author set
\newcount\@authcnt
\newcount\@tmpcnt\@tmpcnt\z@

\def\@affiliation{%
  \ifnum\@tmpcnt<\@authcnt
   \global\advance\@tmpcnt1
    \raggedright \csname @auth\romannumeral\the\@tmpcnt\endcsname\hfill\\%
   \let\next\@affiliation \vskip1pt
  \else
   \let\next\relax
  \fi
\next}
	
\newcommand{\affiliation}[1]{%
    \global\advance\@authcnt1
    \expandafter\gdef\csname @auth\romannumeral\the\@authcnt\endcsname
    {#1}}
% ---------------------------------------------------------------------
\RequirePackage{enumitem}
%\setlist{nolistsep} % Uncomment to remove spacing between items in lists (enumerate, itemize)
% ---------------------------------------------------------------------
% Remove brackets from numbering in List of References
\renewcommand{\@biblabel}[1]{\bfseries\color{color1}\textsuperscript{[#1]}}
%\setlength{\bibitemsep}{0cm}
% ---------------------------------------------------------------------
\newcommand{\PaperTitle}[1]{\def\@PaperTitle{\centering #1}}
\newcommand{\Authors}[1]{\def\@Authors{#1}}
\newcommand{\Revision}[1]{\def\@Revision{Rev #1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}
\newcommand{\Archive}[1]{\def\@Archive{#1}}
% ---------------------------------------------------------------------
\renewcommand{\@maketitle}{
\onecolumn{
\thispagestyle{empty}
\vskip-36pt%
{\raggedleft\small\sffamily\bfseries\@Revision\\\@Archive\par}%
\vskip20pt%
{\raggedright\color{color1}\sffamily\bfseries\fontsize{20}{25}\selectfont \@PaperTitle\par}%
\vskip10pt
{\raggedright\color{color1}\sffamily\fontsize{12}{16}\selectfont  \@Authors\par}
\vskip18pt%
\fcolorbox{color1}{white}{%
\parbox{\textwidth-2\fboxsep-2\fboxrule}{\centering%
\colorbox{color2!10}{%
\parbox{\textwidth-3.5\fboxsep-3.5\fboxrule}{%
\ifx\@Keywords\@empty
\sffamily\small\textbf{\abstractname}\\\@Abstract
\else
\sffamily\small\textbf{\abstractname}\\\@Abstract\\[5pt]%
\textbf{\keywordname}\\\@Keywords%
\fi
}%
}%
\vskip5pt%
\begingroup%
\raggedright\sffamily\small%
\footnotesize\@affiliation\par%
\endgroup%%
}%
}%
\vskip25pt%
}%
}%
% ---------------------------------------------------------------------
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
\addcontentsline{toc}{section}{\hspace*{-\tocsep}\refname}%
\oldbibliography{#1}%
\setlength\itemsep{0pt}%
}
