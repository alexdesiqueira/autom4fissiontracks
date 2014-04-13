%%  MAIN.M
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
%%         IMGGT, a ground truth image obtained from IMG.
%%
%%  Output: D, starlet decomposition levels.
%%          R, algorithm output.
%%          COMP, comparison between IMG and IMGGT based on TP, TN, 
%% FP and FN.
%%          MCC, Mattews correlation coefficient for segmentation 
%% levels.
%%
%%	Other files required: binarize.m, confusionmatrix.m, mattewscc.m, 
%% starlet.m, twodimfilt.m, xtracttracks.m
%%
%%  Please cite:
%%
%% Alexandre Fioravante de Siqueira, Wagner Massayuki Nakasuga, Aylton 
%% Pagamisse, Carlos Alberto Tello Saenz and Aldo Eloizo Job. An automatic 
%% method for segmentation of fission tracks in epidote crystal 
%% photomicrographs, based on starlet wavelets. 2013.
%%

function [D,R,COMP,MCC] = main(IMG,IMGGT)

%%% PRELIMINAR VARS %%%
L = input("Desired decomposition levels: ");

%%% STARLET APPLICATION %%%
[~,D] = starlet(IMG,L);

for i = 3:L
	printf("Processing... Level: %d\n", i); fflush(stdout);
	aux = xtracttracks(IMG,D(:,:,[1:i])); %% fission-tracks extraction with necessary D's
	R(:,:,i) = ~binarize(aux); %% binarize input image; inverse results

	%%% COMPARISON PROGRAM %%%
	[auxtp,auxtn,auxfp,auxfn,auxc] = confusionmatrix(IMGGT,R(:,:,i));
	TP(i) = auxtp;
	TN(i) = auxtn;
	FP(i) = auxfp;
	FN(i) = auxfn;
	COMP(:,:,:,i) = auxc; %COMP is a set of RGB images
	
	%%% OPTIMAL LEVEL %%%
	MCC(i) = matthewscc(TP(i),TN(i),FP(i),FN(i));
end

%%% OPTIMAL LEVEL %%%
[optval,optind] = max(MCC(3:L)); %% levels 1 and 2 return optl = 0
printf ("Optimal decomposition level: %d.\n", optind+2); %% correction

%%% GRAPHIC RESULTS %%%
figure; bar(MCC*100,"facecolor","r","edgecolor","r"); %% presenting MCC as percentage
xlabel("Level"); ylabel("Result");
