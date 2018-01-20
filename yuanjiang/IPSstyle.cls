 \NeedsTeXFormat{LaTeX2e}
 \ProvidesClass{BYUPhys}[2011/06/20 BYU Theses and Dissertations]

% The BYUPhys class is for producing theses and dissertations
% that meet the BYU requirements.
%
% The following class options are available
%
%   senior    : Produces the senior thesis preliminary pages (default)
%   Capstone  : Produce the capstone report preliminary pages
%   masters   : Produces the masters thesis preliminary pages
%   phd       : Produces the PhD dissertation preliminary pages
%   honors    : Produces the honors thesis preliminary pages
%   astronomy : Redefines references to auther/year, sets bibliography style to apj, and defines a bunch of astronomy-related macros
%   noacknowledgments : Removes the acknowledgments page
%   etd : Removes blank pages necessary for double-sided printing without a fuss
%
% Revision: June 2011
% Revision History
%   01-20-2012 : Added Capstone option
%   06-20-2011 : Added formal pages to TOC for honors theses
%   02-14-2011 : Cleaned up some linking issues, allowed more liberal figure placement, and added verbatim file input
%   02-11-2011 : Moved to new BYU style requirements, moved package loading into the cls file
%   07-15-2010 : Cleaned up page definitions
%   12-09-2009 : Updated to new BYU style, without signature pages.
%



% Declare some variables to hold the text fields for the preliminary pages

    \newcommand{\Title}[1]{\gdef\BYUField@Title{#1}}
    \newcommand{\Author}[1]{\gdef\BYUField@Author{#1}}
    \newcommand{\docname}[1]{\gdef\BYUField@DocName{#1}}
    \newcommand{\degree}[1]{\gdef\BYUField@Degree{#1}}
    \newcommand{\Advisor}[1]{\gdef\BYUField@Advisor{#1}}
    \newcommand{\AdvisorTitle}[1]{\gdef\BYUField@AdvisorTitle{#1}}
    \newcommand{\MemberA}[1]{\gdef\BYUField@MemberA{#1}}
    \newcommand{\MemberB}[1]{\gdef\BYUField@MemberB{#1}}
    \newcommand{\MemberC}[1]{\gdef\BYUField@MemberC{#1}}
    \newcommand{\MemberD}[1]{\gdef\BYUField@MemberD{#1}}
    \newcommand{\Month}[1]{\gdef\BYUField@Month{#1}}
    \newcommand{\Year}[1]{\gdef\BYUField@Year{#1}}
    \newcommand{\Abstract}[1]{\gdef\BYUField@Abstract{#1}}
    \newcommand{\Keywords}[1]{\gdef\BYUField@Keywords{#1}}
    \newcommand{\Acknowledgments}[1]{\gdef\BYUField@Acknowledgments{#1}}
    \newcommand{\HonorsRepresentative}[1]{\gdef\BYUField@HonorsRep{#1}}

% Initialize the variables to their default values

    \Title{[Title: Titles Must Be in Mixed Case and May Not Exceed Six Inches on One Line\\
           and Must Be in the Inverted Pyramid Format When\\
           Additional Lines Are Needed]}
    \Author{[Student Name]}
    \docname{thesis}
    \degree{Master (Engineering)}
    \Advisor{[Supervised by]}
    \AdvisorTitle{Supervisor}
    \MemberA{}
    \MemberB{}
    \MemberC{}
    \MemberD{}
    \Month{[Graduation Month]}
    \Year{[Year]}
    \Abstract{[The abstract is a summary of the thesis/dissertation with emphasis on the findings
              of the study. The abstract must not exceed 350 words in length and fit on one page,
              single spaced.]}
    \Keywords{[A comma-separated list of descriptive words for search purposes]}
    \Acknowledgments{[Acknowledgements should be simple, in good taste, and fit on one page]}
    \HonorsRepresentative{[Honors Representative]}

% Define the preliminary page layouts using the variables
    \newcommand{\IPStitlepage}{
        \thispagestyle{empty}
        {\centering
        $~$\\[1cm]
        {\large Waseda University Master Thesis}
        \\[2cm]
        \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Title Page}{bm:Title}
        \parbox[t]{6in}{
            \renewcommand{\baselinestretch}{1} \large\bf
            \centering\BYUField@Title\par
            \renewcommand{\baselinestretch}{1} \large\bf
            }\\[\baselineskip]\par
        \vfill
        {\Large \BYUField@Author\\[\baselineskip]}
        \vfill
        \vskip 5cm
        {\large \BYUField@Degree} \\
        \vfill
        {\large \BYUField@Advisor, \BYUField@AdvisorTitle}\\

        \vfill
        {\large Neurocomputing System\\
        Information Architecture\\
        The Graduate School of Information, Production and Systems\\[\baselineskip]
        \mbox{\BYUField@Month~\BYUField@Year} \\[\baselineskip]
        }
        }
        \clearemptydoublepage
      }



    \newcommand{\BYUtitlepage}{

      }

    \newcommand{\abstractpage}{
        \thispagestyle{empty}
        {\centering
        \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Abstract}{bm:Abstract}
        ABSTRACT\\[1\baselineskip]\par
        \renewcommand{\baselinestretch}{1} \large\normalsize%
        
        }

        \addtolength{\parskip}{\baselineskip}
        \singlespace
        \BYUField@Abstract\par

        \vfill
        \addtolength{\parskip}{-\baselineskip}
        \noindent Keywords:~\BYUField@Keywords

        \clearemptydoublepage
    }

    \newcommand{\acknowledgmentspage}{
        \singlespace
        \thispagestyle{empty}
        {\centering
        \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Acknowledgements}{bm:Acknowledge}
        ACKNOWLEDGMENTS\\[3\baselineskip]
        \par}\par
        \renewcommand{\baselinestretch}{1.66} \large\normalsize%
        \BYUField@Acknowledgments
        \par\renewcommand{\baselinestretch}{1} \large\normalsize%
        \clearemptydoublepage
        }

    % Honors wants this in the TOC
    \newcommand{\honorsacknowledgmentspage}{
        \providecommand\phantomsection{} \phantomsection
        \addcontentsline{toc}{chapter}{Acknowledgements}
        \acknowledgmentspage
    }

% Allow opt-out on acknowledgments
    \DeclareOption{noacknowledgements}{
      \renewcommand{\acknowledgmentspage}{}
      \renewcommand{\honorsacknowledgmentspage}{}
    }



% Define the macro for making preliminary pages
    \newcommand{\makepreliminarypages}{
        \singlespace
        \changepage{0.5in}{}{}{}{}{}{-0.2in}{-0.3in}{}
        \IPStitlepage
        \BYUtitlepage
        \abstractpage
        \acknowledgmentspage
        \renewcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}
        \changepage{-0.5in}{}{}{}{}{}{0.2in}{0.3in}{}
        \doublespace
    }


    \DeclareOption{senior}{
        % Don't need anything here because default values
        % were set when we initialized variables
    }

    \DeclareOption{capstone}{
      \degree{Bachelor of Science}
      \docname{capstone report}
      \AdvisorTitle{Advisor}
    }

    \DeclareOption{masters}{
      \degree{Master of Science}
      \docname{thesis}
      \AdvisorTitle{Chair}
    }

    \DeclareOption{phd}{
      \degree{Doctor of Philosophy}
      \docname{dissertation}
      \AdvisorTitle{Chair}
    }

% Reference style change for astronomy option
    \newif\ifAstroThesis
    \DeclareOption{astronomy}{
        \AstroThesistrue
    }

% Honors does their own thing...

    \DeclareOption{honors}{
      \renewcommand{\makepreliminarypages}{
        \changepage{0.5in}{-0.5in}{}{0.5in}{}{}{-0.2in}{-0.3in}{}
        \providecommand\phantomsection{} \phantomsection
        \addcontentsline{toc}{chapter}{Title and signature page}
        \honorstitlepage
        \providecommand\phantomsection{} \phantomsection
        \addcontentsline{toc}{chapter}{Abstract}
        \honorsabstractpage
        \honorsacknowledgmentspage
        \renewcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}
        \changepage{-0.5in}{}{}{}{}{}{0.2in}{0.3in}{}
        \doublespace
      }
    }

    \newcommand{\honorstitlepage}{
        \thispagestyle{empty}
        \begin{center}
        \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Title Page}{bm:Title}
        \vspace*{0.375in}
        \parbox[t]{5in}{
            \renewcommand{\baselinestretch}{2} \small\normalsize
            \centering\BYUField@Title\par
            \renewcommand{\baselinestretch}{1} \small\normalsize
            }
        \vfill
        by\\[\baselineskip]
        \BYUField@Author
        \vfill
        Submitted to Brigham Young University in partial fulfilment\\[\baselineskip]
        of graduation requirements for University Honors
        \vfill
        Department of Physics and Astronomy\\[\baselineskip]
        Brigham Young University\\[\baselineskip]
        \BYUField@Month~\BYUField@Year
        \vfill
        \end{center}
        \parbox[b]{2.9in}{
            Advisor: \BYUField@Advisor \\[.5\baselineskip]
            }
        \hfill
        \parbox[b]{2.9in}{\singlespace
            Honors Representative: \BYUField@HonorsRep \\[.5\baselineskip]
            }
        \parbox[b]{2.9in}{
            Signature: \hrulefill}
        \hfill
        \parbox[b]{2.9in}{\singlespace
            Signature: \hrulefill}
        \clearemptydoublepage
      }

    \newcommand{\honorsabstractpage}{
        \thispagestyle{empty}
        {\centering
        \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Abstract}{bm:Abstract}
        ABSTRACT\\[2\baselineskip]\par
        \renewcommand{\baselinestretch}{1} \small\normalsize
        \parbox{5in}{\centering\BYUField@Title}\\[1\baselineskip]\par
        \renewcommand{\baselinestretch}{2} \small\normalsize
        \mbox{\BYUField@Author}\\
        Department of Physics and Astronomy\\
        \mbox{\BYUField@Degree}\\[0.5\baselineskip]\par
        }

        \renewcommand{\baselinestretch}{1.66} \small\normalsize
        \BYUField@Abstract

        \clearemptydoublepage
    }

% A command to handle single sided preliminary pages in a double sided environment

    % Define the '\clearemptydoublepage' command to clear pages but not number any blank pages inserted.
    \let\cle@rdoublep@ge\cleardoublepage
    \newcommand{\cle@remptydoublep@ge}{
      \clearpage
      \if@twoside
      \ifodd\c@page\else
      \fi\fi
      {\pagestyle{empty}\cle@rdoublep@ge}}
    \newcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}

\DeclareOption{etd}{
    \renewcommand{\clearemptydoublepage}{\clearpage}
    }


% Load the class and needed packages
    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
    \ProcessOptions
    \relax
    \LoadClass[letterpaper,12pt]{book}

    \RequirePackage{changepage}

% A couple of useful macros for line spacing

    % The \singlespace macro switches to single spaced lines
    \newcommand{\singlespace}{\par\renewcommand{\baselinestretch}{1}\small\normalsize\par}

    % The \doublespace macro switches to double spaced lines
    \newcommand{\doublespace}{\par\renewcommand{\baselinestretch}{1.66}\small\normalsize\par}


% Set the margins to BYU specifications

    \setlength{\marginparwidth}{0pt}
    \setlength{\marginparsep}{0pt}
    \setlength{\oddsidemargin}{0in}
    \setlength{\evensidemargin}{0in}
    \setlength{\textwidth}{6.5in}
    \setlength{\topmargin}{0in}
    \setlength{\headheight}{0.2in}
    \setlength{\headsep}{0.3in}
    \setlength{\textheight}{8.4in}
    \setlength{\footskip}{0.25in}
    \raggedbottom

% Allow more liberal figure placement
    \renewcommand{\topfraction}{0.9}
    \renewcommand{\bottomfraction}{0.8}
    \setcounter{topnumber}{2}
    \setcounter{bottomnumber}{2}
    \setcounter{totalnumber}{4}
    \renewcommand{\textfraction}{0.07}

% Redefine the Table of Contents to deal with some blank page
% and bookmarking issues relating to ETD submission
    \let\TEMPtableofcontents\tableofcontents
    \renewcommand{\tableofcontents}{
      \clearemptydoublepage
      \singlespace
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{Table of contents}
      \TEMPtableofcontents
      \clearemptydoublepage
      \doublespace
    }

% Redefine the List of Figures to deal with some blank page
% and bookmarking issues
    \let\TEMPlistoffigures\listoffigures
    \renewcommand{\listoffigures}{
    	  \clearemptydoublepage
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{List of figures}
      \TEMPlistoffigures
      \clearemptydoublepage
      \doublespace
    }

%%%%% Redefine the List of Tables to deal with some blank page
%%%%% and bookmarking issues
    \let\TEMPlistoftables\listoftables
    \renewcommand{\listoftables}{
    	  \clearemptydoublepage
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{List of tables}
      \TEMPlistoftables
      \clearemptydoublepage
      \doublespace
    }

% Redefine the Bibliography to deal with a bookmarking issues
    \let\TEMPbibliography\bibliography
    \renewcommand{\bibliography}{\clearemptydoublepage
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{Bibliography}
      \TEMPbibliography
    }

% The makeidx package makes your index for you.  To make an index entry,
% go to the place in the book that should be referenced and type
%  \index{key}
% An index entry labeled "key" (or whatever you type) will then
% be included and point to the correct page.
\usepackage{makeidx}
\makeindex

% Redefine the Index to deal with a bookmarking issues
    \let\TEMPprintindex\printindex
    \renewcommand{\printindex}{\clearemptydoublepage
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{Index}
      \singlespace
      \TEMPprintindex
      \doublespace
    }

% These packages typeset the thesis with Times Roman font
\usepackage[T1]{fontenc}
\usepackage{mathptmx}

% Allow the inclusion of graphics
\usepackage{graphicx}

% The fancyhdr package allows you to easily customize the page header.
% The settings below produce a nice, well separated header.
\usepackage{fancyhdr}
  \fancyhead{}
  \fancyhead[LO]{\slshape \rightmark}
  \fancyhead[RO,LE]{\textbf{\thepage}}
  \fancyhead[RE]{\slshape \leftmark}
  \fancyfoot{}
  \pagestyle{fancy}
  \renewcommand{\chaptermark}[1]{\markboth{\chaptername \ \thechapter \ \ #1}{}}
  \renewcommand{\sectionmark}[1]{\markright{\thesection \ \ #1}}


% Some useful packages
    \usepackage{amsmath}

    % This package makes straight single quotes in the Verbatim environment
    \usepackage{upquote}

    % This package lets us use custom Verbatim environments
    \usepackage{fancyvrb}
    \RecustomVerbatimEnvironment
      {Verbatim}{Verbatim}{xleftmargin=0.25in}

% Set the bibliography style



% The caption package allows you to change the formatting of figure captions.
% The commands here change to the suggested caption format:
% single spaced and a bold tag
\usepackage[margin=0.3in,labelfont=bf,labelsep=none]{caption}
 \DeclareCaptionFormat{suggested}{\singlespace#1#2 #3\par\doublespace}
 \captionsetup{format=suggested}


% The hyperref package provides automatic linking and bookmarking for the table
% of contents, index, equation references, and figure references.  It must be
% included for the BYU Physics class to make a properly functioning electronic
% thesis.  It should be the last package loaded if possible.
%
% To include a link in your pdf use \href{URL}{Text to be displayed}.  If your
% display text is the URL, you probably should use the \url{} command discussed
% above.
%
% To add a bookmark in the pdf you can use \pdfbookmark.  You can look up its usage
% in the hyperref package documentation
\usepackage[bookmarksnumbered,pdfpagelabels=true,plainpages=false,colorlinks=true,
            linkcolor=black,citecolor=black,urlcolor=blue]{hyperref}
\urlstyle{rm}

\doublespace
