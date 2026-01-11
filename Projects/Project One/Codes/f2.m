

function filter_2n = f2(u,y,dx,dz,ni,nj,nk)



y_new_2n(1:nj+1)=0;

filter_2n = zeros(ni,nj,nk);

u_new=zeros(ni,nj+1,nk);

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));






y_new_2n(1:nj+1)=0;

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));
    

for i=1:ni
for j=1:nj
for k=1:nk
    
    u_new(i,j,k)=u(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u_new(i,j,k)= u(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
filter_2n(i,j,k)= filter_2n(i,j,k)+... 
(u_new(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u_new(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u_new(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
u_new(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u_new(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u_new(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u_new(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u_new(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u_new(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u_new(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u_new(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u_new(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u_new(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u_new(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u_new(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u_new(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u_new(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u_new(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
u_new(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u_new(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u_new(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u_new(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u_new(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u_new(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u_new(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u_new(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u_new(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    filter_2n(i,j,k)=u_new(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    filter_2n(i,j,k)=u_new(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    filter_2n(i,j,k)=u_new(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    filter_2n(i,j,k)=u_new(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    filter_2n(i,j,k)=u_new(i,j,k);

end
end
end

end

