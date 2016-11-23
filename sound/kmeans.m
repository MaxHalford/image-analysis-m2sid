function [x,j] = kmeans(d,k)
% KMEANS Vector quantisation using K-means algorithm X=(D,K)
% Inputs:
% D contains data vectors (one per row)
% K is number of centres required
%
% Outputs:
% X is output row vectors (K rows)
% J indicates which centre each data vector belongs to

% Recuperation de la taille
[n,p] = size(d);

% Centres pris aleatoirement
x = d(ceil(rand(1,k)*n),:);

% Cas d'arret
y = x+1;

% Cas d'arret : les centres sont fixes
while any(x(:) ~= y(:))
    
   % Calcul de distance euclidienne / centres
   %z=sqrt(sum((d-x).^2));
   z = disteusq(d,x,'x');
   
   % Min distances au centre et centre le plus pres
   [m,j] = min(z,[],2);

   y = x;
   
   % Pour toutes les lois
   for i=1:k
      
       
      s = (j==i);

      if any(s)
         x(i,:) = mean(d(s,:),1);
      else
         q=find(m~=0);
         if isempty(q)
             break;
         end
         r=q(ceil(rand*length(q)));
         x(i,:) = d(r,:);
         m(r)=0;
         y=x+1;
      end

   end
end
