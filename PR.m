function [P,R]= PR(IS,Imask)
    % ROC write by Runxin Ma
    % Email: gyc@scse.hebut.edu.cn
    % Date: 9/12/2017
    P=[];R=[];
    Im=im2double(Imask);   %ground truth
    Im=Im/max(max(Im));
    [H W]=size(Im);
    Is=im2double(IS);   %saliency map
    Is=Is/max(max(Is));
%         level=min(2*mean(mean(Is)),1);
 for i=0:0.05:1
        I=im2double(im2bw(Is,i));
%         level=graythresh(Is);
%         I=im2double(im2bw(Is,level));         %the binary map of experiment results(i is the threshold)
        Ia=imadd(I,Im);
        Iaa=imadd(Ia,Im);
        TP=length(find(Iaa==3));           %TP
        NF=length(find(Iaa==2));           %NF
        FP=length(find(Iaa==1));           %FP
        TN=length(find(Iaa==0));           %TN
        t=TP/(TP+NF);            %Recall
        f=TP/(FP+TP);            %Precision
        P=[P,f];
        R=[R,t];
 end
end
