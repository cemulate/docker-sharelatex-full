FROM sharelatex/sharelatex:v1.2.1

RUN tlmgr option repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2017/tlnet-final/
RUN tlmgr install scheme-full
