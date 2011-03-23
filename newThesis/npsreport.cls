% New NPS thesis and report style for modern LaTeX
% Simson L. Garfinkel, Dept. of Computer Science
% Modification log:

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{npsreport}[2008/10/01]

\newif\ifnpstraditional\npstraditionalfalse
\newif\ifsignatureline\signaturelinefalse
\newif\ifnpstwoside\npstwosidefalse
\newif\ifnpsauthorindex\npsauthorindexfalse
\newif\ifnpsarticle\npsarticlefalse
\newif\ifnpsthesis\npsthesisfalse
\newif\iftwoauthors\twoauthorsfalse
\newif\iftwoadvisors\twoadvisorsfalse
\newif\ifnpssinglespace\npssinglespacefalse
\newif\ifclassified\classifiedfalse
\newif\ifnpsdissertation\npsdissertationfalse
\newif\iffontsizeset\fontsizesetfalse
\newif\ifnpstight\npstightfalse

\DeclareOption{article}{\npsarticletrue}           % use article default, not report
\DeclareOption{traditional}{\npstraditionaltrue}   % make it look old way
\DeclareOption{signatureline}{\signaturelinetrue}
\DeclareOption{twoside}{\npstwosidetrue}
\DeclareOption{authorindex}{\npsauthorindextrue}   % generate an author index
\DeclareOption{thesis}{\npsthesistrue}             % is this a thesis?
\DeclareOption{twoauthors}{\twoauthorstrue}        % two students? 
\DeclareOption{twoadvisors}{\twoadvisorstrue}        % two advisors? 
\DeclareOption{classified}{\classifiedtrue}        % you're in the STBL or SCIF
\DeclareOption{singlespace}{\npssinglespacetrue}   % looks better
\DeclareOption{dissertation}{\npsdissertationtrue}
\DeclareOption{tight}{\npstighttrue}

\DeclareOption{10pt}{
   \fontsizesettrue
}
\DeclareOption{11pt}{
  \PassOptionsToClass{11pt}{article}
  \PassOptionsToClass{11pt}{report}
  \fontsizesettrue
}
\DeclareOption{12pt}{
  \PassOptionsToClass{12pt}{article}
  \PassOptionsToClass{12pt}{report}
  \fontsizesettrue
}  
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
% Options Processing
\PassOptionsToClass{twoside}{geometry}
\PassOptionsToClass{twoside}{report}           % Options for report
\PassOptionsToClass{openright}{report}

\PassOptionsToClass{twoside}{article}          % Options for article
\PassOptionsToClass{openright}{article}
\ProcessOptions

% Now options can be used

\ifclassified
  \typeout{*********************************************}
  \typeout{******** MAKING CLASSIFIED THESIS ***********}
  \typeout{*********************************************}
  \def\ULABEL{ (U) }
\else
  \def\ULABEL{}
\fi


\iffontsizeset
  % Font size is set
\else
  \PassOptionsToClass{12pt}{article}
  \PassOptionsToClass{12pt}{report}
\fi  

\ifnpsarticle
  \LoadClass{article}
\else
  \LoadClass{report}             % inherit from article so we can have
\fi

% Bring in the modern LaTeX packages; look at CTAN to see what each of
% these does.

\usepackage[letterpaper,lmargin=1.10in,rmargin=1.10in,hoffset=.0in,tmargin=1in,bmargin=1.5in]{geometry}
\footskip = .5in                % margin goes from the page number
\usepackage{graphicx}           % better way to bring in graphics
\usepackage{times}              % print the thesis in Times
\usepackage{tabularx}           % tables that expand to with width requested
\usepackage{titletoc}		% adds toc commands
\usepackage{titlesec}		% complete replacement for titles
\usepackage{fancyhdr}		% puts chapters names in footers
\usepackage{ccaption}		% control captions
\usepackage{setspace}           % enabled \doublespacing, \onehalfspacing, etc.
\usepackage{multicol}           % multiple columns; good for you!
\usepackage{fancyvrb}           % a better verbatim
\usepackage{varioref}		% provides \vref - smart referencing
\usepackage{xspace}             % provides \xspace
\usepackage{nps_sf298}           % Bring in SF298 for the documentation page
\usepackage{latexsym}           % gives \Box
\usepackage{graphicx}           % it's better
\usepackage{multirow}           % for table cells with multiple row   
\usepackage{pifont}             % fancy characters
\usepackage{remreset}           % prevent footnotes from being reset at each chapter
\usepackage{color}
\usepackage{xcolor}
\usepackage[lowtilde]{url}                % make \url work and link
\usepackage{paralist}           % {compactenum} {compactitem} environments

% Control widows, orphans, and floats
\renewcommand{\topfraction}{0.90}
\renewcommand{\floatpagefraction}{0.90}
\setcounter{topnumber}{10}   % up to 10 floats at the top of the page; Should be enough
\setcounter{totalnumber}{10} % see above


% Here are some commands that will help you make more attractive LaTeX
\newcommand{\checkmark}{\Pisymbol{pzd}{52}}
\newcommand{\eg}{\emph{e.g.,\xspace}}
\newcommand{\ie}{\emph{i.e.,\xspace}}
\newcommand{\etc}{\emph{etc.\xspace}}
\newcommand{\etal}{\emph{et al.\xspace}}
\newcommand{\naive}{na\"{\i}ve }
\newcommand{\Naive}{Na\"{\i}ve }

% You can also insert this before paragraphs that have problems:
% \looseness -1 

\newcommand{\chapref}[1]{Chapter~\ref{#1}\xspace}
\newcommand{\chapvref}[1]{Chapter~\vref{#1}\xspace}
\newcommand{\secref}[1]{Section~\ref{#1}\xspace}
\newcommand{\secvref}[1]{Section~\vref{#1}\xspace}
\newcommand{\figvref}[1]{Figure~\vref{#1}\xspace}
\newcommand{\tabref}[1]{Table~\ref{#1}\xspace}
\newcommand{\tabvref}[1]{Table~\vref{#1}\xspace}
\newcommand{\appref}[1]{Appendix~\ref{#1}\xspace}
\newcommand{\appvref}[1]{Appendix~\vref{#1}\xspace}

% Good pages on LaTeX:
% http://www-h.eng.cam.ac.uk/help/tpl/textprocessing/extending_latex.html

% Define the pieces that go on the title page, abstract, SF298, and
% other pages. This is liberally borrowed from MIT Thesis guide
% 

\pagenumbering{roman}
\def\declassifydate#1{\gdef\@declassifydate{#1}} \gdef\@declassifydate{}
\def\degreedate#1{\date{#1}}
\def\prevdegrees#1{\gdef\@prevdegrees{#1}}
\def\@prevdegrees{}
\def\department#1{\gdef\@department{#1}}
\def\departmentchair#1{\gdef\@departmentchair{#1}}
\def\researchchair#1{\gdef\@researchchair{#1}}

% Provide reasonable defaults
\department{Computer Science}
\departmentchair{Peter Denning}
\researchchair{Karl Van Bibber} % reasonable default

% If you are getting two degrees, use \and between the names.
\def\degree#1{\setbox0\hbox{#1}	 %for side effect of setting \@degreeword
  \gdef\@degree{#1}}

% \and is used inside the \degree argument to separate two degrees
\def\and{\gdef\@degreeword{degrees} \par and \par}
\def\@degreeword{degree}

% Degree appreviation
\def\degreeabbreviation#1{\setbox0\hbox{#1}\gdef\@degreeabbreviation{#1}}

% \rank
\def\rank#1{\setbox0\hbox{#1}
  \gdef\@rank{#1}}
\rank{}                         % default is no rank

% \prevdegrees
\def\prevdegrees#1{\setbox0\hbox{#1}
  \gdef\@prevdegrees{#1}}

% For a second author
\def\authortwo#1{\setbox0\hbox{#1} \gdef\@authortwo{#1}} \authortwo{}
\def\ranktwo#1{\setbox0\hbox{#1} \gdef\@ranktwo{#1}} \ranktwo{}
\def\prevdegreestwo#1{\setbox0\hbox{#1} \gdef\@prevdegreestwo{#1}} \prevdegreestwo{}

%
% Security Banners
%

\def\securitybanner#1{\setbox0\hbox{#1} \gdef\@securitybanner{#1}}
\securitybanner{}               % default is no banner

% \distribution
\def\distribution#1{\setbox0\hbox{#1}
  \gdef\@distribution{#1}}    

% \SponsoringNotation
\def\SponsoringNotation#1{\setbox0\hbox{#1}
  \gdef\@SponsoringNotation{#1}}    

% \SignatureOne
\def\SignatureOne#1{\setbox0\hbox{#1}
  \gdef\@SignatureOne{#1}}    



% \RPTpreparedFor
\def\RPTpreparedFor#1{\setbox0\hbox{#1}
  \gdef\@RPTpreparedFor{#1}}    
\RPTpreparedFor{}               % default is prepared for nobody



% \abstract
\newcommand{\NPSAbstract}{cough}
\def\abstract#1{\setbox0\hbox{#1}
  \gdef\@abstract{#1}\renewcommand{\NPSAbstract}{#1}}

% \thesisadvisor
\def\thesisadvisor#1{\setbox0\hbox{#1}
   \gdef\@thesisadvisor{#1}}

% \co thesisadvisor1
\def\thesisadvisorone#1{\setbox0\hbox{#1}
   \gdef\@thesisadvisorone{#1}}

% \co thesisadvisor2
\def\thesisadvisortwo#1{\setbox0\hbox{#1}
   \gdef\@thesisadvisortwo{#1}}

\def\secondreader#1{\setbox0\hbox{#1}
   \gdef\@secondreader{#1}}

% Support for the Authorindex
% Authorindex
%
\ifnpsauthorindex
  \usepackage[small]{authorindex}
  \let\cite=\aicite
  \renewenvironment{theauthorindex}{%
    \raggedright%
    \setlength{\leftskip}{1em}%
    \setlength{\parindent}{-1em}%
    \setlength{\parskip}{0pt}%
    \def\item[##1]{\par\hspace{0mm}\ainame{##1}}
    \aisize}{\par}
  \aipagetypeorder{n}
  \def\theaipage{\string\hyperpage{\thepage}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Common NPS requirements
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Table of contents control
\def\contentsname{Table of Contents}
\usepackage{tocloft}            % TOC Control
\setlength\cftparskip{2ex}
\ifnpsarticle
\else
  \setlength\cftchapindent{-3pt}
\fi

% This magic makes the word "Figure" appear in each line of the list of figures
\newlength\figurelen             % 
\settowidth\figurelen{Figure}
\addtolength\cftfignumwidth{\figurelen}
\renewcommand\cftfigpresnum{\hspace{-1.5pc}Figure }

% This magic makes the word "Table" appear in each line of the list of tables
\newlength\tablelen             % 
\settowidth\tablelen{Table}
\addtolength\cfttabnumwidth{\tablelen}
\renewcommand\cfttabpresnum{\hspace{-1.5pc}Table }

\ifnpstraditional
%
% Traditional NPS
%
  \typeout{Using traditional NPS thesis design}
  % Traditional numbering scheme
  \def\thepart          {\arabic{part}}
  \def\thechapter       {\Roman{chapter}}
  \def\thesection       {\Alph{section}}
  \def\thesubsection    {\arabic{subsection}}
  \def\thesubsubsection {\alph{subsubsection}}
  \def\theparagraph     {\arabic{paragraph}}
  \def\thesubparagraph  {\roman{subparagraph}}

  % Traditional labels to include punctuation, for toc, etc.
  \def\labelpart          {\thepart.}
  \def\labelchapter       {\thechapter.}
  \def\labelsection       {\thesection.}
  \def\labelsubsection    {\thesubsection.}
  \def\labelsubsubsection {\thesubsubsection.}
  \def\labelparagraph     {(\theparagraph)}
  \def\labelsubparagraph  {(\thesubparagraph)}
  \def\to@appendix{\global\def\ap@pen@dix{OK}% this is a flag, set at first app.
    \setcounter{chapter}{0}%
    \setcounter{section}{0}%
    \def\thechapter       {\Alph{chapter}}%
    \def\thesection       {\arabic{section}}%
    \def\thesubsection    {\alph{subsection}}%
    \def\thesubsubsection {\roman{subsubsection}}%
  }

  % Traditionally lots of things need to be in uppercase and boldL
  \def\contentsname{\textbf{TABLE OF CONTENTS}}
  \def\listfigurename{\textbf{LIST OF FIGURES}}
  \def\listtablename{\textbf{LIST OF TABLES}}
  \def\bibname{\textbf{LIST OF REFERENCES}}
  \def\indexname{\textbf{INDEX\ULABEL}}
  \def\abstractname{ABSTRACT}
  \def\figurename{Figure}
  \def\tablename{Table}
  \def\chaptername{CHAPTER}
  \def\appendixname{APPENDIX}
  \def\partname{PART}
  \def\distribname{INITIAL DISTRIBUTION LIST\ULABEL}

  \fancyhead{}                  % clear all header fields

  % Make traditional figures and tables not reset and not include the figure/table tag
  \usepackage{chngcntr}
  \@removefromreset{figure}{chapter}
  \@removefromreset{table}{chapter}
  \counterwithout{figure}{chapter}
  \counterwithout{table}{chapter}

  % Create all the heads and such
  % This is done with the titlesec package
  \titleformat{\chapter}[display] 
              {\normalfont\Large\filcenter} % {fmt}
              {\thechapter.\ }              % {label}
              {1pc}                         % {sep}
              {\vspace{-1in}\enlargethispage{-0.5in}}    % {before}

  \titleformat{\section}[block] 
              {\normalfont\Large} % {fmt}
              {\thesection.\ }    % {label}
              {1pc}               % {sep}
              {}%

  \titleformat{\subsection}[block] 
              {\normalfont} % {fmt}
              {\hspace{.5in}\thesubsection.\ }    % {label}
              {1pc}               % {sep}
              {}%

  % Control the way counters are printed
  % \renewcommand{\thefigure}{\arabic{figure}}             
  % \newcounter{figure}

  \newcommand{\NPSend}{}             

  % 
  % End Traditional NPS
  %
\else
% New NPS
  \typeout{Using new NPS thesis design}
  \setcounter{tocdepth}{1}	% only put chapters and sections in the TOC

  % These were in the {document}
  % Specify our spacings --- Turns out that we want to do this
  % after the first section is loaded
  % \titlespacing
  \titleformat{\section} {\normalfont\Large\bfseries}{\thesection}{1em}{} 
  \titleformat{\subsection} {\normalfont\large\bfseries}{\thesubsection}{1em}{} 
  \titleformat{\subsubsection} {\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{} 

  % ``The starred version kills the indention of the paragraph following the title.''
  % \titlespacing%{<command>}{<left>}{<beforesep>}{<aftersep>}[<right>]

  \titlespacing*{\chapter}{0pt}{-.5in plus 2ex}{.25in}
  \titlespacing*{\section}{0pt}{0pt plus 2ex}{-2ex plus .2ex} 
  \titlespacing*{\subsection}{0pt}{0pt plus 2ex}{-2ex plus .2ex} 
  \titlespacing*{\subsubsection}{0pt}{0pt plus 2ex}{-2ex plus .2ex} 
  \titlespacing*{\paragraph}{0pt}{0pt plus 2ex}{3pt}
  \setlength{\parskip}{2ex}
  \setlength{\parindent}{0pt}

  % Caption Control:
  % Put captions is a sanserif font, smaller, and tighter
  %
  \captionnamefont{\sffamily\fontsize{9}{10}\selectfont}
  \captiontitlefont{\sffamily\fontsize{9}{10}\selectfont}
  \setlength{\abovecaptionskip}{5pt}
  \setlength{\belowcaptionskip}{0pt}

  %
  % New, avant garde Titles (courtesy of titlesec)
  % 
  \titleformat{\chapter}[display]
              {\vskip 0\p@ \LARGE\filcenter\sffamily\titlerule[1pt]\vspace{1pt}\titlerule}
              {\MakeUppercase{\chaptertitlename} \thechapter:}     % label (not for * chapters)
              {-1pc}  % sep
              {}     % before
              [\titlerule]     % after

  %
  % table of contents
  %

  \ifnpsarticle
    \def\SECTIONBOLDFACE{\bf}
    \def\ARTICLESPACE{-1.0ex}
  \else
    \def\SECTIONBOLDFACE{} 
    \def\ARTICLESPACE{-1.8ex}
  \fi

  \contentsmargin{2.55em}
  \dottedcontents{section}[1.5em]{}{2.3em}{1pc}
  \titlecontents{section}                                 % section
  	        [25pt]                                    % left
	        {\vspace{-1.8ex}}                         % above
	        {\SECTIONBOLDFACE\contentslabel{2.3em}}                   % before with label
	        {\hspace*{-2.3em}}                        % before without label
	        {\titlerule*[1pc]{.}\contentspage}        % filler and page

  \titlecontents{subsection}                              % section
  	        [25pt]                                    % left
	        {\vspace{-1.8ex}}                         % above
	        {\contentslabel{2.3em}}                   % before with label
	        {\hspace*{-2.3em}}                        % before without label
	        {\titlerule*[1pc]{.}\contentspage}        % filler and page

  \newcommand{\NPSend}{
    %\ifnpsauthorindex
    %  \chapter*{Referenced Authors}
      %\addcontentsline{toc}{chapter}{Referenced Authors}
    %  \begin{multicols}{3}
    %    \printauthorindex
     % \end{multicols}
    %\fi
   }

  % Sections will still be capped, but not in bold
  \def\bibname{List of References}
\fi
                

\newcommand{\NPSappendix}{
\clearpage
  \appendix                       % Appendices follow
  \addcontentsline{toc}{chapter}{Appendices}  % Insert ``Appendices''
  \def\chaptername{Appendix}  % not sure why this is needed, but it is
  
}



% handle THIS PAGE INTENTIONALLY LEFT BLANK if in twopage mode
% See http://www.ctan.org/tex-archive/macros/latex/contrib/fancyhdr/fancyhdr.pdf
\newcommand{\thisPageIntentionallyLeftBlank}{
  \ifnpstwoside
    \lhead{}\rhead{}            % remove the headings 
    \vspace*{\fill} 
    \begin{center} 
      THIS PAGE INTENTIONALLY LEFT BLANK 
    \end{center} 
    \vspace*{\fill} 
    \newpage 
  \fi
}


\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else 
 \thispagestyle{fancy}
 \thisPageIntentionallyLeftBlank
 \if@twocolumn\hbox{}\newpage\fi\fi\fi
} 
\def\cleardoublepageEmpty{\clearpage\if@twoside \ifodd\c@page\else 
 \thispagestyle{empty}   
 \thisPageIntentionallyLeftBlank
 \if@twocolumn\hbox{}\newpage\fi\fi\fi
} 

\ifnpstight
  \parskip 3pt
  \parindent 1pc
\fi



%
% Now let's make the cover page
%

\def\NPScover{
  % these commands are the first commands that run when printing
  % starts, because the \NPScover command appears first
  \pagestyle{fancy}
  \rhead{}
  \chead{\textsf{\@securitybanner}}
  \lhead{}
  \renewcommand{\headrulewidth}{0pt}
  \cfoot{\textsf{\@securitybanner} \\ \thepage}
  \renewcommand{\sf@ExtraPages}{2}                        % include for the NPS cover
  %
  % The first page; but note --- it's a title page, so it doesn't use
  % this page style
  %
  \begin{titlepage}
  \vfill
  \textbf{\sf@POReportNumber}   % if not defined, will be blank
  \begin{center}
  \includegraphics{nps_logo_3clr_cymk}
  \textbf{\huge\ifclassified\Large\fi{}\\NAVAL\\POSTGRADUATE\\SCHOOL\\}
  \vspace{2pc}
  \textbf{\large{}MONTEREY, CALIFORNIA\\}
  \vfill
  \ifnpsthesis
    \ifnpsdissertation
      \textbf{\huge DISSERTATION\\} 
    \else
      \textbf{\huge THESIS\\} 
    \fi
    ~
    \vfill
	 \vspace*{\fill}
  \fi  

  % Print the box on the front page
  \framebox[4.5in][c]{
    \begin{minipage}{4.45in}
      \centering
        \textbf{\MakeUppercase{\@title}}\\
        \vspace{1pc}
        by\\
        \vspace{1pc}
        \@author\\
        \iftwoauthors
          \@authortwo\\
        \fi
        \vspace{1pc}
        \@date\\
        \vspace{1pc}
        \ifnpsthesis
          \begin{tabularx}{4.45in}{lXl}
	    \ifnpsdissertation
              Dissertation Supervisor: & & \@thesisadvisor \\ 
	    \else
                \iftwoadvisors
          	  Thesis Co-Advisor: & \hspace{1in} & \@thesisadvisorone \\
          	                                   & \hspace{1in} & \@thesisadvisortwo \\
          	  Second Reader: &  \hspace{1in} & \@secondreader  \\
                \else
          	  Thesis Advisor: & \hspace{1in} & \@thesisadvisor \\
          	  Second Reader: &  \hspace{1in} & \@secondreader  \\
                \fi
	    \fi
          \end{tabularx}
        \fi

    \end{minipage}
  }

  \textbf{\small \@distribution}\\

  \ifnpsthesis
  \@RPTpreparedFor     %used for technical reports funded by a sponsor          
                       % define \RPTpreparedFor in main tex file when needed
  \fi
  \vfill
  \ifclassified 
     \enlargethispage{3pc}
     \vspace{-1pc}
     \begin{tabular}{p{1in}p{4in}p{1in}}
     & \center \textbf{\footnotesize DESTRUCTION NOTICE} & \\
     {\footnotesize Classified by: Multiple Sources. Declassify on \@declassifydate } &
     {\small For classified documents follow the procedure in
     DoD 5220.22m Industrial Security Manual or DoD 5220.1R Information
     Security Program Regulation (Ch. 17 of OPNAVINST 5510.1)} &
     {\footnotesize Copy \_\_\_\_ of \_\_\_\_ copies. This document contains 
     \newcounter{nps@page}{}
         {\@ifundefined{r@TotPages}%
          {{\bf ??}}%
          {\setcounter{nps@page}{\expandafter\@car\r@TotPages\@nil}
           \addtocounter{nps@page}{-\value{TotPages}}
           \addtocounter{nps@page}{\sf@ExtraPages}
           \arabic{nps@page}}}
     pages.}
     \end{tabular}
 \fi
  \end{center}
  \vfill
  \end{titlepage}

  \cleardoublepageEmpty
}

\def\NPSsftne{
  % Fill in items for the SF298
  \pagenumbering{roman}        % because they are weird
  \thispagestyle{empty}         % we will insert it manually
  \Title{\@title}
  \iftwoauthors
    \Author{\@author, \@authortwo}
  \else
    \Author{\@author}
  \fi
  \PerformingOrg{Naval Postgraduate School \\ Monterey, CA 93943}  
  \DistributionStatement{\@distribution}
  \Abstract{\@abstract}
  \MakeRptDocPage
}

% LP -  bring in definitions for the disseratation signature page identifications
\def\comitteechair#1{\gdef\@comitteechair{#1}}
\def\advisorOne#1{\gdef\@advisorOne{#1}}
\def\advisorTwo#1{\gdef\@advisorTwo{#1}}
\def\advisorThree#1{\gdef\@advisorThree{#1}}
\def\advisorFour#1{\gdef\@advisorFour{#1}}
\def\assocprovost#1{\gdef\@assocprovost{#1}}

\def\NPSthesistitle{
  \setcounter{page}{3}          % do not reset to page 1
  \thispagestyle{fancy}
  \begin{center}
    \textbf{\@distribution}

    \vfill
    \textbf{\MakeUppercase{\@title}}

    \vfill
    \@author~\\
    \@rank~\\
    \@prevdegrees\\

    \iftwoauthors
      \vspace{1pc}
      \@authortwo~\\
      \@ranktwo~\\
      \@prevdegreestwo
    \fi

    \vfill
    Submitted in partial fulfillment of the\\
    requirements for the degree of\\
    \vfill
    \textbf{\MakeUppercase{\@degree}}\\
    \vfill
    from the\\
    \vfill
    \textbf{NAVAL POSTGRADUATE SCHOOL}\\
    \textbf{\@date}
  \end{center}

  \ifnpsdissertation 
     \newcommand{\sigspace}{1.5pc}
	  \vspace{\sigspace}
	  \begin{tabular}{p{1in}p{2in}p{0.25in}p{2in}}
	  \cline{2-3}
	    Author: & \@author & &\\
	   \end{tabular}
	   
	  \vspace{\sigspace}
	  \begin{tabular}{p{1in}p{2in}p{0.25in}p{2in}}
	  \cline{2-2}
	  \cline{4-4}
	  Approved by: & \@thesisadvisor		& 	& \@comitteechair \\
	               & Dissertation Advisor	& 	& Dissertation Committee Chair \\
	  \end{tabular}
	  
	  \vspace{\sigspace}
	  \begin{tabular}{p{1in}p{2in}p{0.25in}p{2in}}
	  \cline{2-2}
	  \cline{4-4}
	        & \@advisorOne	& 	& \@advisorTwo\\
	        & Advisor		& 	& Advisor\\
	  \end{tabular}
	  
	  \vspace{\sigspace}
	  \begin{tabular}{p{1in}p{2in}p{0.25in}p{2in}}
	  \cline{2-2}
	  \cline{4-4}
	        & \@advisorThree	& 	& \@advisorFour\\
	        & Advisor		& 	& Advisor\\
	  \end{tabular}
	  
	  \vspace{\sigspace}
	  \begin{tabular}{p{1in}p{2in}p{0.25in}p{1.75in}}
	  \cline{2-4}
	   Approved by: & \@departmentchair  \\
	  	 	& \multicolumn{2}{l}{Chair, \@department} & \\
	  \end{tabular}
	  
	  \vspace{\sigspace}
	  \begin{tabular}{p{1in}p{2in}p{0.25in}p{1.75in}}
	  \cline{2-4}
	  Approved by: & \@assocprovost & &\\
	  	 		& \multicolumn{2}{l}{Associate Provost for Academic Affairs} \\
	  \end{tabular}                                   
  \else  
    \iftwoadvisors
  	  \newcommand{\sigspace}{.4in}

	  \begin{tabbing}
	   \hspace{2.5in}\=\\[\sigspace]       % Set the tabs

	  \iftwoauthors
	  \hspace{.5in} Authors: \> \@author \\[\sigspace]
	           \> \@authortwo\\[\sigspace]
	  \else
	  \hspace{.5in} Author: \> \@author \\[\sigspace]
	  \fi
  
	  \hspace{.5in} Approved by:   \> \@thesisadvisorone \\
	                 \> Thesis Co-Advisor \\[\sigspace]

	                 \> \@thesisadvisortwo \\
	                 \> Thesis Co-Advisor \\[\sigspace]

	                 \> \@secondreader \\
	                 \> Second Reader \\[\sigspace]

	                 \> \@departmentchair \\
	                 \>  Chair, \@department \\
	  \end{tabbing}
\else
  	  \newcommand{\sigspace}{.65in}

	  \begin{tabbing}
	   \hspace{2.5in}\=\\[\sigspace]       % Set the tabs

	  \iftwoauthors
	  \hspace{.5in} Authors: \> \@author \\[\sigspace]
	           \> \@authortwo\\[\sigspace]
	  \else
	  \hspace{.5in} Author: \> \@author \\[\sigspace]
	  \fi
  
	  \hspace{.5in} Approved by:   \> \@thesisadvisor \\
	                 \> Thesis Advisor \\[\sigspace]

	                 \> \@secondreader \\
	                 \> Second Reader \\[\sigspace]

	                 \> \@departmentchair \\
	                 \>  Chair, \@department \\
	  \end{tabbing}
          \fi
  \fi
  \cleardoublepage
}

\newif\ifNPSAbstractWasPrinted\NPSAbstractWasPrintedfalse
\def\NPSabstractpage{
  \begin{center}
  \textbf{{\large ABSTRACT\ULABEL}}\\
  \end{center}
  \begin{minipage}{\textwidth}
  \vspace{2pc}
  \onehalfspacing                 % a really bad idea, but apparently required
  \ifnpstraditional\hspace{.5in}\fi % indent if traditional
  \@abstract
  \end{minipage}
  \singlespacing                % back to single spacing
  \NPSAbstractWasPrintedtrue
  \cleardoublepage
}

\def\NPSfrontmatter{
  \ifnpstraditional
  \else
    \lhead{\nouppercase{\rightmark}} % don't use upper-case headers
    \rhead{\nouppercase{\leftmark}}  % must appear after \pagestyle command
  \fi
  \singlespacing
}

\newcommand{\acknowledgements}[1]{
  \chapter*{Acknowledgements\ULABEL}
  \onehalfspacing
  #1
}

\newcommand{\NPSsignature}{
  \thispagestyle{empty}
  \renewcommand{\sf@ExtraPages}{4}      % include for the NPS cover
  \begin{center}
  \textbf{NAVAL POSTGRADUATE SCHOOL\\Monterey, California 93943-5000}
  \end{center}

  \begin{tabular}{p{2.5in}p{2.5in}}
  Daniel T. Oliver & Leonard A. Ferrari \\
  President        & Executive Vice President and Provost \\
  \\
  \\
  \multicolumn{2}{p{6.25in}}{\@distribution}\\
  \\
  \\
  \\
  \multicolumn{2}{p{6.25in}}{\@SponsoringNotation}\\
  \\
  This report was prepared by:\\
  \\
  \\
  \\
  \\
  \@SignatureOne   & \\[-2pc]
  \rule{2in}{1pt} & \iftwoauthors \rule{2in}{1pt} \fi\\
  \@author        & \@authortwo\\
  \@rank          & \@ranktwo\\
  \\
  \\
  \\
  Reviewed by: & Released by:\\
  \\
  \\
  \\
  \rule{2in}{1pt} & \rule{2in}{1pt}\\
  \@departmentchair        & \@researchchair\\
  \@department             & Vice President and Dean of Research
  \end{tabular}
  \newpage
  \thisPageIntentionallyLeftBlank
}

\newcommand{\NPSbody}{
  \renewcommand{\topfraction}{0.99}
  %\renewcommand{\textfracton}{0.10}
  \renewcommand{\floatpagefraction}{0.99}
  \ifnpssinglespace
     \singlespace
     \ifnpstight
        \titlespacing*{\section}{0pt}{6pt plus 1ex}{0pt}
        \titlespacing*{\subsection}{0pt}{6pt plus 1ex}{0pt}
        \titlespacing*{\subsubsection}{0pt}{6pt plus 1ex}{0pt}
     \fi
  \else
     \onehalfspacing
  \fi
  \cleardoublepage
  \pagenumbering{arabic}

  \ifNPSAbstractWasPrinted
    % do not print the abstract
  \else
    \begin{center}\textbf{\abstractname\ULABEL}\end{center}
    \begin{quotation}
    \@abstract
    \end{quotation}
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Special Commands Sections
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\NPSTableOfContents}{
\ifnpsarticle
  \section*{\contentsname\ULABEL}
\else
  \chapter*{\contentsname\ULABEL}
\fi
  \lhead{}\rhead{}
  \def\contentsname{}           % clear, because it will be in the header
  \thispagestyle{fancy}\tableofcontents\cleardoublepage
}

\newcommand{\NPSListOfFigures}{
  \chapter*{\listfigurename\ULABEL}
  %\addcontentsline{toc}{chapter}{List of Figures}
  \lhead{}\rhead{}
  \def\listfigurename{}
  \thispagestyle{fancy}\listoffigures\cleardoublepage
}

\newcommand{\NPSListOfTables}{
  \lhead{}\rhead{}
  \chapter*{\listtablename\ULABEL}
  %\addcontentsline{toc}{chapter}{List of Tables}
  \def\listtablename{}
  \thispagestyle{fancy}\listoftables\cleardoublepage
}

\newcommand{\NPSListOfAcronyms}[1]{
  \lhead{}\rhead{}
  \chapter*{List of Acronyms and Abbreviations\ULABEL}
  %\addcontentsline{toc}{chapter}{List of Acronyms and Abbreviations}
  \def\listacronymname{List of Acronyms and Abbreviations}
  \thispagestyle{fancy}
  #1
  \cleardoublepage
}

\newcommand{\NPSListOfAcronymsFromFile}[1]{
  \lhead{}\rhead{}
  \chapter*{List of Acronyms and Abbreviations\ULABEL}
  %\addcontentsline{toc}{chapter}{List of Acronyms and Abbreviations}
  \def\listacronymname{List of Acronyms and Abbreviations}
  \thispagestyle{fancy}\input{#1}\cleardoublepage
}

\def\bibname{\textbf{LIST OF REFERENCES\ULABEL}}



%
% Simson Garfinkel's layout routines
% From this PhD Thesis

\newcommand{\minipagegraphic}[2]{
  \begin{minipage}{#1\textwidth}
  \includegraphics[width=\textwidth]{#2}
  \end{minipage}
}

\newcommand{\figref}[1]{Figure~\ref{#1}}


% \sgraphic[optional width=8in]{filename}{caption}
% Then use \figref{filename} to get a reference to the figure
\newcommand{\sgraphic}[3][width=\linewidth]{
  \begin{figure}
  \begin{center}
  \fbox{\includegraphics[#1]{#2}}
  \end{center}
  \caption{#3\label{#2}}
  \end{figure}
}

% \sgraphicb is like sgraphic, but may put it at the bottom of the page
\newcommand{\sgraphicb}[3][width=\linewidth]{
  \begin{figure}
  \begin{center}
  \fbox{\includegraphics[#1]{#2}}
  \end{center}
  \caption{#3\label{#2}}
  \end{figure}
}

% \sgraphicn is like sgraphic, but does not put a box around the graphic
\newcommand{\sgraphicn}[3][width=\textwidth]{
  \begin{figure}
  \begin{center}
  \includegraphics[#1]{#2}
  \end{center}
  \caption{#3\label{#2}}
  \end{figure}
}

% \sgraphico is like sgraphic, but it doesn't create a figure
\newcommand{\sgraphico}[3][width=\textwidth]{
  \begin{center}
  \fbox{\includegraphics[#1]{#2}}
  \end{center}
  \caption{#3\label{#2}}
}

\newcommand{\sgraphicon}[3][width=\textwidth]{
  \begin{center}
  \includegraphics[#1]{#2}
  \end{center}
  \caption{#3\label{#2}}
}


% \twofigures{width1}{image1}{caption1}
%            {width2}{image2}{caption2}

\newcommand{\twofigures}[6]{
  \begin{figure}
    \begin{tabularx}{\textwidth}{p{#1}Xp{#4}}
  \includegraphics[width=#1]{#2} &&
  \includegraphics[width=#4]{#5} \\
  \caption{#3\label{#2}} &&
  \caption{#6\label{#5}} \\
\end{tabularx}
\end{figure}
}

\newcommand{\twoimages}[3]{
  \begin{figure}
  \includegraphics[width=.5\textwidth]{#1} 
  \hspace{1pc}
  \includegraphics[width=.5\textwidth]{#2} 
  \caption{#3\label{#1}}
  \end{figure}
}

\newcommand{\sidebyside}[3][ht]{
  \begin{figure*}[#1]
    \begin{minipage}[t]{.45\columnwidth}
      #2
    \end{minipage}
    \hfill
    \begin{minipage}[t]{.45\columnwidth}
      #3
    \end{minipage}
  \end{figure*}
}

\newcommand{\tsidebyside}[3][ht]{
  \begin{table*}[#1]
    \begin{minipage}[t]{.45\columnwidth}
      #2
    \end{minipage}
    \hfill
    \begin{minipage}[t]{.45\columnwidth}
      #3
    \end{minipage}
  \end{table*}
}

\newcommand{\threesidebyside}[4][ht]{
  \begin{figure*}[#1]
    \begin{minipage}[t]{.31\columnwidth}
      #2
    \end{minipage}
    \hfill
    \begin{minipage}[t]{.31\columnwidth}
      #3
    \end{minipage}
    \hfill
    \begin{minipage}[t]{.31\columnwidth}
      #4
    \end{minipage}
  \end{figure*}
}


\endinput
