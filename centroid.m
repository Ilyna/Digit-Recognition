countlabel = tabulate(dzip);

% Find all columns in dzip that are the same digit

for u = 1:10
    a=find(dzip==u-1);
    I{u}=a;
end

% Take average of these in azip to get model digit

for j = 1:10
    azipmodel = zeros(256,1);
    for i = 1:length(I{j})
        azipmodel = azipmodel + azip(:,I{j}(1,i));
    end
    modeldigit{j} = azipmodel/length(I{j});
   % figure(j);
   % ima2(modeldigit{j});
end

% Compute distance between unknown and model digits
% Create vector k of recognized digits in test set
k = [];
d=[];
for n = 1:length(testzip)
    for j = 1:10
        d(j) = norm((testzip(:,n)-modeldigit{j}));
    end
    digit = find(d==min(d));
    digit = digit-1;
    k = [k digit];
end

% Percentage of correctly recognized digits

for u = 1:10
    c=find(k==u-1);
    J{u}=c;
end
for u = 1:10
    d=find(dtest==u-1);
    K{u}=d;
end
numcorrect=[];

for u = 1:10
    numcorrect(u)=length(intersect(J{u},K{u}));
    correctperc(u) = (numcorrect(u)/length(K{u}))*100;
end
x=[1:10];
    plot(x-1, correctperc(x), '-o'); hold on;










