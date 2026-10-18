\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{academic-cv}[2026/10/18 Bilingual academic CV]

% Compile with XeLaTeX. Both language versions share this layout.
\newif\ifresumechinese
\DeclareOption{chinese}{\resumechinesetrue}
\DeclareOption{english}{\resumechinesefalse}
\ExecuteOptions{english}
\ProcessOptions\relax
\LoadClass[11pt,a4paper]{article}
\RequirePackage{fix-cm}

\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{academic-cv}{Please compile this template with XeLaTeX}{Select XeLaTeX as the compiler.}
\fi
\RequirePackage{fontspec}
\setmainfont[
  Extension=.otf,
  UprightFont=*-regular,
  BoldFont=*-bold,
  ItalicFont=*-italic,
  BoldItalicFont=*-bolditalic
]{texgyretermes}

\ifresumechinese
  \RequirePackage{xeCJK}
  % Fandol Kai is distributed with TeX Live and MiKTeX.
  \setCJKmainfont[
    BoldFont=FandolKai-Regular.otf,
    BoldFeatures={FakeBold=2},
    ItalicFont=FandolKai-Regular.otf
  ]{FandolKai-Regular.otf}
  \newCJKfontfamily\resumesectionfont[
    BoldFont=FandolHei-Bold.otf
  ]{FandolHei-Regular.otf}
\fi

\RequirePackage[left=9mm,right=9mm,top=4mm,bottom=9mm,noheadfoot]{geometry}
\RequirePackage{graphicx}
\RequirePackage{array,tabularx}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{needspace}
\RequirePackage[hidelinks,unicode]{hyperref}
\urlstyle{same}

\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlength{\tabcolsep}{0pt}
\setlength{\emergencystretch}{1em}

\ifresumechinese
  \renewcommand{\normalsize}{\@setfontsize\normalsize{13}{17.8}}
\else
  \renewcommand{\normalsize}{\@setfontsize\normalsize{10.5}{12.7}}
\fi
\normalsize

\setlist[itemize]{
  label=\textbullet,
  align=left,
  labelwidth=1em,
  leftmargin=1.55em,
  labelsep=.55em,
  topsep=1pt,
  itemsep=1pt,
  parsep=0pt,
  partopsep=0pt
}

% The rule tracks the text width, including after a margin change.
\titleformat{\section}
  {\fontsize{14}{17}\selectfont\bfseries\ifresumechinese\resumesectionfont\fi\raggedright}
  {}{0pt}{}
  [{\vspace{1pt}\titlerule[1.15pt]}]
\titlespacing*{\section}{0pt}{11pt}{5pt}

\titleformat{\subsection}
  {\fontsize{13}{16}\selectfont\bfseries\ifresumechinese\resumesectionfont\fi\raggedright}
  {}{0pt}{}
\titlespacing*{\subsection}{0pt}{9pt}{4pt}

% Highlight your own name in publication lists; keep the actual author order.
\newcommand{\cvname}[1]{\underline{\textbf{#1}}}
\newcommand{\resumeentrysep}{\par\vspace{6pt}}

% Vector icons share a square canvas and scale with the surrounding text.
% Keep a readable label beside each icon; wrap both in \href when appropriate.
\newcommand{\resumeicon}[1]{%
  \raisebox{-.13em}{\includegraphics[width=1em]{assets/#1.pdf}}\hspace{.18em}}
\newcommand{\resumeemailicon}{\resumeicon{email}}
\newcommand{\resumephoneicon}{\resumeicon{phone}}
\newcommand{\resumelocationicon}{\resumeicon{location}}
\newcommand{\resumegithubicon}{\resumeicon{github}}
\newcommand{\resumehomepageicon}{\resumeicon{homepage}}
\newcommand{\resumewebicon}{\resumeicon{web}}
\newcommand{\resumescholaricon}{\resumeicon{google-scholar}}

% Applicant's institution logo: replace the placeholder or hide it.
\newif\ifresumelogovisible
\resumelogovisibletrue
\newcommand*{\resumelogopath}{}
\newcommand{\setresumelogo}[1]{%
  \renewcommand*{\resumelogopath}{#1}\resumelogovisibletrue}
\newcommand{\hideresumelogo}{\resumelogovisiblefalse}
\newcommand{\resumelogo}{%
  \ifresumelogovisible
    \ifx\resumelogopath\@empty
      \begingroup
      \setlength{\fboxsep}{0pt}%
      \setlength{\fboxrule}{.35pt}%
      \fbox{\parbox[c][\dimexpr22mm-2\fboxrule\relax][c]
        {\dimexpr22mm-2\fboxrule\relax}{\centering
        {\fontsize{9}{12}\selectfont
        \ifresumechinese 院校校徽\else UNIVERSITY\\LOGO\fi}}}%
      \endgroup
    \else
      \includegraphics[width=22mm,height=22mm,keepaspectratio]{\resumelogopath}%
    \fi
  \fi
}

% Photo: leave unset for a placeholder, or use \setresumephoto{photo.jpg}.
\newcommand*{\resumephotopath}{}
\newcommand{\setresumephoto}[1]{\renewcommand*{\resumephotopath}{#1}}
\newcommand{\resumephoto}{%
  \ifx\resumephotopath\@empty
    \begingroup
    \setlength{\fboxsep}{0pt}%
    \setlength{\fboxrule}{.35pt}%
    \fbox{\parbox[c][\dimexpr30mm-2\fboxrule\relax][c]
      {\dimexpr25mm-2\fboxrule\relax}{\centering
      \ifresumechinese 个人照片\else PHOTO\fi\\[4pt]
      {\fontsize{8}{10}\selectfont25 \texttimes\ 30 mm}}}%
    \endgroup
  \else
    \includegraphics[width=25mm,height=30mm,keepaspectratio]{\resumephotopath}%
  \fi
}

\newcommand{\resumeheader}[3]{%
  \noindent
  \begin{minipage}[c][30mm][t]{25mm}
    \vspace*{5mm}%
    \makebox[\linewidth][l]{\resumelogo}
  \end{minipage}\hspace{5mm}%
  \begin{minipage}[c][30mm][b]{\dimexpr\linewidth-60mm\relax}
    \centering
    {\fontsize{20}{24}\selectfont\bfseries #1\par}
    \vspace{8pt}
    #2\par
    \vspace{3pt}
    #3\par
    \vspace*{2mm}%
  \end{minipage}\hspace{5mm}%
  \begin{minipage}[c][30mm][c]{25mm}
    \centering\resumephoto
  \end{minipage}\par
  \vspace{-8pt}
}

\newlength{\resumedatewidth}
\ifresumechinese
  \setlength{\resumedatewidth}{34mm}
\else
  \setlength{\resumedatewidth}{36mm}
\fi

% Long titles wrap in their own column, leaving the dates aligned at right.
\newcommand{\datedentry}[2]{%
  \par\Needspace{3\baselineskip}%
  {\bfseries
  \begin{tabularx}{\linewidth}{@{}>{\raggedright\arraybackslash}X
    >{\raggedleft\arraybackslash}p{\resumedatewidth}@{}}
    #1\hspace{3pt} & #2
  \end{tabularx}}\par\nobreak
}

% Organization, department/role and dates share one row. Long names can wrap.
\newlength{\resumeorgwidth}
\newcommand{\internshipentry}[3]{%
  \par\Needspace{3\baselineskip}%
  {\ifresumechinese\fontsize{14}{18}\else\fontsize{11.5}{14}\fi\selectfont\bfseries
  \setlength{\resumedatewidth}{36mm}%
  \settowidth{\resumeorgwidth}{#1}%
  \ifdim\resumeorgwidth>.42\linewidth
    \setlength{\resumeorgwidth}{.42\linewidth}%
  \fi
  \begin{tabularx}{\linewidth}{@{}
    >{\raggedright\arraybackslash}p{\resumeorgwidth}@{\hspace{4mm}}
    >{\raggedright\arraybackslash}X@{\hspace{4mm}}
    >{\raggedleft\arraybackslash}p{\resumedatewidth}@{}}
    #1 & #2 & #3
  \end{tabularx}}\par\nobreak
}

\newcommand{\educationentry}[4]{%
  \par\Needspace{4\baselineskip}%
  \ifresumechinese
    {\bfseries
    \begin{tabularx}{\linewidth}{@{}
      >{\raggedright\arraybackslash}p{.36\linewidth}@{\hspace{4mm}}
      >{\raggedright\arraybackslash}p{.30\linewidth}@{\hspace{4mm}}
      >{\raggedright\arraybackslash}X
      >{\raggedleft\arraybackslash}p{\resumedatewidth}@{}}
      #1 & #2 & #3 & #4
    \end{tabularx}}\par\nobreak
  \else
    \datedentry{#1}{#4}%
    #3\ in #2\par\nobreak
  \fi
}

\newcommand{\resumepair}[2]{%
  \noindent\begin{tabularx}{\linewidth}{@{}
    >{\raggedright\arraybackslash}p{.40\linewidth}
    >{\raggedright\arraybackslash}X@{}}
    \makebox[1em][l]{\textbullet}\hspace{.55em}#1 & #2
  \end{tabularx}\par
}

\newcommand{\resumesubtitle}[2]{%
  \par\nobreak
  {\bfseries
  \begin{tabularx}{\linewidth}{@{}>{\raggedright\arraybackslash}X
    >{\raggedleft\arraybackslash}p{.39\linewidth}@{}}
    #1 & #2
  \end{tabularx}}\par\nobreak
}

\endinput
