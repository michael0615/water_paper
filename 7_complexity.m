clc
close all
clear all
a=load('1.txt');b=load('2.txt');c=load('3.txt');d=load('4.txt');
y=load('p3ammonia.txt');
x=[a,b,c,d];
xtest=x(700:2401,:);
xtest=xtest';
ytest=y(700:2401,:);
ytest=ytest';
r2all=zeros(16,34);
runtimeann=zeros(16,34);
trainnum=[50,60,70,80,90,100,110,120,130,140,150,200,300,400,500,600];
for nn=1:16
    tnum=trainnum(1,nn);
%     xtrain=x(1:tnum,:);xtrain=xtrain';
%     ytrain=y(1:tnum,:);ytrain=ytrain';
    r2=zeros(100,34);
    for i=2:35
        tic
        for j=1:100
            net = feedforwardnet(i, 'trainlm');
            [net,tr] = train(net, x(1:tnum,:)', y(1:tnum,:)');
            ypre = net(xtest);
            [b,bint,r,rint,stats]=regress(ytest',ypre');
            r2(j,i-1)=stats(1,1);
        end
        runtimeann(nn,i-1)=toc;
        feature('memstats');
    end
    r2mean=mean(r2);
    r2all(nn,:)=r2mean;
end
runtimesvm=zeros(16,1);
for nn=1:16
    tnum=trainnum(1,nn);
        tic
        for j=1:100
            model = svmtrain(y(1:tnum,:),x(1:tnum,:),'-s 3 -t 2 -c 10 -g 2.8 -p 0.01 -e 0.0000001');
            [py,mse,devalue] = svmpredict(y(1:tnum,:),x(1:tnum,:),model);
        end
        runtimesvm(nn,1)=toc;
end


