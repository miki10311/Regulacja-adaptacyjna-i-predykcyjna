clear all;
close all;

%%%%%%%%%%%%%%%%%%%%ZAD1
a=[1;1];
N=1000;
uk=zeros(1,N);
yo=zeros(1,N);
yk=zeros(1,N);
%P=eye(2);
P=[N,0;0,N];
est=[0;0];
zk=0.1;

for k=2:1:N
    yo(k)=(sin(0.1*k));
    uk(k)=(yo(k)-a(2)*uk(k-1)-zk)/a(1);

    phi=[yk(k-1);uk(k)];
    yk(k)=(phi')*a+zk;

    P=P-(P*phi*(phi')*P)/(1+(phi')*P*phi);
    est=est+P*phi*(yk(k)-(phi')*est);
    a1(k)=est(1);
    a2(k)=est(2);
end

t=[1:1:N];
an=ones(1,N);

figure(1)
grid on;
hold on;
plot(t,an);
plot(t,a1);
plot(t,a2);
legend('a','a1','a2');
xlabel('Czas t(s)');
ylabel('a');


figure(2)
grid on;
hold on;
plot(t,yk);
plot(t,yo);
legend('yk','yo');
xlabel('Czas t(s)');
ylabel('y');




%%%%%%%%%%%%%%%%%%%ZAD2
ap=[2;1];
N1=2000;
P=[N1,0;0,N1];
uk=zeros(1,N1);
yo=zeros(1,N1);
yk=zeros(1,N1);

for k=2:1:N1
    if k<1000
    yo(k)=(sin(0.1*k));
    uk(k)=(yo(k)-a(2)*uk(k-1)-zk)/a(1);

    phi=[yk(k-1);uk(k)];
    yk(k)=(phi')*a+zk;

    P=P-(P*phi*(phi')*P)/(1+(phi')*P*phi);
    est=est+P*phi*(yk(k)-(phi')*est);
    a1(k)=est(1);
    a2(k)=est(2);


    else k>999
    yo(k)=(sin(0.1*k));
    uk(k)=(yo(k)-ap(2)*uk(k-1)-zk)/ap(1);

    phi=[yk(k-1);uk(k)];
    yk(k)=(phi')*ap+zk;

    P=P-(P*phi*(phi')*P)/(1+(phi')*P*phi);
    est=est+P*phi*(yk(k)-(phi')*est);
    a1(k)=est(1);
    a2(k)=est(2);
    end
end

t=[1:1:N1];
an=ones(1,N1);

figure(3)
grid on;
hold on;
plot(t,an);
plot(t,a1);
plot(t,a2);
legend('a','a1','a2');
xlabel('Czas t(s)');
ylabel('a');

figure(4)
grid on;
hold on;
plot(t,yk);
plot(t,yo);
legend('yk','yo');
xlabel('Czas t(s)');
ylabel('y');





%%%%%%%%%%%%%%%%%%%%ZAD3
a=[1;1];
N=1000;
uk=zeros(1,N);
yo=zeros(1,N);
yk=zeros(1,N);
%P=eye(2);
P=[N,0;0,N];
est=[0;0];
zk=0.1;
alpha=0.95;

for k=2:1:N
    yo(k)=(sin(0.1*k));
    uk(k)=(yo(k)-a(2)*uk(k-1)-zk)/a(1);

    phi=[yk(k-1);uk(k)];
    yk(k)=(phi')*a+zk;

    P=1/alpha*(P-(P*phi*(phi')*P)/(alpha+(phi')*P*phi));
    est=est+P*phi*(yk(k)-(phi')*est);
    a11(k)=est(1);
    a22(k)=est(2);
end

t=[1:1:N];
an=ones(1,N);

figure(5)
grid on;
hold on;
plot(t,an);
plot(t,a11);
plot(t,a22);
legend('a','a1','a2');
xlabel('Czas t(s)');
ylabel('a');


figure(6)
grid on;
hold on;
plot(t,yk);
plot(t,yo);
legend('yk','yo');
xlabel('Czas t(s)');
ylabel('y');




