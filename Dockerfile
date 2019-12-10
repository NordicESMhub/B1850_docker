FROM quay.io/nordicesmhub/cesm_libs:latest

#####EXTRA LABELS#####
LABEL autogen="no" \ 
    software="CESM" \ 
    version="2" \
    software.version="2.1.1" \ 
    about.summary="Community Earth System Model" \ 
    base_image="quay.io/nordicesmhub/cesm_libs" \
    about.home="pre-industrial CESM compset B1850 with f09_g17 resolution" \
    about.license="Copyright (c) 2017, University Corporation for Atmospheric Research (UCAR). All rights reserved." 
      
MAINTAINER Anne Fouilloux <annefou@geo.uio.no>

# Add csh for ocean component

RUN apt-get install -y vim 

ENV USER=root
ENV HOME=/root

RUN mkdir -p $HOME/.cime \
             $HOME/work \
             $HOME/inputdata \
             $HOME/archive \
             $HOME/cases 

COPY config_files/* $HOME/.cime/

RUN cd $HOME \
    && git clone -b release-cesm2.1.1 https://github.com/ESCOMP/CESM.git \
    && cd CESM \
    && sed -i.bak "s/'checkout'/'checkout', '--trust-server-cert', '--non-interactive'/" ./manage_externals/manic/repository_svn.py \
    && ./manage_externals/checkout_externals

WORKDIR $HOME/cases

COPY run_b1850case1 $HOME/cases
COPY run_b1850case2 $HOME/cases
COPY run_b1850case3 $HOME/cases
COPY run_b1850case4 $HOME/cases
COPY run_b1850case5 $HOME/cases

CMD ["/bin/bash"]

