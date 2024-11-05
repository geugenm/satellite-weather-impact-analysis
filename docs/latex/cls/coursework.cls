% coursework.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coursework}[2023/10/26 Report Class]

% According to https://elib.bsu.by/bitstream/123456789/206988/1/Подготовка%20курсовых%20работ.pdf
% More official source - https://bsu.by/upload/Об%20утверждении%20Положения%20об%20организации%20подготовки%20и%20защиты%20курсовой%20работы,%20итоговой%20аттестации.pdf

\LoadClass[14pt, a4paper]{extreport}

%-------------------------------------------------------------------------------
%    Язык и кодировка
%-------------------------------------------------------------------------------
\RequirePackage[main=russian, english]{babel}

%-------------------------------------------------------------------------------
%    Шрифты и типографика
%-------------------------------------------------------------------------------
% Use for lacal usage to find fonts
\babelfont{rm}
[Path=../fonts/,
UprightFont=timesnrcyrmt-regular,
BoldFont=timesnrcyrmt-bold,
ItalicFont=timesnrcyrmt-italic,
BoldItalicFont=timesnrcyrmt-bold-italic,
Extension=.ttf
]{times_new_roman}

%-------------------------------------------------------------------------------
%    Основные пакеты
%-------------------------------------------------------------------------------
\RequirePackage{graphicx}
\RequirePackage[a4paper, margin=2cm, right=2cm, includefoot]{geometry} % Поля: левое 35мм, правое 10мм, верхнее и нижнее 20мм
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{subfig}
\RequirePackage{hyperref}
\RequirePackage{authblk}
\RequirePackage{amsmath}
\RequirePackage{listings}
\RequirePackage{textcomp}
\RequirePackage{microtype}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
% \RequirePackage{texdoc} % Для документации в IDE

\pagenumbering{arabic}


%-------------------------------------------------------------------------------
%    Настройка списков
%-------------------------------------------------------------------------------
\setlist[itemize]{noitemsep, topsep=0pt, partopsep=0pt, parsep=0pt}

%-------------------------------------------------------------------------------
%    Настройка заголовков
%-------------------------------------------------------------------------------
\titleformat{\chapter}[display]
{\normalfont\bfseries\huge}
{\chaptertitlename\ \thechapter}{20pt}{\Huge}
\titlespacing*{\chapter}{0pt}{-30pt}{40pt}

\titleformat{\section}
  {\normalfont\bfseries\Large}
  {\thesection}
  {1em}
  {}

\titleformat{\subsection}
  {\normalfont\bfseries\large}
  {\thesubsection}
  {1em}
  {}

\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\arabic{section}.\ #1}}

\titleformat{\chapter}[display]
    {\normalfont\large\bfseries\centering}
    {\chaptertitlename\ \thechapter}{0pt}{\large \centering}
\titlespacing*{\chapter}{0pt}{0pt}{15pt}

\titleformat{\section}[hang]
{\normalfont\Large\bfseries}
{\hspace*{1cm} \thesection}
{1em}
{\raggedright}
\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

\titleformat{\subsection}[hang]
{\normalfont\bfseries}
{\hspace*{1cm} \thesubsection}
{1em}
{\raggedright}
\titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}


\titleformat{\subsubsection}[hang]
{\normalfont\bfseries}
{\hspace*{1cm} \thesubsubsection}
{1em}
{\raggedright}
\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

\newcommand{\nonPrefixChapter}[1]{
  \titleformat{\chapter}[display]
    {\normalfont\large\bfseries\centering}
    {}{0pt}{\large \centering}
  \titlespacing*{\chapter}{-40pt}{-50pt}{15pt}

  \chapter{#1}

  \titleformat{\chapter}[display]
    {\normalfont\large\bfseries\centering}
    {\chaptertitlename\ \thechapter}{0pt}{\large \centering}
  \titlespacing*{\chapter}{-40pt}{-50pt}{15pt}
}

%-------------------------------------------------------------------------------
%    Настройка таблиц
%-------------------------------------------------------------------------------
\usepackage{array}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Table captions
\addto\captionsrussian{\renewcommand{\tablename}{Таблица}}

%-------------------------------------------------------------------------------
%    Настройка листингов кода
%-------------------------------------------------------------------------------
\lstdefinestyle{bwstyle}{
    commentstyle=\itshape,
    keywordstyle=\bfseries,
    stringstyle=\ttfamily,
    basicstyle=\ttfamily\footnotesize,
    numbers=left,
    numberstyle=\tiny,
    stepnumber=1,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=4,
    breaklines=true,
    breakatwhitespace=false,
    captionpos=b
}

\lstset{style=bwstyle, language=C++}
\lstset{style=bwstyle, language=python}

%-------------------------------------------------------------------------------
%    Настройка ссылок и сносок
%-------------------------------------------------------------------------------
\hypersetup{
    colorlinks=false,
}

\renewcommand{\thefootnote}{\arabic{footnote}} % Арабские цифры для сносок

%-------------------------------------------------------------------------------
%    Настройка межстрочного интервала
%-------------------------------------------------------------------------------
\onehalfspacing
\setlength{\parindent}{1.25cm} % Абзацный отступ 1.25 см
\linespread{1.5} % Межстрочный интервал 1.5

% Figure captions
\addto\captionsrussian{\renewcommand{\figurename}{Рисунок}}

\renewcommand{\@makecaption}[2]{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1 \textemdash\ #2}%
  \ifdim\wd\@tempboxa >\hsize
    #1 \textemdash\ #2\par
  \else
    \global\@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\renewcommand{\thefigure}{\@arabic\c@figure}

\newcommand{\mytitlepage}{
    \begin{titlepage}
        \begin{center}
            \textbf{МИНИСТЕРСТВО ОБРАЗОВАНИЯ РЕСПУБЛИКИ БЕЛАРУСЬ БЕЛОРУССКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ ФАКУЛЬТЕТ РАДИОФИЗИКИ И КОМПЬЮТЕРНЫХ ТЕХНОЛОГИЙ
            } \\
            Кафедра физики и аэрокосмических технологий
        \end{center}

        \vspace{2cm}

        \begin{center}
            \textbf{\thetitle}
        \end{center}

        \begin{center}
            {Курсовая работа}
        \end{center}

        \vspace{3cm}

        \hfill
        \parbox{17em}{
            Глеба Евгения Михайловича \newline
            обучающегося 4 курса специальности \newline
            «Аэрокосмические радиоэлектронные и информационные системы и технологии»

            \vspace{0.5cm}

            Научный руководитель: \newline
            Баранова Василина Сергеевна
        }

        \vspace{5cm}

        \begin{center}
            Минск, \the\year
        \end{center}

    \end{titlepage}
}

\AtBeginDocument{
    \setlength{\headheight}{14.0pt}
    \mytitlepage
    \addtocontents{toc}{\protect\thispagestyle{empty}}
    \tableofcontents
    \thispagestyle{empty} % temp solution, fix it later
    \newpage
}

\endinput
