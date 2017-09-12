function [F,T]= myROC(IS,Imask)
    % Evaluate method "DROC" prefered in our paper
    % Image Saliency Detection Based on Geodesics-like and Boundary Contrast
    % Author: Runxin Ma
    % Email: gyc@scse.hebut.edu.cn
    % Date: 9/12/2017
    
    T=[];F=[];
    Im=im2double(Imask);   %ground truth
    Im=Im/max(max(Im));
    [H,W]=size(Im);
    h=ceil(H/10);w=ceil(W/10);
    l0=eye(h);l1=[l0;l0;l0;l0;l0;l0;l0;l0;l0;l0];l1=reshape(l1,[h,10*h]);
    r0=eye(w);r1=[r0;r0;r0;r0;r0;r0;r0;r0;r0;r0];r1=reshape(r1,[w,10*w]);r1=r1';
    P=zeros(10*h,10*w);
    P(1:H,1:W)=Im;
    J=l1*P*r1;
    Y=find(J~=0&J~=100);%boundary superpixels
    Is=im2double(IS);   %saliency map
    Is=Is/max(max(Is));
    
    FpTn=1-Im;
    if sum(sum(FpTn))==0
        FpTn1=0;
    else
        P=zeros(10*h,10*w);
        P(1:H,1:W)=FpTn;
        J0=l1*P*r1;
        X=find(J0~=0)';Q=J0(X);
        DX=ones(length(Y),1)*X;
        DY=Y*ones(1,length(X));
        DX1=ceil(DX/h);DX2=DX-h*(DX1-1);
        DY1=ceil(DY/h);DY2=DY-h*(DY1-1);
        D=sqrt((DX1-DY1).^2.+(DX2-DY2).^2);
        D=min(D);FpTn1=sum(sqrt(D).*Q);
    end
    
    for i=0:0.01:1
        I=im2double(im2bw(Is,i));         %the binary map(i is thresholds)
        Ia=imadd(I,Im);
        Iaa=imadd(Ia,Im);
        TP=length(find(Iaa==3));           %TP
        NF=length(find(Iaa==2));           %NF 
        t=TP/(TP+NF);            %y axes£¨Recall£©
        FP1=xor(I,Im).*I;
        if sum(sum(FP1))==0
            FP2=0;
        else
            P=zeros(10*h,10*w);
            P(1:H,1:W)=FP1;
            J0=l1*P*r1;
            X=find(J0~=0)';Q=J0(X);
            DX=ones(length(Y),1)*X;
            DY=Y*ones(1,length(X));
            DX1=ceil(DX/h);DX2=DX-h*(DX1-1);
            DY1=ceil(DY/h);DY2=DY-h*(DY1-1);
            D=sqrt((DX1-DY1).^2.+(DX2-DY2).^2);
            D=min(D);FP2=sum(sqrt(D).*Q);
        end
        f=FP2/FpTn1; 
        T=[T;t];T=T/max(T);
        F=[F;f];F=F/max(F);
    end
end
