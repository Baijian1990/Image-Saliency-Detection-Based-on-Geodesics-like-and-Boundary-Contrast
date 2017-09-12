function [F,T]= ROC(IS,Imask)
    % ROC write by Runxin Ma
    % Email: gyc@scse.hebut.edu.cn
    % Date: 9/12/2017
    T=[];F=[];
    Im=im2double(Imask);   %ground truth
    Im=Im/max(max(Im));
    [H W]=size(Im);
    Is=im2double(IS);   %saliency map
    Is=Is/max(max(Is));
    for i=0:0.05:1
        I=im2double(im2bw(Is+0.0000000000000001,i));         %the binary map
        Ia=imadd(I,Im);
        Iaa=imadd(Ia,Im);
        TP=length(find(Iaa==3));           %TP
        NF=length(find(Iaa==2));           %NF 
        FP=length(find(Iaa==1));           %FP
        TN=length(find(Iaa==0));           %TN
        t=TP/(TP+NF);            %Recall
        f=FP/(FP+TN);            %Precision       
        T=[T;t];
        F=[F;f];
    end
end
