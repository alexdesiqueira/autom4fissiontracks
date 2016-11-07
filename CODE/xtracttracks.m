%%  XTRACTTRACKS.M
%%
%%  Version: november 2013.
%%
%%  This file is part of the supplementary material to 'An automatic 
%% method for segmentation of fission tracks in epidote crystal 
%% photomicrographs, based on starlet wavelets'.
%%
%%  Authors: 
%% Alexandre Fioravante de Siqueira, siqueiraaf@gmail.com
%% Wagner Massayuki Nakasuga, wamassa@gmail.com
%% Aylton Pagamisse, aylton@fct.unesp.br
%% Carlos Alberto Tello Saenz, tello@fct.unesp.br
%% Aldo Eloizo Job, job@fct.unesp.br
%%	
%%  Description: this software applies algorithms to segment fission-tracks 
%% in crystal images by optical microscopy, based on starlets. 
%% Automatization of these algorithms is given using Matthews Correlation 
%% Coefficient (MCC). The difference between an image and its Ground 
%% Truth is given by a colored comparison.
%%
%%  Input: IMG, a gray input image.
%%         D, starlet decomposition levels.
%%
%%  Output: 
%%          R, output from adding algorithm.
%%
%%	Other files required: main.m, binarize.m, confusionmatrix.m, 
%% mattewscc.m, starlet.m, twodimfilt.m
%%
%%  Please cite:
%%
%% de Siqueira, A. F., Nakasuga, W. M., Pagamisse, A., Sáenz, C. A. T. 
%% and Job, A. E., An automatic method for segmentation of fission tracks 
%% in epidote crystal photomicrographs. Computers and Geosciences, 2014, 
%% 69; 55-61. doi: 10.1016/j.cageo.2014.04.008
%%

function R = xtracttracks(IMG,D)

[M,N,level] = size(D); % extract info about D

%%% PRELIMINAR VARS %%%
Dmax = zeros(M,N,level);
sum = 0;
initlv = 3; %% begins from initlv value

%%% ADDING STARLET DETAIL LEVELS %%%
for i = initlv:level 
	ratio = max(max(D(:,:,i))); ratio = 255/ratio;
	Dmax(:,:,i) = uint8(ratio*D(:,:,i));

	sum = sum + Dmax(:,:,i);
end

R =  uint8(sum);
