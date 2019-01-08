
for u = 1:10
    a=find(dzip==u-1);
    I{u}=a;
end

A=[];
for j = 1:10
    for i = 1:length(I{j})
        A{j}(:,i) = [azip(:,I{j}(1,i))];
    end
end


d=[];
guessedk=zeros(1,2007);

for k = 1:9
     guessed=[];
     for n = 1:length(testzip)
           for j = 1:10
                [U,S,V] = svd(A{j});
                d(j) = norm((eye(256)-U(:,1:k)*U(:,1:k)')*(testzip(:,n)));
           end 
           digit = find(d==min(d)); 
           digit = digit-1;
           guessed = [guessed digit];
     end
     guessedk = [guessedk ; guessed];
end

% Percent of correctly guessed

numcorrect=[];
for k = 2:10
    C={'k','b','r','g','y','k','b','r','g','y'}
    for u = 1:10
        c=find(guessedk(k,:)==u-1);
        J{u}=c;
        e=find(dtest==u-1);
        K{u}=e;
        numcorrect(u)=length(intersect(J{u},K{u}));
        correctperc(u) = (numcorrect(u)/length(K{u}))*100; 
    end
    x=[1:10];
    plot(x-1, correctperc(x), '-o'); hold on;
end









