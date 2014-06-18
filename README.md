%%  README.TXT

%%  Version: april 2014.

%%  This file is part of the supplementary material to 'An automatic 
%% method for segmentation of fission tracks in epidote crystal 
%% photomicrographs'.

%%  Authors: 
%% Alexandre Fioravante de Siqueira, siqueiraaf@gmail.com
%% Wagner Massayuki Nakasuga, wamassa@gmail.com
%% Aylton Pagamisse, aylton@fct.unesp.br
%% Carlos Alberto Tello Saenz, tello@fct.unesp.br
%% Aldo Eloizo Job, job@fct.unesp.br

%%  Description: this software applies algorithms to segment fission-tracks 
%% in crystal images by optical microscopy, based on starlets. 
%% Automatization of these algorithms is given using Matthews Correlation 
%% Coefficient (MCC). The difference between an image and its Ground 
%% Truth is given by a colored comparison.

%%	How to: in Matlab/Octave prompt, type:
%% [D,L,COMP,MCC] = main(IMG,IMGGT);
%% where img is the input image and IMGGT is its ground truth.
%% This command asks the desired algorithm application level and returns
%% starlet detail decomposition levels (D), algorithm output related to 
%% each starlet decomposition level (R), comparison between IMG and 
%% IMGGT for each starlet decomposition level (COMP) and Matthews 
%% Correlation Coefficient for IMG and IMGGT in each level (MCC).

%%	Required files: main.m, binarize.m, confusionmatrix.m, mattewscc.m, 
%% starlet.m, twodimfilt.m, xtracttracks.m

%%  Please cite:

de Siqueira, A. F., Nakasuga, W. M., Pagamisse, A., Sáenz, C. A. T. and Job, A. E., An automatic method for segmentation of fission tracks in epidote crystal photomicrographs. Computers and Geosciences, 2014, 69; 55-61. doi: 10.1016/j.cageo.2014.04.008
