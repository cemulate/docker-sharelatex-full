FROM sharelatex/sharelatex:2.1.1

RUN tlmgr update --self && tlmgr install scheme-full
