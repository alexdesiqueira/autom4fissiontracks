%%  TWODIMFILT.M
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
%%  Input: vec, a vector that will be used in "a trous" application.
%%         i, corresponding level.
%%
%%  Output: h2, vec in two dimensions according to "a trous" algorithm.
%%          
%%	Other files required: main.m, binarize.m, confusionmatrix.m, 
%% mattewscc.m, starlet.m, xtracttracks.m
%%
%%  Please cite:
%%
%% de Siqueira, A. F., Nakasuga, W. M., Pagamisse, A., Sáenz, C. A. T. 
%% and Job, A. E., An automatic method for segmentation of fission tracks 
%% in epidote crystal photomicrographs. Computers and Geosciences, 2014, 
%% 69; 55-61. doi: 10.1016/j.cageo.2014.04.008
%%

function h2 = twodimfilt(vec,i)

if i == 0
	h = vec;
else
	m = size(vec,2);
	h = zeros(1,m+2^(i-1)*(m-1));
	k = 0;

	for j = 1:2^(i-1)+1:m+2^(i-1)*(m-1)
		k = k+1;
		h(j) = vec(k);
	end
end

aux = sum(sum(h'*h)); % normalization
h2 = (h'*h)/aux; % 2D filter

end
