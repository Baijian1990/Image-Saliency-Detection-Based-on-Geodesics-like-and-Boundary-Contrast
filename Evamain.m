Y=[];
for i=[1:34,36:100]
    I1=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_our\' int2str(i) '.jpg']);
    I1=I1(:,:,1);
    I2=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_GS\' int2str(i) '.jpg']);
    I2=I2(:,:,1);
    I3=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_FT\' int2str(i) '.jpg']);
    I3=I3(:,:,1);
    I4=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_RC\' int2str(i) '.jpg']);
    I4=I4(:,:,1);
    I5=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_MR\' int2str(i) '.jpg']);
    I5=I5(:,:,1);
    I6=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_DRFI\' int2str(i) '.jpg']);
    I6=I6(:,:,1);
    I7=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_RBD\' int2str(i) '.jpg']);
    I7=I7(:,:,1);
    I8=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_HDCT\' int2str(i) '.jpg']);
    I8=I8(:,:,1);
    I9=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_RW\' int2str(i) '.jpg']);
    I9=I9(:,:,1);I9=imresize(I9,size(I1));
    I0=imread(['C:\Users\mrx\Desktop\database\SED2\SED2_mask\' int2str(i) '.jpg']);
    I0=I0(:,:,1);
    [P1,R1]= PR(I1,I0);
    [P2,R2]= PR(I2,I0);
    [P3,R3]= PR(I3,I0);
    [P4,R4]= PR(I4,I0);
    [P5,R5]= PR(I5,I0);
    [P6,R6]= PR(I6,I0);
    [P7,R7]= PR(I7,I0);
    [P8,R8]= PR(I8,I0);
    [P9,R9]= PR(I9,I0);
    y=[P1,P2,P3,P4,P5,P6,P7,P8,P9,R1,R2,R3,R4,R5,R6,R7,R8,R9];
    Y=[Y;y];
end

% Xx1=zeros(101,99);Yy1=zeros(101,99);
% Xx2=zeros(101,99);Yy2=zeros(101,99);
% Xx3=zeros(101,99);Yy3=zeros(101,99);
% Xx4=zeros(101,99);Yy4=zeros(101,99);
% Xx5=zeros(101,99);Yy5=zeros(101,99);
% Xx6=zeros(101,99);Yy6=zeros(101,99);
% Xx7=zeros(101,99);Yy7=zeros(101,99);
% Xx8=zeros(101,99);Yy8=zeros(101,99);
% Xx9=zeros(101,99);Yy9=zeros(101,99);
% for i=[1:34,36:100]
%     ['a' int2str(i)]
%     I1=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_our\' int2str(i) '.jpg']);
%     I1=I1(:,:,1);
%     I2=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_GS\' int2str(i) '.jpg']);
%     I2=I2(:,:,1);
%     I3=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_FT\' int2str(i) '.jpg']);
%     I3=I3(:,:,1);
%     I4=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_RC\' int2str(i) '.jpg']);
%     I4=I4(:,:,1);
%     I5=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_MR\' int2str(i) '.jpg']);
%     I5=I5(:,:,1);
%     I6=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_DRFI\' int2str(i) '.jpg']);
%     I6=I6(:,:,1);
%     I7=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_RBD\' int2str(i) '.jpg']);
%     I7=I7(:,:,1);
%     I8=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_HDCT\' int2str(i) '.jpg']);
%     I8=I8(:,:,1);
%     I9=imread(['C:\Users\mrx\Desktop\database\SED2\SED2saliencymap\SED2_RW\' int2str(i) '.jpg']);
%     I9=I9(:,:,1);
%     I0=imread(['C:\Users\mrx\Desktop\database\SED2\SED2_mask\' int2str(i) '.jpg']);
%     I0=I0(:,:,1);
%     [F1,T1]=DROC(I1,I0);
%     [F2,T2]=DROC(I2,I0);
%     [F3,T3]=DROC(I3,I0);
%     [F4,T4]=DROC(I4,I0);
%     [F5,T5]=DROC(I5,I0);
%     [F6,T6]=DROC(I6,I0);
%     [F7,T7]=DROC(I7,I0);
%     [F8,T8]=DROC(I8,I0);
%     [F9,T9]=DROC(I9,I0);
%     Yy1(:,i)=T1;Xx1(:,i)=F1;
%     Yy2(:,i)=T2;Xx2(:,i)=F2;
%     Yy3(:,i)=T3;Xx3(:,i)=F3;
%     Yy4(:,i)=T4;Xx4(:,i)=F4;
%     Yy5(:,i)=T5;Xx5(:,i)=F5;
%     Yy6(:,i)=T6;Xx6(:,i)=F6;
%     Yy7(:,i)=T7;Xx7(:,i)=F7;
%     Yy8(:,i)=T8;Xx8(:,i)=F8;
%     Yy9(:,i)=T9;Xx9(:,i)=F9;
% end