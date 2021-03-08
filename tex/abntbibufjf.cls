%% abntbibufjf.cls, v-1.0 JB-LP-LA
%% 
  %% Copyright 2014 Jos\'e Barbosa (ICE-UFJF), Larissa Pinheiro (CDC-UFJF), L\'ivia Alonso (CDC-UFJF).
  %
  % This work may be distributed and/or modified under the
  % conditions of the LaTeX Project Public License, either 
  % version 1.3 of this license or (at your option) any later 
  % version. The latest version of this license is in
  %       http://www.latex-project.org/lppl.txt
  % and version 1.3 or later is part of all distributions of LaTeX
  % version 2005/12/01 or later.
  %
  % This work has the LPPL maintenance status `maintained'.
  % 
  % The Current Maintainer of this work is Jos\'e Barbosa (ICE-UFJF).
  %
  % This work consists of the files abntbibufjf.cls.
% 
% 
% 
%  
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
%%Os acentos foram desprezados neste arquivo.
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abntbibufjf}[2014/07/23 v 1.0]


\RequirePackage{ifthen}

\providecommand{\AUisarticle}{false}
\DeclareOption{article}{
	\renewcommand{\AUisarticle}{true}
	\PassOptionsToClass{article}{memoir}%}
}
\providecommand{\AUistwocolumn}{false}
\DeclareOption{twocolumn}{
	\renewcommand{\AUistwocolumn}{true}
	\PassOptionsToClass{twocolumn}{memoir}%}
}
%
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{memoir}%
}
\ProcessOptions\relax
\LoadClass{memoir}

% ------------------------------------------------------------------------

\newcommand{\ifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}} 

\RequirePackage[hypertexnames=false, hidelinks]{hyperref}    
\pdfstringdefDisableCommands{\def\\{, }\def\and{; }}

\RequirePackage{bookmark}   			

\RequirePackage[brazil]{babel}

\RequirePackage{enumitem}

\RequirePackage{calc}
%
\newcommand{\folhaderostoname}{Folha de rosto}
\newcommand{\epigraphname}{Ep\'igrafe}
\newcommand{\dedicatorianame}{Dedicat\'oria}
\newcommand{\errataname}{\bfseries ERRATA}
\newcommand{\agradecimentosname}{\bfseries AGRADECIMENTOS}
\newcommand{\anexoname}{\bfseries ANEXO}
\newcommand{\anexosname}{Anexos}
\newcommand{\apendicename}{\bfseries AP\^ENDICE}
\newcommand{\apendicesname}{Ap\^endices}
\newcommand{\orientadorname}{Orientador:}
\newcommand{\coorientadorname}{Coorientador:}
\newcommand{\folhadeaprovacaoname}{\bfseries FOLHA DE APROVA\c{C}\~AO}
\newcommand{\resumoname}{RESUMO} 
\newcommand{\listadesiglasname}{\bfseries LISTA DE ABREVIATURAS E SIGLAS}
\newcommand{\listadesimbolosname}{\bfseries LISTA DE S\'IMBOLOS}
\newcommand{\fontename}{Fonte}
\newcommand{\notaname}{Nota}
%% --
\addto\captionsbrazil{% 
  \renewcommand{\contentsname}{\bfseries SUM\'ARIO} %%
  \renewcommand{\bibname}{\bfseries REFER\^ENCIAS}
  \renewcommand{\indexname}{\bfseries \'INDICE}
  \renewcommand{\listfigurename}{\bfseries LISTA DE ILUSTRA\c{C}\~{O}ES}
  \renewcommand{\listtablename}{\bfseries LISTA DE TABELAS}
}

%% --
\def\au@classname{abntbibufjf} 
\newcommand{\param}[1]{%
  \expandafter\newif\csname if#1\endcsname   
  \IfFileExists{#1}{\input{#1}}{}%
}

\newif\if@eu@ilhookcalled\@eu@ilhookcalledfalse
\newif\if@eu@hasil\@eu@hasilfalse

\def\au@eu@ilaux{\global\@eu@hasiltrue}
\def\au@eu@ilhook{%
  \if@eu@ilhookcalled\else
    \global\@eu@ilhookcalledtrue
    \global\@eu@hasiltrue
    \immediate\write\@auxout{%
      \string\au@eu@ilaux{}^^J
    }%
    \typeout{* \au@classname: Ilustrado.}%
  \fi
}
\newcommand{\auaddilcmd}[1]{%
  \begingroup
  \let\au@temp#1
  \expandafter\gdef\expandafter#1\expandafter{%
    \expandafter\au@eu@ilhook\au@temp}%
  \endgroup
}
\newcommand{\auaddilenv}[1]{%
  \begingroup
  \expandafter\auaddilcmd\expandafter{\csname#1\endcsname}%
  \endgroup
}
\AtBeginDocument{\auaddilenv{figure}}

% ------------------------------------------------------------------------

\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout

\OnehalfSpacing

\newcommand{\fontereduzida}{\small}
% ------------------------------------------------------------------------

\newcommand{\chapterfont}{\rmfamily} 
\newcommand{\chapterfontsize}{\normalsize}

\newcommand{\partfont}{\chapterfont}
\newcommand{\partfontsize}{\chapterfontsize}

\newcommand{\sectionfont}{\chapterfont}
\newcommand{\sectionfontsize}{\normalsize}

\newcommand{\subsectionfont}{\sectionfont}
\newcommand{\subsectionfontsize}{\normalsize}

\newcommand{\subsubsectionfont}{\subsectionfont}
\newcommand{\subsubsectionfontsize}{\normalsize}

\newcommand{\subsubsubsectionfont}{\subsectionfont}
\newcommand{\subsubsubsectionfontsize}{\normalsize}

% ------------------------------------------------------------------------

\newcounter{bookmarkcounter} 
\setcounter{bookmarkcounter}{0}
\newcommand{\PRIVATEbookmarkthis}[1]{%
  \addtocounter{bookmarkcounter}{1}%
  \phantomsection\pdfbookmark[0]{#1}{chapterb\arabic{bookmarkcounter}}
}

\newcommand{\pretextualchapter}[1]{%
  \addtocounter{bookmarkcounter}{1}%
  \PRIVATEbookmarkthis{#1}%
  \chapter*[#1]{#1}%
  }
\provideboolean{apendiceousecao}      
\setboolean{apendiceousecao}{false}

\newcommand{\PRIVATEclearpageifneeded}{%
  \ifthenelse{\equal{\AUisarticle}{true}}{%
    %
  }{ % else
    \cleardoublepage%
  }
}  

% ------------------------------------------------------------------------

\makeatletter
\renewcommand\@makefntext[1]{\hangindent=1.2em\leftskip=0.4em\hskip-0.4em\@makefnmark\hskip1.2em\relax#1}
\makeatother
\renewcommand{\foottextfont}{\fontereduzida}

\let\oldFootnote\footnote
\newcommand\nextToken\relax
\renewcommand\footnote[1]{%
    \oldFootnote{#1}\futurelet\nextToken\isFootnote}
\newcommand\isFootnote{%
    \ifx\footnote\nextToken\textsuperscript{,}\fi}

\ifthenelse{\equal{\AUisarticle}{true}}{%
  \counterwithout{section}{chapter}
  \counterwithout{figure}{section}
  \counterwithout{table}{section}
}{%else
  \counterwithout{figure}{chapter}
  \counterwithout{table}{chapter}
}

\hangcaption
\captiondelim{~\textendash ~} 
\captionnamefont{\fontereduzida}
\captiontitlefont{\fontereduzida}

\newcommand{\configureseparator}{\captiondelim{: }}

\makeatletter
\newcommand{\fonte}[2][\fontename]{%
  \M@gettitle{#2}%
  \memlegendinfo{#2}%
  \par
  \begingroup
     \@parboxrestore
     \if@minipage
       \@setminipage
     \fi
     \fontereduzida
     \configureseparator
     \@makecaption{\fontereduzida #1}{\ignorespaces\fontereduzida #2}\par
  \endgroup}
\makeatother


\makeatletter
\newcommand{\nota}[2][\notaname]{\fonte[#1]{#2}}
\makeatother


\AtEndPackage{caption}{
  \AtBeginDocument{%
    \DeclareCaptionLabelSeparator{barr}{~\textendash ~}
    \DeclareCaptionFont{fontereduzida}{\fontereduzida}
      \captionsetup{format=hang,
                    labelseparator=barr,
                    }
      \renewcommand{\configurecaptions}{%
                  \captionsetup{justification=justified,%
                                singlelinecheck=false}}
      \renewcommand{\configureseparator}{\captionsetup{labelsep=colon}}
  }
}

% ------------------------------------------------------------------------

\setsecnumdepth{paragraph}
\settocdepth{paragraph}
\setcounter{tocdepth}{5}
\setcounter{secnumdepth}{5}
\maxsecnumdepth{paragraph}

\newcommand{\subsubsubsection}{\paragraph}
\newcommand{\cftbeforesubsubsubsectionskip}{\cftbeforeparagraphskip}
\newcommand{\cftsubsubsubsectionfont}{\cftparagraphfont}
\newcommand{\setsubsubsubsecheadstyle}{\setparaheadstyle}

\setafterparaskip{1.0\onelineskip plus 0.5\onelineskip minus 0.2\onelineskip}
\setparaheadstyle{\normalfont\rmfamily\raggedright} 

\renewcommand{\cftfigurename}{\figurename\space} 
\renewcommand*{\cftfigureaftersnum}{\hfill \textendash \hfill}
 
\renewcommand{\cfttablename}{\tablename\space}
\renewcommand*{\cfttableaftersnum}{\hfill \textendash \hfill}	
 
\renewcommand{\tocheadstart}{\chapterfont}

\renewcommand*{\cftchapterdotsep}{\cftdotsep}

\setlength{\cftbeforechapterskip}{0pt plus 0pt}
\renewcommand*{\insertchapterspace}{}

\cftinsertcode{A}{}

\newlength{\cftlastnumwidth}
\setlength{\cftlastnumwidth}{\cftsubsubsectionnumwidth+1em}

\newcommand{\tocprintchapter}{}
\newcommand{\tocinnonumchapter}{}
\newcommand{\tocprintchapternonum}{}
\newcommand{\tocpartapendices}{}
\newcommand{\tocpartanexos}{}

  \cftinsertcode{A}{\renewcommand{\cftchapteraftersnum}{\hfill \textendash \hfill}}
  
  \cftsetindents{part}{0em}{\cftlastnumwidth}
  \cftsetindents{chapter}{0em}{\cftlastnumwidth}
  \cftsetindents{section}{0em}{\cftlastnumwidth}
  \cftsetindents{subsection}{0em}{\cftlastnumwidth}
  \cftsetindents{subsubsection}{0em}{\cftlastnumwidth}
  \cftsetindents{paragraph}{0em}{\cftlastnumwidth}
  \cftsetindents{subparagraph}{0em}{\cftlastnumwidth}
  
  \renewcommand{\tocprintchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{0em}{\cftlastnumwidth}}}
  
  \renewcommand{\tocinnonumchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}%
    \cftinserthook{toc}{A}}
  
  \renewcommand{\tocprintchapternonum}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}}
  
  \renewcommand{\tocpartapendices}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
    \cftinserthook{toc}{A}}
  
  \renewcommand{\tocpartanexos}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
    \cftinserthook{toc}{A}}
  
  \setlength{\cftbeforechapterskip}{1em}

\newcommand{\phantompart}{%
  \bookmarksetup{startatroot}
  \phantomsection
    \addtocontents{toc}{\vspace{\cftbeforepartskip}}}{%
    \addtocontents{toc}{\vspace{\cftbeforepartskip}}}%

% ------------------------------------------------------------------------

\provideboolean{innonumchapter}  
\setboolean{innonumchapter}{true}
\makechapterstyle{abnt}{%
  \renewcommand{\chapterheadstart}{} 

  \ifx \chapternamenumlength \undefined
    \newlength{\chapternamenumlength}
  \fi

  \ifthenelse{\equal{\AUisarticle}{true}}{%
     \setlength\beforechapskip{\baselineskip}
     \renewcommand{\chaptitlefont}{\sectionfont\sectionfontsize}
   }{%else
     \setlength{\beforechapskip}{0pt}
     \renewcommand{\chaptitlefont}{\chapterfont\chapterfontsize}
   }
  
  \renewcommand{\chapnumfont}{\chaptitlefont}
  \renewcommand{\parttitlefont}{\partfont\partfontsize}
  \renewcommand{\partnumfont}{\partfont\partfontsize}
  \renewcommand{\partnamefont}{\partfont\partfontsize}
  
  
  \setsecheadstyle{\sectionfont\sectionfontsize
  }
  \setsubsecheadstyle{\subsectionfont\subsectionfontsize
  }
  \setsubsubsecheadstyle{\subsubsectionfont\subsubsectionfontsize
  }
  \setsubsubsubsecheadstyle{\subsubsubsectionfont\subsubsubsectionfontsize
  }
  
  \renewcommand{\chapternamenum}{}
  
  \renewcommand{\printchaptername}{%
   \chaptitlefont
   \ifthenelse{\boolean{apendiceousecao}}{\appendixname}{}%
  }
    
  \def\printchaptertitle##1{%
    \chaptitlefont%
    \ifthenelse{\boolean{innonumchapter}}{\centering
    {##1}}{%
    % else  
      \ifthenelse{\boolean{apendiceousecao}}{\centering%
        \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
        {##1}%
      }{%
        \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
        \parbox[t]{\columnwidth-\chapternamenumlength}{%
        {##1}}}%
    }    
  }
       
  \renewcommand{\printchapternum}{%
     \tocprintchapter
     \setboolean{innonumchapter}{false}
     \bfseries %%
     \chapnumfont%
     \space\thechapter\space%
     \ifthenelse{\boolean{apendiceousecao}}{%
       \tocinnonumchapter
       \space--\space%
     }{} % else
  }
  \renewcommand{\afterchapternum}{}
  
  \renewcommand\printchapternonum{%
     \tocprintchapternonum
     \setboolean{innonumchapter}{true}%
    }
}
\chapterstyle{abnt}

\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\fontereduzida\thepage}{}{\fontereduzida\textit\leftmark}
\makeoddhead{abntheadings}{\fontereduzida\textit\rightmark}{}{\fontereduzida\thepage}
\makeheadrule{abntheadings}{\textwidth}{\normalrulethickness}

\makepagestyle{abntchapfirst}
\makeoddhead{abntchapfirst}{}{}{\fontereduzida\thepage}

% ------------------------------------------------------------------------

\newcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\renewcommand{\frontmatter}{\pretextual} 

\AtBeginDocument{\pretextual}

% ------------------------------------------------------------------------

\newcommand{\titulo}[1]{\title{#1}}
\newcommand{\inseretitulo}{\thetitle}

\newcommand{\autor}[1]{\author{#1}}
\newcommand{\insereautor}{\theauthor}

\let\olddate\date
\renewcommand{\date}[1]{\AtBeginDocument{\olddate{#1}}}
\newcommand{\data}[1]{\date{#1}}
\newcommand{\inseredata}{\thedate}

\providecommand{\insereinstituicao}{}
\newcommand{\instituicao}[1]{\renewcommand{\insereinstituicao}{#1}}

\providecommand{\inserefaculdade}{}
\newcommand{\faculdade}[1]{\renewcommand{\inserefaculdade}{#1}}

\providecommand{\inserelocal}{}
\newcommand{\local}[1]{\renewcommand{\inserelocal}{#1}}

\providecommand{\inserenatureza}{}
\newcommand{\natureza}[1]{\renewcommand{\inserenatureza}{#1}}

\providecommand{\insereobjeto}{}
\newcommand{\objeto}[1]{\renewcommand{\insereobjeto}{#1}}

\providecommand{\insereprograma}{}
\newcommand{\programa}[1]{\renewcommand{\insereprograma}{#1}}

\providecommand{\inseresubtitulo}{}
\newcommand{\subtitulo}[1]{\renewcommand{\inseresubtitulo}{#1}}

\providecommand{\inserefinalcatalog}{}
\newcommand{\finalcatalog}[1]{\renewcommand{\inserefinalcatalog}{#1}}

\providecommand{\insereautorR}{}
\newcommand{\autorR}[1]{\renewcommand{\insereautorR}{#1}}

\providecommand{\insereorientadorRotulo}{}
\providecommand{\insereorientador}{}
\newcommand{\orientador}[2][\orientadorname]%
  {\renewcommand{\insereorientadorRotulo}{#1}%
   \renewcommand{\insereorientador}{#2}}

\providecommand{\inserecoorientadorRotulo}{}
\providecommand{\inserecoorientador}{}
\newcommand{\coorientador}[2][\coorientadorname]%
  {\renewcommand{\inserecoorientadorRotulo}{#1}%
   \renewcommand{\inserecoorientador}{#2}}

% ------------------------------------------------------------------------

\newenvironment{capa}{\begin{titlingpage}}{\end{titlingpage}\cleardoublepage}

\newcommand{\inserecapa}{%
  \begin{capa}%
   \begin{center}
    {\chapterfont \insereinstituicao \par \inserefaculdade \par \insereprograma} 
    \vfill
    {\chapterfont \bfseries\insereautor}
    \vfill
    \chapterfont{\bfseries\inseretitulo \inseresubtitulo}
    \vfill
    \inserelocal \par \inseredata 
   \end{center}
   \end{capa}
}

\newenvironment{folhaderosto}[1][\folhaderostoname]{\clearpage\PRIVATEbookmarkthis{#1}}{\newpage}%

%% --
\makeatletter
\newcommand{\folhaderostocontent}{
  \begin{center}
    {\chapterfont \bfseries \insereautor} 
    \vspace*{\fill}
    \begin{center}
      {\chapterfont \bfseries \inseretitulo \inseresubtitulo}
    \end{center}
    \vspace*{\fill}
      \ifnotempty{\inserenatureza}{%
      \hspace{.45\textwidth}
      \begin{minipage}{.5\textwidth}
      	\SingleSpacing
         \inserenatureza
      \end{minipage}
       \vspace*{\fill}
    }
  \end{center} 
   {\insereorientadorRotulo~\insereorientador \par }
    \ifnotempty{\inserecoorientador}{%
       {\inserecoorientadorRotulo~\inserecoorientador}
    }
    \vfill
  \begin{center}  
    \inserelocal \par \inseredata   
  \end{center}
}
\makeatother
%% --

\newcommand{\inserefolhaderosto}[1]{%
  \begin{folhaderosto}{#1}
     \folhaderostocontent
  \end{folhaderosto}}


%% --
\makeatletter
\newcommand{\inserecatalog}{
\thispagestyle{empty}
\addtocounter{page}{-1}
{
\vspace*{15cm}
\begin{center}
\begin{minipage}[c]{13cm}
\begin{center}
Ficha catalogr\'afica elaborada atrav\'es do Modelo Latex do CDC da UFJF com os dados fornecidos pelo(a) autor(a)
\end{center}
\end{minipage}

\fbox{\hspace*{0.3cm} \begin{minipage}[c]{12.5cm} \SingleSpacing \fontereduzida
  \insereautorR . \par
  \hspace*{0.45cm} \inseretitulo ~\inseresubtitulo ~/ \insereautor. \textendash ~\inseredata .\par
  \hspace*{0.5cm} \pageref{LastPage} f. \if@eu@hasil : il.~\fi \\[12pt]
  \hspace*{0.45cm} \insereorientadorRotulo~\insereorientador \par
    {\ifnotempty{\inserecoorientador}{%
       {\hspace*{0.45cm} \inserecoorientadorRotulo~\inserecoorientador \par }%
    }
   }
  \hspace*{0.45cm} \insereobjeto ~\textendash ~\insereinstituicao , \inserefaculdade . \insereprograma , \inseredata . \\[12pt]
  \hspace*{0.5cm}  \inserefinalcatalog 
  \vspace*{12pt}
  \hspace*{0.3cm}
\end{minipage} \hspace*{0.3cm}}
\end{center}}
}
\makeatother

%%%

\newenvironment{errata}[1][\errataname]{%
   \pretextualchapter{#1}
  }{\PRIVATEclearpageifneeded}
  

\newenvironment{folhadeaprovacao}[1][\folhadeaprovacaoname]{%
   \clearpage%
   \PRIVATEbookmarkthis{#1}%
   \begin{Spacing}{1.0}
}{\end{Spacing}\PRIVATEclearpageifneeded}

\newenvironment{dedicatoria}[1][]{%
   \ifthenelse{\equal{#1}{}}{%
    \PRIVATEbookmarkthis{\dedicatorianame}
    }{\pretextualchapter{#1}}
  }{\PRIVATEclearpageifneeded}
  
\newenvironment{agradecimentos}[1][\agradecimentosname]{%
   \pretextualchapter{#1}
  }{\PRIVATEclearpageifneeded}
  
\newenvironment{epigrafe}[1][]{%
   \ifthenelse{\equal{#1}{}}{%
    \PRIVATEbookmarkthis{\epigraphname}
    }{\pretextualchapter{#1}}
  }{\PRIVATEclearpageifneeded}
  

\ifthenelse{\equal{\AUisarticle}{true}}{%
  }{ % else
    \setlength\absleftindent{0cm}
    \setlength\absrightindent{0cm}
     \renewcommand{\abstracttextfont}{\normalfont\normalsize}
  }
  
\AtBeginDocument{%
   \setlength{\absparindent}{0pt}
}

\newenvironment{resumo}[1][\resumoname]{%
   \PRIVATEbookmarkthis{#1}
   \renewcommand{\abstractnamefont}{\chaptitlefont}
   \renewcommand{\abstractname}{\bfseries 
   {#1}}
   \begin{abstract}
  }{\end{abstract}\PRIVATEclearpageifneeded}

\newenvironment{siglas}{%
  \pretextualchapter{\listadesiglasname}
  \begin{symbols}
}{%
  \end{symbols}
  \cleardoublepage
}

\newenvironment{simbolos}{%
  \pretextualchapter{\listadesimbolosname}
  \begin{symbols}
}{%
  \end{symbols}
  \cleardoublepage
}


\newlength{\citacaorecuo}
\ifthenelse{\equal{\AUistwocolumn}{true}}{%
  \setlength{\citacaorecuo}{1.8cm}
}{% else
  \setlength{\citacaorecuo}{4cm}
}
\newenvironment*{citacao}[1][default]{%
   \list{}%
   \fontereduzida%
   \addtolength{\leftskip}{\citacaorecuo}%
   \item[]%
   \begin{SingleSpace}%
   \ifthenelse{\not\equal{#1}{default}}{\itshape\selectlanguage{#1}}{}%
 }{%
   \end{SingleSpace}%
   \endlist}%

%% --
\newlist{alineas}{enumerate}{2}
\setlist[alineas,1]{label={\alph*)},topsep=0pt,itemsep=0pt,leftmargin=\parindent+\labelwidth-\labelsep}%
\setlist[alineas,2]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}
\newlist{subalineas}{enumerate}{1}
\setlist[subalineas,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}%
\newlist{incisos}{enumerate}{1}
\setlist[incisos,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}%
%% --
  
\newlength{\signwidth} 
\setlength{\signwidth}{10cm} 
\newlength{\signthickness} 
\setlength{\signthickness}{1pt}
\newlength{\signskip} 
\setlength{\signskip}{1cm} 
  
\newcommand{\assinatura}[1]{
  \begingroup\par\centering 
  \parbox[t]
  {\signwidth}{\SingleSpacing\vspace*{\signskip}\centering%
  \rule{\signwidth}{\signthickness}\\%
  \nopagebreak #1\par}
  \par\endgroup}

% ------------------------------------------------------------------------

\newcommand{\textual}{%
  \ifthenelse{\equal{\AUisarticle}{true}}{%
    \pagestyle{plain}%
  }{%else  
    \pagestyle{abntheadings}%
    \aliaspagestyle{chapter}{abntchapfirst}
  }  
  \nouppercaseheads%
  \bookmarksetup{startatroot}% 
}
\renewcommand{\mainmatter}{\textual}

% ------------------------------------------------------------------------

\newcommand{\postextual}{\phantompart}
\renewcommand{\backmatter}{\postextual}

\let\oldthebibliography=\thebibliography
\let\endoldthebibliography=\endthebibliography
\renewenvironment{thebibliography}[1]{%
\setlength{\afterchapskip}{\lineskip}
\begin{oldthebibliography}{#1}%
\begin{SingleSpacing}
}%
{%
\end{SingleSpacing}
\end{oldthebibliography}%
}


\makeatletter
\newcommand\@switch[1]{ \@writefile{toc}{\renewcommand*{\cftappendixname}{#1 \space}} }
\newcommand{\switchchapname}[1]{ \protected@write \@auxout {}{\string\@switch{#1} }}
\makeatother

\newcommand{\PRIVATEapendiceconfig}[2]{%
 \setboolean{apendiceousecao}{true}%
 \renewcommand{\appendixname}{#1}
 \renewcommand{\appendixpagename}{#2}
 \renewcommand{\appendixtocname}{#2}
 
 \switchchapname{#1}
 \renewcommand*{\cftappendixname}{#1 \space}
}

\newenvironment{apendicesenv}{%
 \PRIVATEapendiceconfig{\apendicename}{\apendicesname}
 \begin{appendix}
}{
 \end{appendix}
 \setboolean{apendiceousecao}{false}
 \bookmarksetup{startatroot}
}

\newenvironment{anexosenv}{%
 \cftinserthook{toc}{AAA}
 
 \PRIVATEapendiceconfig{\anexoname}{\anexosname}
 \begin{appendix}
 \renewcommand\theHchapter{anexochapback.\arabic{chapter}}
}{
 \end{appendix}
 \setboolean{apendiceousecao}{false}
 \bookmarksetup{startatroot}
}

% --- 
