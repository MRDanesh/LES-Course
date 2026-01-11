u1_filter_2n = zeros(ni,nj,nk);

u1_3d_2n=zeros(ni,nj+1,nk);

y_new_2n(1:nj+1)=0;

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));
    

for i=1:ni
for j=1:nj
for k=1:nk
    
    u1_3d_2n(i,j,k)=u1_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u1_3d_2n(i,j,k)= u1_3d(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
u1_filter_2n(i,j,k)= u1_filter_2n(i,j,k)+... 
(u1_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u1_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u1_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
u1_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u1_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u1_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u1_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u1_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u1_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u1_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u1_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u1_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u1_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u1_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u1_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u1_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u1_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u1_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
u1_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u1_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u1_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u1_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u1_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u1_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u1_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u1_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u1_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u1_filter_2n(i,j,k)=u1_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u1_filter_2n(i,j,k)=u1_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u1_filter_2n(i,j,k)=u1_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u1_filter_2n(i,j,k)=u1_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u1_filter_2n(i,j,k)=u1_3d_2n(i,j,k);

end
end
end
%%%%%%%%%%

u2_filter_2n = zeros(ni,nj,nk);

u2_3d_2n=zeros(ni,nj+1,nk);

y_new_2n(1:nj+1)=0;

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));
    

for i=1:ni
for j=1:nj
for k=1:nk
    
    u2_3d_2n(i,j,k)=u2_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u2_3d_2n(i,j,k)= u2_3d(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
u2_filter_2n(i,j,k)= u2_filter_2n(i,j,k)+... 
(u2_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u2_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u2_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
u2_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u2_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u2_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u2_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u2_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u2_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u2_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u2_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u2_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u2_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u2_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u2_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u2_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u2_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u2_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
u2_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u2_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u2_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u2_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u2_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u2_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u2_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u2_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u2_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u2_filter_2n(i,j,k)=u2_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u2_filter_2n(i,j,k)=u2_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u2_filter_2n(i,j,k)=u2_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u2_filter_2n(i,j,k)=u2_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u2_filter_2n(i,j,k)=u2_3d_2n(i,j,k);

end
end
end

%for u3

u3_filter_2n = zeros(ni,nj,nk);

u3_3d_2n=zeros(ni,nj+1,nk);

y_new_2n(1:nj+1)=0;

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));
    

for i=1:ni
for j=1:nj
for k=1:nk
    
    u3_3d_2n(i,j,k)=u3_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u3_3d_2n(i,j,k)= u3_3d(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
u3_filter_2n(i,j,k)= u3_filter_2n(i,j,k)+... 
(u3_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u3_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u3_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
u3_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u3_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u3_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u3_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u3_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u3_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u3_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u3_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u3_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u3_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u3_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u3_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u3_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u3_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u3_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
u3_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u3_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u3_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u3_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u3_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u3_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u3_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u3_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u3_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u3_filter_2n(i,j,k)=u3_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u3_filter_2n(i,j,k)=u3_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u3_filter_2n(i,j,k)=u3_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u3_filter_2n(i,j,k)=u3_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u3_filter_2n(i,j,k)=u3_3d_2n(i,j,k);

end
end
end

%Finally filter for u with n=2 :

u_filter_2n=zeros(ni,nj,nk);
for i=1:ni
for j=1:nj
for k=1:nk
    
    u_filter_2n(i,j,k)=(u1_filter_2n(i,j,k)+u2_filter_2n(i,j,k)+u3_filter_2n(i,j,k))/3;

end
end
end

% for v%

v1_filter_2n = zeros(ni,nj,nk);

v1_3d_2n=zeros(ni,nj+1,nk);

y_new_2n(1:nj+1)=0;

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));
    

for i=1:ni
for j=1:nj
for k=1:nk
    
    v1_3d_2n(i,j,k)=v1_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     v1_3d_2n(i,j,k)= v1_3d(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
v1_filter_2n(i,j,k)= v1_filter_2n(i,j,k)+... 
(v1_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + v1_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + v1_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
v1_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + v1_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + v1_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
v1_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + v1_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + v1_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
v1_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + v1_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + v1_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
v1_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + v1_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + v1_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
v1_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + v1_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + v1_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
v1_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + v1_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + v1_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
v1_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + v1_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + v1_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
v1_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + v1_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + v1_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    v1_filter_2n(i,j,k)=v1_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    v1_filter_2n(i,j,k)=v1_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    v1_filter_2n(i,j,k)=v1_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    v1_filter_2n(i,j,k)=v1_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    v1_filter_2n(i,j,k)=v1_3d_2n(i,j,k);

end
end
end
%%%%%%


v2_filter_2n = zeros(ni,nj,nk);

v2_3d_2n=zeros(ni,nj+1,nk);

y_new_2n(1:nj+1)=0;

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));
    

for i=1:ni
for j=1:nj
for k=1:nk
    
    v2_3d_2n(i,j,k)=v2_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     v2_3d_2n(i,j,k)= v2_3d(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
v2_filter_2n(i,j,k)= v2_filter_2n(i,j,k)+... 
(v2_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + v2_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + v2_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
v2_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + v2_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + v2_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
v2_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + v2_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + v2_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
v2_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + v2_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + v2_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
v2_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + v2_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + v2_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
v2_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + v2_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + v2_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
v2_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + v2_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + v2_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
v2_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + v2_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + v2_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
v2_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + v2_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + v2_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    v2_filter_2n(i,j,k)=v2_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    v2_filter_2n(i,j,k)=v2_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    v2_filter_2n(i,j,k)=v2_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    v2_filter_2n(i,j,k)=v2_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    v2_filter_2n(i,j,k)=v2_3d_2n(i,j,k);

end
end
end

%%%%%

v3_filter_2n = zeros(ni,nj,nk);

v3_3d_2n=zeros(ni,nj+1,nk);

y_new_2n(1:nj+1)=0;

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));
    

for i=1:ni
for j=1:nj
for k=1:nk
    
    v3_3d_2n(i,j,k)=v3_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     v3_3d_2n(i,j,k)= v3_3d(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
v3_filter_2n(i,j,k)= v3_filter_2n(i,j,k)+... 
(v3_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + v3_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + v3_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
v3_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + v3_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + v3_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
v3_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + v3_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + v3_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
v3_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + v3_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + v3_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
v3_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + v3_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + v3_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
v3_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + v3_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + v3_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
v3_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + v3_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + v3_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
v3_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + v3_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + v3_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
v3_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + v3_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + v3_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    v3_filter_2n(i,j,k)=v3_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    v3_filter_2n(i,j,k)=v3_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    v3_filter_2n(i,j,k)=v3_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    v3_filter_2n(i,j,k)=v3_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    v3_filter_2n(i,j,k)=v3_3d_2n(i,j,k);

end
end
end

%%%%%%
v_filter_2n=zeros(ni,nj,nk);
for i=1:ni
for j=1:nj
for k=1:nk
    
    v_filter_2n(i,j,k)=(v1_filter_2n(i,j,k)+v2_filter_2n(i,j,k)+v3_filter_2n(i,j,k))/3;

end
end
end

%%%%%%%







%similary start double filtering with 2n%

u1_double_filter_2n = zeros(ni,nj,nk);

u1_filter_3d_2n=zeros(ni,nj+1,nk);

    

for i=1:ni
for j=1:nj
for k=1:nk
    
    u1_filter_3d_2n(i,j,k)=u1_filter_2n(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u1_filter_3d_2n(i,j,k)= u1_filter_2n(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
u1_double_filter_2n(i,j,k)= u1_double_filter_2n(i,j,k)+... 
(u1_filter_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u1_filter_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u1_filter_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
u1_filter_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u1_filter_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u1_filter_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u1_filter_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u1_filter_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u1_filter_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u1_filter_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u1_filter_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u1_filter_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u1_filter_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u1_filter_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u1_filter_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u1_filter_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u1_filter_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u1_filter_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
u1_filter_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u1_filter_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u1_filter_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u1_filter_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u1_filter_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u1_filter_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u1_filter_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u1_filter_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u1_filter_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u1_double_filter_2n(i,j,k)=u1_filter_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u1_double_filter_2n(i,j,k)=u1_filter_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u1_double_filter_2n(i,j,k)=u1_filter_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u1_double_filter_2n(i,j,k)=u1_filter_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u1_double_filter_2n(i,j,k)=u1_filter_3d_2n(i,j,k);

end
end
end


% for u2:

u2_double_filter_2n = zeros(ni,nj,nk);

u2_filter_3d_2n=zeros(ni,nj+1,nk);

    

for i=1:ni
for j=1:nj
for k=1:nk
    
    u2_filter_3d_2n(i,j,k)=u2_filter_2n(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u2_filter_3d_2n(i,j,k)= u2_filter_2n(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
u2_double_filter_2n(i,j,k)= u2_double_filter_2n(i,j,k)+... 
(u2_filter_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u2_filter_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u2_filter_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
u2_filter_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u2_filter_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u2_filter_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u2_filter_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u2_filter_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u2_filter_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u2_filter_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u2_filter_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u2_filter_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u2_filter_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u2_filter_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u2_filter_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u2_filter_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u2_filter_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u2_filter_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
u2_filter_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u2_filter_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u2_filter_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u2_filter_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u2_filter_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u2_filter_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u2_filter_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u2_filter_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u2_filter_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u2_double_filter_2n(i,j,k)=u2_filter_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u2_double_filter_2n(i,j,k)=u2_filter_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u2_double_filter_2n(i,j,k)=u2_filter_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u2_double_filter_2n(i,j,k)=u2_filter_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u2_double_filter_2n(i,j,k)=u2_filter_3d_2n(i,j,k);

end
end
end

%for u3:

u3_double_filter_2n = zeros(ni,nj,nk);

u3_filter_3d_2n=zeros(ni,nj+1,nk);

    

for i=1:ni
for j=1:nj
for k=1:nk
    
    u3_filter_3d_2n(i,j,k)=u3_filter_2n(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u3_filter_3d_2n(i,j,k)= u3_filter_2n(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
u3_double_filter_2n(i,j,k)= u3_double_filter_2n(i,j,k)+... 
(u3_filter_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u3_filter_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u3_filter_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
u3_filter_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u3_filter_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u3_filter_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u3_filter_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u3_filter_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u3_filter_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u3_filter_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u3_filter_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u3_filter_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u3_filter_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u3_filter_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u3_filter_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u3_filter_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u3_filter_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u3_filter_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
u3_filter_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u3_filter_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u3_filter_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u3_filter_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u3_filter_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u3_filter_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u3_filter_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u3_filter_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u3_filter_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u3_double_filter_2n(i,j,k)=u3_filter_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u3_double_filter_2n(i,j,k)=u3_filter_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u3_double_filter_2n(i,j,k)=u3_filter_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u3_double_filter_2n(i,j,k)=u3_filter_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u3_double_filter_2n(i,j,k)=u3_filter_3d_2n(i,j,k);

end
end
end


u_double_filter_2n=zeros(ni,nj,nk);
for i=1:ni
for j=1:nj
for k=1:nk
    
    u_double_filter_2n(i,j,k)=(u1_double_filter_2n(i,j,k)+u2_filter_2n(i,j,k)+u3_filter_2n(i,j,k))/3;

end
end
end










%filtering with n=4%


u1_filter_4n = zeros(ni,nj,nk);

u1_3d_4n=zeros(ni,nj+2,nk);

y_new_4n(nj+2)=0;

for j=1:nj
    
    y_new_4n(j)=y(j);
end

y_new_4n(nj+1)= y(nj) + (y(nj)-y(nj-1));
y_new_4n(nj+2)= y(nj) + (y(nj)-y(nj-2));

for i=1:ni
for j=1:nj
for k=1:nk
    
    u1_3d_4n(i,j,k)=u1_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u1_3d_4n(i,j,k)= u1_3d(i,j-2,k);
end
end
end

for i=1:ni
for j=nj+2
for k=1:nk
     u1_3d_4n(i,j,k)= u1_3d(i,j-4,k);
end
end
end


for i=3:ni-2
for j=3:nj
for k=3:nk-2
u1_filter_4n(i,j,k)= u1_filter_4n(i,j,k)+... 
(u1_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u1_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u1_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u1_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u1_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u1_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u1_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(16*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=3:ni-2
for j=2
for k=3:nk-2
u1_filter_4n(i,j,k)= u1_filter_4n(i,j,k)+... 
(u1_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u1_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u1_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u1_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u1_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u1_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u1_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
u1_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
u1_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
u1_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
u1_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz)  ...
/(16*dx*dz*(y_new_4n(j+2)-y_new_4n(j-1))) ;                                                                                                                                        
end
end
end

for i=2
for j=3:nj
for k=3:nk-2
u1_filter_4n(i,j,k)= u1_filter_4n(i,j,k)+... 
(u1_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u1_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i-1,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-1,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-1,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-1,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-1,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u1_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u1_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u1_3d_4n(i-1,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-1,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-1,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-1,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-1,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u1_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-1,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i-1,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-1,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-1,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-1,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-1,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-1,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz ) ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end



for i=95
for j=3:nj
for k=3:nk-2
u1_filter_4n(i,j,k)= u1_filter_4n(i,j,k)+... 
(u1_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u1_3d_4n(i+1,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+1,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+1,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+1,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+1,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u1_3d_4n(i+1,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+1,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+1,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+1,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+1,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u1_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u1_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u1_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+1,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i+1,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+1,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+1,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+1,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+1,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+1,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=3:ni-2
for j=3:nj
for k=2
u1_filter_4n(i,j,k)= u1_filter_4n(i,j,k)+... 
(u1_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u1_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u1_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u1_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u1_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u1_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u1_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u1_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u1_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u1_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u1_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u1_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u1_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u1_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u1_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u1_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u1_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u1_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u1_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u1_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u1_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u1_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u1_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u1_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u1_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u1_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u1_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u1_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u1_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end

for i=3:ni-2
for j=3:nj
for k=95
u1_filter_4n(i,j,k)= u1_filter_4n(i,j,k)+... 
(u1_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u1_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +  ...
u1_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u1_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
u1_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u1_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
u1_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz  + u1_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
u1_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u1_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u1_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
u1_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u1_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +  ...
u1_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
u1_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
u1_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u1_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +  ...
u1_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u1_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u1_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u1_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
u1_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u1_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u1_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u1_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u1_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u1_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u1_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u1_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u1_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u1_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u1_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz  + u1_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u1_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u1_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u1_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u1_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u1_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u1_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u1_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u1_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
u1_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u1_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
u1_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u1_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
u1_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
u1_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u1_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u1_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u1_filter_4n(i,j,k)=u1_3d_4n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u1_filter_4n(i,j,k)=u1_3d_4n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u1_filter_4n(i,j,k)=u1_3d_4n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u1_filter_4n(i,j,k)=u1_3d_4n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u1_filter_4n(i,j,k)=u1_3d_4n(i,j,k);

end
end
end

% for u2



u2_filter_4n = zeros(ni,nj,nk);

u2_3d_4n=zeros(ni,nj+2,nk);

y_new_4n(nj+2)=0;

for j=1:nj
    
    y_new_4n(j)=y(j);
end

y_new_4n(nj+1)= y(nj) + (y(nj)-y(nj-1));
y_new_4n(nj+2)= y(nj) + (y(nj)-y(nj-2));

for i=1:ni
for j=1:nj
for k=1:nk
    
    u2_3d_4n(i,j,k)=u2_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u2_3d_4n(i,j,k)= u2_3d(i,j-2,k);
end
end
end

for i=1:ni
for j=nj+2
for k=1:nk
     u2_3d_4n(i,j,k)= u2_3d(i,j-4,k);
end
end
end


for i=3:ni-2
for j=3:nj
for k=3:nk-2
u2_filter_4n(i,j,k)= u2_filter_4n(i,j,k)+... 
(u2_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u2_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u2_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u2_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u2_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u2_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u2_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(16*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=3:ni-2
for j=2
for k=3:nk-2
u2_filter_4n(i,j,k)= u2_filter_4n(i,j,k)+... 
(u2_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u2_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u2_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u2_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u2_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u2_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u2_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
u2_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
u2_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
u2_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
u2_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz)  ...
/(16*dx*dz*(y_new_4n(j+2)-y_new_4n(j-1))) ;                                                                                                                                        
end
end
end

for i=2
for j=3:nj
for k=3:nk-2
u2_filter_4n(i,j,k)= u2_filter_4n(i,j,k)+... 
(u2_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u2_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i-1,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-1,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-1,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-1,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-1,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u2_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u2_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u2_3d_4n(i-1,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-1,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-1,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-1,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-1,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u2_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-1,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i-1,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-1,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-1,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-1,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-1,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-1,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz ) ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end



for i=95
for j=3:nj
for k=3:nk-2
u2_filter_4n(i,j,k)= u2_filter_4n(i,j,k)+... 
(u2_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u2_3d_4n(i+1,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+1,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+1,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+1,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+1,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u2_3d_4n(i+1,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+1,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+1,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+1,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+1,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u2_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u2_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u2_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+1,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i+1,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+1,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+1,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+1,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+1,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+1,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=3:ni-2
for j=3:nj
for k=2
u2_filter_4n(i,j,k)= u2_filter_4n(i,j,k)+... 
(u2_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u2_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u2_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u2_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u2_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u2_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u2_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u2_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u2_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u2_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u2_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u2_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u2_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u2_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u2_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u2_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u2_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u2_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u2_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u2_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u2_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u2_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u2_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u2_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u2_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u2_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u2_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u2_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u2_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end

for i=3:ni-2
for j=3:nj
for k=95
u2_filter_4n(i,j,k)= u2_filter_4n(i,j,k)+... 
(u2_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u2_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +  ...
u2_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u2_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
u2_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u2_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
u2_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz  + u2_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
u2_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u2_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u2_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
u2_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u2_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +  ...
u2_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
u2_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
u2_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u2_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +  ...
u2_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u2_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u2_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u2_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
u2_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u2_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u2_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u2_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u2_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u2_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u2_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u2_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u2_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u2_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u2_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz  + u2_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u2_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u2_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u2_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u2_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u2_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u2_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u2_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u2_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
u2_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u2_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
u2_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u2_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
u2_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
u2_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u2_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u2_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u2_filter_4n(i,j,k)=u2_3d_4n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u2_filter_4n(i,j,k)=u2_3d_4n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u2_filter_4n(i,j,k)=u2_3d_4n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u2_filter_4n(i,j,k)=u2_3d_4n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u2_filter_4n(i,j,k)=u2_3d_4n(i,j,k);

end
end
end

%for u3


u3_filter_4n = zeros(ni,nj,nk);

u3_3d_4n=zeros(ni,nj+2,nk);

y_new_4n(nj+2)=0;

for j=1:nj
    
    y_new_4n(j)=y(j);
end

y_new_4n(nj+1)= y(nj) + (y(nj)-y(nj-1));
y_new_4n(nj+2)= y(nj) + (y(nj)-y(nj-2));

for i=1:ni
for j=1:nj
for k=1:nk
    
    u3_3d_4n(i,j,k)=u3_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u3_3d_4n(i,j,k)= u3_3d(i,j-2,k);
end
end
end

for i=1:ni
for j=nj+2
for k=1:nk
     u3_3d_4n(i,j,k)= u3_3d(i,j-4,k);
end
end
end


for i=3:ni-2
for j=3:nj
for k=3:nk-2
u3_filter_4n(i,j,k)= u3_filter_4n(i,j,k)+... 
(u3_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u3_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u3_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u3_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u3_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u3_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u3_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(16*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=3:ni-2
for j=2
for k=3:nk-2
u3_filter_4n(i,j,k)= u3_filter_4n(i,j,k)+... 
(u3_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u3_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u3_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u3_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u3_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u3_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u3_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
u3_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
u3_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
u3_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
u3_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz)  ...
/(16*dx*dz*(y_new_4n(j+2)-y_new_4n(j-1))) ;                                                                                                                                        
end
end
end

for i=2
for j=3:nj
for k=3:nk-2
u3_filter_4n(i,j,k)= u3_filter_4n(i,j,k)+... 
(u3_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u3_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i-1,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-1,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-1,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-1,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-1,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u3_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u3_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u3_3d_4n(i-1,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-1,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-1,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-1,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-1,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u3_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-1,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i-1,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-1,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-1,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-1,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-1,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-1,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz ) ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end



for i=95
for j=3:nj
for k=3:nk-2
u3_filter_4n(i,j,k)= u3_filter_4n(i,j,k)+... 
(u3_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u3_3d_4n(i+1,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+1,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+1,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+1,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+1,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u3_3d_4n(i+1,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+1,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+1,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+1,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+1,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u3_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u3_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u3_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+1,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i+1,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+1,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+1,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+1,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+1,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+1,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=3:ni-2
for j=3:nj
for k=2
u3_filter_4n(i,j,k)= u3_filter_4n(i,j,k)+... 
(u3_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u3_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
u3_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u3_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u3_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u3_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
u3_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u3_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u3_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u3_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u3_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u3_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u3_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u3_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
u3_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u3_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
u3_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u3_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u3_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u3_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u3_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u3_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u3_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u3_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u3_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
u3_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u3_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u3_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
u3_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end

for i=3:ni-2
for j=3:nj
for k=95
u3_filter_4n(i,j,k)= u3_filter_4n(i,j,k)+... 
(u3_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u3_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +  ...
u3_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u3_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
u3_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  u3_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
u3_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz  + u3_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
u3_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + u3_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + u3_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
u3_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u3_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +  ...
u3_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
u3_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
u3_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u3_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +  ...
u3_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + u3_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + u3_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  u3_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
u3_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u3_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u3_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u3_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u3_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u3_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  u3_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
u3_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u3_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u3_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u3_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz  + u3_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u3_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u3_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u3_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + u3_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + u3_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  u3_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
u3_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u3_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
u3_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u3_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
u3_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  u3_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
u3_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
u3_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + u3_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + u3_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u3_filter_4n(i,j,k)=u3_3d_4n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u3_filter_4n(i,j,k)=u3_3d_4n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u3_filter_4n(i,j,k)=u3_3d_4n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u3_filter_4n(i,j,k)=u3_3d_4n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u3_filter_4n(i,j,k)=u3_3d_4n(i,j,k);

end
end
end

%finally 

u_filter_4n=zeros(ni,nj,nk);
for i=1:ni
for j=1:nj
for k=1:nk
    
    u_filter_4n(i,j,k)=(u1_filter_4n(i,j,k)+u2_filter_4n(i,j,k)+u3_filter_4n(i,j,k))/3;

end
end
end


u_3d=zeros(ni,nj,nk);
for i=1:ni
for j=1:nj
for k=1:nk
    
    u_3d(i,j,k)=(u1_3d(i,j,k)+u2_3d(i,j,k)+u3_3d(i,j,k))/3;

end
end
end
%%%%%%%%%%%%%%for v=V%%%%%%%%%%%%%%%


v1_filter_4n = zeros(ni,nj,nk);

v1_3d_4n=zeros(ni,nj+2,nk);

y_new_4n(nj+2)=0;

for j=1:nj
    
    y_new_4n(j)=y(j);
end

y_new_4n(nj+1)= y(nj) + (y(nj)-y(nj-1));
y_new_4n(nj+2)= y(nj) + (y(nj)-y(nj-2));

for i=1:ni
for j=1:nj
for k=1:nk
    
    v1_3d_4n(i,j,k)=v1_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     v1_3d_4n(i,j,k)= v1_3d(i,j-2,k);
end
end
end

for i=1:ni
for j=nj+2
for k=1:nk
     v1_3d_4n(i,j,k)= v1_3d(i,j-4,k);
end
end
end


for i=3:ni-2
for j=3:nj
for k=3:nk-2
v1_filter_4n(i,j,k)= v1_filter_4n(i,j,k)+... 
(v1_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v1_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v1_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v1_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v1_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v1_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v1_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(16*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=3:ni-2
for j=2
for k=3:nk-2
v1_filter_4n(i,j,k)= v1_filter_4n(i,j,k)+... 
(v1_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v1_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v1_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v1_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v1_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v1_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v1_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
v1_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
v1_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
v1_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
v1_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz)  ...
/(16*dx*dz*(y_new_4n(j+2)-y_new_4n(j-1))) ;                                                                                                                                        
end
end
end

for i=2
for j=3:nj
for k=3:nk-2
v1_filter_4n(i,j,k)= v1_filter_4n(i,j,k)+... 
(v1_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v1_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i-1,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-1,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-1,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-1,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-1,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v1_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v1_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v1_3d_4n(i-1,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-1,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-1,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-1,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-1,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v1_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-1,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i-1,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-1,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-1,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-1,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-1,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-1,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz ) ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end



for i=95
for j=3:nj
for k=3:nk-2
v1_filter_4n(i,j,k)= v1_filter_4n(i,j,k)+... 
(v1_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v1_3d_4n(i+1,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+1,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+1,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+1,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+1,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v1_3d_4n(i+1,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+1,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+1,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+1,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+1,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v1_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v1_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v1_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+1,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i+1,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+1,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+1,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+1,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+1,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+1,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=3:ni-2
for j=3:nj
for k=2
v1_filter_4n(i,j,k)= v1_filter_4n(i,j,k)+... 
(v1_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v1_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v1_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v1_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v1_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v1_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v1_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v1_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v1_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v1_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v1_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v1_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v1_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v1_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v1_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v1_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v1_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v1_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v1_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v1_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v1_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v1_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v1_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v1_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v1_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v1_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v1_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v1_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v1_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end

for i=3:ni-2
for j=3:nj
for k=95
v1_filter_4n(i,j,k)= v1_filter_4n(i,j,k)+... 
(v1_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v1_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +  ...
v1_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v1_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
v1_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v1_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
v1_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz  + v1_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
v1_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v1_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v1_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
v1_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v1_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +  ...
v1_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
v1_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
v1_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v1_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +  ...
v1_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v1_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v1_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v1_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
v1_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v1_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v1_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v1_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v1_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v1_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v1_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v1_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v1_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v1_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v1_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz  + v1_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v1_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v1_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v1_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v1_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v1_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v1_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v1_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v1_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
v1_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v1_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
v1_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v1_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
v1_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
v1_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v1_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v1_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    v1_filter_4n(i,j,k)=v1_3d_4n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    v1_filter_4n(i,j,k)=v1_3d_4n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    v1_filter_4n(i,j,k)=v1_3d_4n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    v1_filter_4n(i,j,k)=v1_3d_4n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    v1_filter_4n(i,j,k)=v1_3d_4n(i,j,k);

end
end
end

v2_filter_4n = zeros(ni,nj,nk);

v2_3d_4n=zeros(ni,nj+2,nk);

y_new_4n(nj+2)=0;

for j=1:nj
    
    y_new_4n(j)=y(j);
end

y_new_4n(nj+1)= y(nj) + (y(nj)-y(nj-1));
y_new_4n(nj+2)= y(nj) + (y(nj)-y(nj-2));

for i=1:ni
for j=1:nj
for k=1:nk
    
    v2_3d_4n(i,j,k)=v2_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     v2_3d_4n(i,j,k)= v2_3d(i,j-2,k);
end
end
end

for i=1:ni
for j=nj+2
for k=1:nk
     v2_3d_4n(i,j,k)= v2_3d(i,j-4,k);
end
end
end


for i=3:ni-2
for j=3:nj
for k=3:nk-2
v2_filter_4n(i,j,k)= v2_filter_4n(i,j,k)+... 
(v2_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v2_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v2_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v2_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v2_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v2_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v2_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(16*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=3:ni-2
for j=2
for k=3:nk-2
v2_filter_4n(i,j,k)= v2_filter_4n(i,j,k)+... 
(v2_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v2_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v2_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v2_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v2_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v2_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v2_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
v2_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
v2_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
v2_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
v2_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz)  ...
/(16*dx*dz*(y_new_4n(j+2)-y_new_4n(j-1))) ;                                                                                                                                        
end
end
end

for i=2
for j=3:nj
for k=3:nk-2
v2_filter_4n(i,j,k)= v2_filter_4n(i,j,k)+... 
(v2_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v2_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i-1,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-1,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-1,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-1,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-1,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v2_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v2_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v2_3d_4n(i-1,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-1,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-1,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-1,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-1,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v2_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-1,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i-1,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-1,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-1,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-1,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-1,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-1,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz ) ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end



for i=95
for j=3:nj
for k=3:nk-2
v2_filter_4n(i,j,k)= v2_filter_4n(i,j,k)+... 
(v2_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v2_3d_4n(i+1,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+1,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+1,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+1,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+1,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v2_3d_4n(i+1,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+1,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+1,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+1,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+1,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v2_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v2_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v2_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+1,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i+1,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+1,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+1,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+1,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+1,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+1,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=3:ni-2
for j=3:nj
for k=2
v2_filter_4n(i,j,k)= v2_filter_4n(i,j,k)+... 
(v2_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v2_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v2_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v2_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v2_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v2_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v2_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v2_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v2_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v2_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v2_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v2_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v2_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v2_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v2_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v2_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v2_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v2_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v2_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v2_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v2_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v2_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v2_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v2_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v2_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v2_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v2_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v2_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v2_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end

for i=3:ni-2
for j=3:nj
for k=95
v2_filter_4n(i,j,k)= v2_filter_4n(i,j,k)+... 
(v2_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v2_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +  ...
v2_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v2_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
v2_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v2_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
v2_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz  + v2_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
v2_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v2_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v2_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
v2_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v2_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +  ...
v2_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
v2_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
v2_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v2_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +  ...
v2_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v2_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v2_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v2_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
v2_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v2_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v2_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v2_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v2_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v2_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v2_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v2_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v2_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v2_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v2_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz  + v2_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v2_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v2_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v2_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v2_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v2_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v2_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v2_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v2_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
v2_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v2_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
v2_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v2_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
v2_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
v2_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v2_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v2_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    v2_filter_4n(i,j,k)=v2_3d_4n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    v2_filter_4n(i,j,k)=v2_3d_4n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    v2_filter_4n(i,j,k)=v2_3d_4n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    v2_filter_4n(i,j,k)=v2_3d_4n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    v2_filter_4n(i,j,k)=v2_3d_4n(i,j,k);

end
end
end


v3_filter_4n = zeros(ni,nj,nk);

v3_3d_4n=zeros(ni,nj+2,nk);

y_new_4n(nj+2)=0;

for j=1:nj
    
    y_new_4n(j)=y(j);
end

y_new_4n(nj+1)= y(nj) + (y(nj)-y(nj-1));
y_new_4n(nj+2)= y(nj) + (y(nj)-y(nj-2));

for i=1:ni
for j=1:nj
for k=1:nk
    
    v3_3d_4n(i,j,k)=v3_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     v3_3d_4n(i,j,k)= v3_3d(i,j-2,k);
end
end
end

for i=1:ni
for j=nj+2
for k=1:nk
     v3_3d_4n(i,j,k)= v3_3d(i,j-4,k);
end
end
end


for i=3:ni-2
for j=3:nj
for k=3:nk-2
v3_filter_4n(i,j,k)= v3_filter_4n(i,j,k)+... 
(v3_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v3_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v3_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v3_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v3_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v3_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v3_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(16*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=3:ni-2
for j=2
for k=3:nk-2
v3_filter_4n(i,j,k)= v3_filter_4n(i,j,k)+... 
(v3_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v3_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v3_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v3_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v3_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v3_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v3_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
v3_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
v3_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
v3_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-1))/2)*dz +  ...
v3_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-1))/2)*dz)  ...
/(16*dx*dz*(y_new_4n(j+2)-y_new_4n(j-1))) ;                                                                                                                                        
end
end
end

for i=2
for j=3:nj
for k=3:nk-2
v3_filter_4n(i,j,k)= v3_filter_4n(i,j,k)+... 
(v3_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v3_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i-1,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-1,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-1,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-1,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-1,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v3_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v3_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v3_3d_4n(i-1,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-1,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-1,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-1,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-1,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v3_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-1,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i-1,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-1,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-1,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-1,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-1,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-1,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz ) ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end



for i=95
for j=3:nj
for k=3:nk-2
v3_filter_4n(i,j,k)= v3_filter_4n(i,j,k)+... 
(v3_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v3_3d_4n(i+1,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+1,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+1,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+1,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+1,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v3_3d_4n(i+1,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+1,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+1,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+1,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+1,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v3_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v3_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v3_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+1,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i+1,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+1,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+1,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+1,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+1,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+1,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=3:ni-2
for j=3:nj
for k=2
v3_filter_4n(i,j,k)= v3_filter_4n(i,j,k)+... 
(v3_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v3_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  ...
v3_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v3_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v3_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-1,j,k+2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v3_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-2,j,k+2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +...
v3_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v3_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v3_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v3_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v3_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v3_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v3_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v3_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-1,j+1,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  ...
v3_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v3_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-2,j+1,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +...
v3_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v3_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v3_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v3_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-1,k+2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-1,k+2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v3_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v3_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v3_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v3_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-1,j+2,k+2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v3_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-2,j+2,k+2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  ...
v3_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v3_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v3_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-2,k+2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  ...
v3_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-2,k+2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end

for i=3:ni-2
for j=3:nj
for k=95
v3_filter_4n(i,j,k)= v3_filter_4n(i,j,k)+... 
(v3_3d_4n(i,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v3_3d_4n(i,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +  ...
v3_3d_4n(i+1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v3_3d_4n(i+1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
v3_3d_4n(i+2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i+2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i+2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz +  v3_3d_4n(i+2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
v3_3d_4n(i-1,j,k)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-1,j,k-2)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-1,j,k-1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz  + v3_3d_4n(i-1,j,k+1)*dx*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
v3_3d_4n(i-2,j,k)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-2,j,k-2)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 + v3_3d_4n(i-2,j,k-1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz + v3_3d_4n(i-2,j,k+1)*(dx/2)*((y_new_4n(j+1)-y_new_4n(j-1))/2)*dz/2 +...
v3_3d_4n(i,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v3_3d_4n(i,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +  ...
v3_3d_4n(i+1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
v3_3d_4n(i+2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i+2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i+2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
v3_3d_4n(i-1,j+1,k)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-1,j+1,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-1,j+1,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v3_3d_4n(i-1,j+1,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +  ...
v3_3d_4n(i-2,j+1,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz + v3_3d_4n(i-2,j+1,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 + v3_3d_4n(i-2,j+1,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz +  v3_3d_4n(i-2,j+1,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j))/2)*dz/2 +...
v3_3d_4n(i,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v3_3d_4n(i,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v3_3d_4n(i-1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v3_3d_4n(i-2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v3_3d_4n(i+1,j-1,k)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-1,k-2)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-1,k-1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-1,k+1)*dx*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v3_3d_4n(i+2,j-1,k)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+2,j-1,k-2)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-1,k-1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz +  v3_3d_4n(i+2,j-1,k+1)*(dx/2)*((y_new_4n(j)-y_new_4n(j-2))/2)*dz/2 +  ...
v3_3d_4n(i,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v3_3d_4n(i,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v3_3d_4n(i+1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v3_3d_4n(i+2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i+2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i+2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz  + v3_3d_4n(i+2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v3_3d_4n(i-1,j+2,k)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-1,j+2,k-2)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-1,j+2,k-1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v3_3d_4n(i-1,j+2,k+1)*dx*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v3_3d_4n(i-2,j+2,k)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz + v3_3d_4n(i-2,j+2,k-2)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 + v3_3d_4n(i-2,j+2,k-1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz +  v3_3d_4n(i-2,j+2,k+1)*(dx/2)*((y_new_4n(j+2)-y_new_4n(j+1))/2)*dz/2 +  ...
v3_3d_4n(i,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v3_3d_4n(i,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
v3_3d_4n(i+1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v3_3d_4n(i+1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
v3_3d_4n(i+2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i+2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i+2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz +  v3_3d_4n(i+2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
v3_3d_4n(i-1,j-2,k)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-2,k-2)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-1,j-2,k-1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-1,j-2,k+1)*dx*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 +  ...
v3_3d_4n(i-2,j-2,k)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-2,j-2,k-2)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 + v3_3d_4n(i-2,j-2,k-1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz + v3_3d_4n(i-2,j-2,k+1)*(dx/2)*((y_new_4n(j-1)-y_new_4n(j-2))/2)*dz/2 )  ...
/(12*dx*dz*(y_new_4n(j+2)-y_new_4n(j-2))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    v3_filter_4n(i,j,k)=v3_3d_4n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    v3_filter_4n(i,j,k)=v3_3d_4n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    v3_filter_4n(i,j,k)=v3_3d_4n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    v3_filter_4n(i,j,k)=v3_3d_4n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    v3_filter_4n(i,j,k)=v3_3d_4n(i,j,k);

end
end
end





%Question 1%
u_double_filter_2n_y=u_double_filter_2n(ni/2,1:nj,nk/2);
u_filter_2n_y=u_filter_2n(48,1:nj,48);
u_3d_y=u_3d(ni/2,1:nj,nk/2);

%plot(y,umeanj,'--','LineWidth',1);
%hold on;
plot(y,u_3d_y,':','LineWidth',1.5);
%hold on;
%plot(y,u_filter_2n_y,'-','LineWidth',1 );
%hold on;
%plot(y,u_double_filter_2n_y,'-.','LineWidth',1);
%hold on;
%xlabel('y')
%ylabel('Velocity')


%legend('<U>','U','single filter n=2','double filter n=2')





%%%%%%%%%%%%%%%%%%%Question 2%%%%%%%%%%%%%%%%

u_filter_v_filter_2n(1:nj)=0;

for i=1:ni
for j=1:nj
for k=1:nk
    
    u_filter_v_filter_2n(j)= u_filter_v_filter_2n(j) +...
        (u1_filter_2n(i,j,k)*v1_filter_2n(i,j,k) +...
        u2_filter_2n(i,j,k)*v2_filter_2n(i,j,k) + ...
        u3_filter_2n(i,j,k)*v3_filter_2n(i,j,k))/3/ni/nk;

end
end
end


u_filter_v_filter_4n(1:nj)=0;

for i=1:ni
for j=1:nj
for k=1:nk
    
    u_filter_v_filter_4n(j)= u_filter_v_filter_4n(j) +...
        (u1_filter_4n(i,j,k)*v1_filter_4n(i,j,k) +...
        u2_filter_4n(i,j,k)*v2_filter_4n(i,j,k) + ...
        u3_filter_4n(i,j,k)*v3_filter_4n(i,j,k))/3/ni/nk;

end
end
end



%plot(y,u_filter_v_filter_4n);
%hold on;
%plot(y,u_filter_v_filter_2n);
%hold on;
%plot(y, Reynolds_uv);
%hold on;


%%%%%%%%%%%%%%%%% Question 3 %%%%%%%%%%%%%%%%%


u1_v1_filter_2n = zeros(ni,nj,nk);

u1_v1_3d_2n=zeros(ni,nj+1,nk);

y_new_2n(1:nj+1)=0;

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));
    

for i=1:ni
for j=1:nj
for k=1:nk
    
    u1_v1_3d_2n(i,j,k)=u1_3d(i,j,k)*v1_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u1_v1_3d_2n(i,j,k)= u1_3d(i,j-2,k)*v1_3d(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
u1_v1_filter_2n(i,j,k)= u1_v1_filter_2n(i,j,k)+... 
(u1_v1_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u1_v1_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u1_v1_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
u1_v1_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u1_v1_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u1_v1_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u1_v1_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u1_v1_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u1_v1_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u1_v1_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u1_v1_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u1_v1_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u1_v1_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u1_v1_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u1_v1_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u1_v1_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u1_v1_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u1_v1_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
u1_v1_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u1_v1_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u1_v1_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u1_v1_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u1_v1_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u1_v1_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u1_v1_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u1_v1_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u1_v1_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u1_v1_filter_2n(i,j,k)=u1_v1_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u1_v1_filter_2n(i,j,k)=u1_v1_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u1_v1_filter_2n(i,j,k)=u1_v1_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u1_v1_filter_2n(i,j,k)=u1_v1_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u1_v1_filter_2n(i,j,k)=u1_v1_3d_2n(i,j,k);

end
end
end


u2_v2_filter_2n = zeros(ni,nj,nk);

u2_v2_3d_2n=zeros(ni,nj+1,nk);

y_new_2n(1:nj+1)=0;

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));
    

for i=1:ni
for j=1:nj
for k=1:nk
    
    u2_v2_3d_2n(i,j,k)=u2_3d(i,j,k)*v2_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u2_v2_3d_2n(i,j,k)= u2_3d(i,j-2,k)*v2_3d(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
u2_v2_filter_2n(i,j,k)= u2_v2_filter_2n(i,j,k)+... 
(u2_v2_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u2_v2_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u2_v2_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
u2_v2_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u2_v2_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u2_v2_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u2_v2_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u2_v2_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u2_v2_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u2_v2_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u2_v2_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u2_v2_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u2_v2_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u2_v2_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u2_v2_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u2_v2_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u2_v2_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u2_v2_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
u2_v2_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u2_v2_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u2_v2_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u2_v2_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u2_v2_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u2_v2_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u2_v2_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u2_v2_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u2_v2_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u2_v2_filter_2n(i,j,k)=u2_v2_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u2_v2_filter_2n(i,j,k)=u2_v2_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u2_v2_filter_2n(i,j,k)=u2_v2_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u2_v2_filter_2n(i,j,k)=u2_v2_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u2_v2_filter_2n(i,j,k)=u2_v2_3d_2n(i,j,k);

end
end
end

u3_v3_filter_2n = zeros(ni,nj,nk);

u3_v3_3d_2n=zeros(ni,nj+1,nk);

y_new_2n(1:nj+1)=0;

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));
    

for i=1:ni
for j=1:nj
for k=1:nk
    
    u3_v3_3d_2n(i,j,k)=u3_3d(i,j,k)*v3_3d(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u3_v3_3d_2n(i,j,k)= u3_3d(i,j-2,k)*v3_3d(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
u3_v3_filter_2n(i,j,k)= u3_v3_filter_2n(i,j,k)+... 
(u3_v3_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u3_v3_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u3_v3_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
u3_v3_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u3_v3_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u3_v3_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u3_v3_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u3_v3_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u3_v3_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u3_v3_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u3_v3_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u3_v3_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u3_v3_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u3_v3_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u3_v3_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u3_v3_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u3_v3_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u3_v3_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
u3_v3_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u3_v3_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u3_v3_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u3_v3_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u3_v3_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u3_v3_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u3_v3_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u3_v3_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u3_v3_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u3_v3_filter_2n(i,j,k)=u3_v3_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u3_v3_filter_2n(i,j,k)=u3_v3_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u3_v3_filter_2n(i,j,k)=u3_v3_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u3_v3_filter_2n(i,j,k)=u3_v3_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u3_v3_filter_2n(i,j,k)=u3_v3_3d_2n(i,j,k);

end
end
end




for k=1:nk
for j=1:nj
for i=1:ni
TR_1(i,j,k)=u1_v1_filter_2n(i,j,k) - u1_filter_2n(i,j,k)*v1_filter_2n(i,j,k);
TR_2(i,j,k)=u2_v2_filter_2n(i,j,k) - u2_filter_2n(i,j,k)*v2_filter_2n(i,j,k);
TR_3(i,j,k)=u3_v3_filter_2n(i,j,k) - u3_filter_2n(i,j,k)*v3_filter_2n(i,j,k);
end
end
end

TR(1:nj)=0;
for k=1:nk
for i=1:ni
for j=1:nj
TR(j)=TR(j)+((TR_1(i,j,k)+TR_2(i,j,k)+TR_3(i,j,k)))/ni/nk/3;

end
end
end

%plot(y,TR);
%hold on;
%plot(y,Reynolds_uv);
%hold on;

%%%%%%%remember to do this part with n=4%%%%%%


%%%%%%Question 4%%%%%

u1_grad_y(1:ni,1:nj,1:nk)=0;
u2_grad_y(1:ni,1:nj,1:nk)=0;
u3_grad_y(1:ni,1:nj,1:nk)=0;

for i=1:ni
for j=1:nj-1
for k=1:nk

u1_grad_y(i,j,k) = u1_grad_y(i,j,k)+ (u1_3d(i,j+1,k)-u1_3d(i,j,k))/(y(j+1)-y(j));
u2_grad_y(i,j,k) = u2_grad_y(i,j,k)+ (u2_3d(i,j+1,k)-u2_3d(i,j,k))/(y(j+1)-y(j));
u3_grad_y(i,j,k) = u3_grad_y(i,j,k)+ (u3_3d(i,j+1,k)-u3_3d(i,j,k))/(y(j+1)-y(j));
end
end
end



u1_grad_y_filter_2n = zeros(ni,nj,nk);

u1_grad_y_3d_2n=zeros(ni,nj+1,nk);

y_new_2n(1:nj+1)=0;

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));
    

for i=1:ni
for j=1:nj
for k=1:nk
    
    u1_grad_y_3d_2n(i,j,k)=u1_grad_y(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u1_grad_y_3d_2n(i,j,k)= u1_grad_y(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
u1_grad_y_filter_2n(i,j,k)= u1_grad_y_filter_2n(i,j,k)+... 
(u1_grad_y_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u1_grad_y_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u1_grad_y_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
u1_grad_y_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u1_grad_y_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u1_grad_y_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u1_grad_y_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u1_grad_y_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u1_grad_y_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u1_grad_y_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u1_grad_y_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u1_grad_y_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u1_grad_y_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u1_grad_y_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u1_grad_y_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u1_grad_y_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u1_grad_y_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u1_grad_y_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
u1_grad_y_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u1_grad_y_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u1_grad_y_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u1_grad_y_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u1_grad_y_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u1_grad_y_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u1_grad_y_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u1_grad_y_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u1_grad_y_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u1_grad_y_filter_2n(i,j,k)=u1_grad_y_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u1_grad_y_filter_2n(i,j,k)=u1_grad_y_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u1_grad_y_filter_2n(i,j,k)=u1_grad_y_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u1_grad_y_filter_2n(i,j,k)=u1_grad_y_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u1_grad_y_filter_2n(i,j,k)=u1_grad_y_3d_2n(i,j,k);

end
end
end



u2_grad_y_filter_2n = zeros(ni,nj,nk);

u2_grad_y_3d_2n=zeros(ni,nj+1,nk);

y_new_2n(1:nj+1)=0;

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));
    

for i=1:ni
for j=1:nj
for k=1:nk
    
    u2_grad_y_3d_2n(i,j,k)=u2_grad_y(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u2_grad_y_3d_2n(i,j,k)= u2_grad_y(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
u2_grad_y_filter_2n(i,j,k)= u2_grad_y_filter_2n(i,j,k)+... 
(u2_grad_y_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u2_grad_y_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u2_grad_y_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
u2_grad_y_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u2_grad_y_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u2_grad_y_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u2_grad_y_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u2_grad_y_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u2_grad_y_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u2_grad_y_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u2_grad_y_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u2_grad_y_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u2_grad_y_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u2_grad_y_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u2_grad_y_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u2_grad_y_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u2_grad_y_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u2_grad_y_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
u2_grad_y_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u2_grad_y_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u2_grad_y_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u2_grad_y_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u2_grad_y_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u2_grad_y_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u2_grad_y_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u2_grad_y_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u2_grad_y_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u2_grad_y_filter_2n(i,j,k)=u2_grad_y_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u2_grad_y_filter_2n(i,j,k)=u2_grad_y_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u2_grad_y_filter_2n(i,j,k)=u2_grad_y_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u2_grad_y_filter_2n(i,j,k)=u2_grad_y_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u2_grad_y_filter_2n(i,j,k)=u2_grad_y_3d_2n(i,j,k);

end
end
end



u3_grad_y_filter_2n = zeros(ni,nj,nk);

u3_grad_y_3d_2n=zeros(ni,nj+1,nk);

y_new_2n(1:nj+1)=0;

for j=1:nj
    
    y_new_2n(j)=y(j);
end

y_new_2n(nj+1)= y(nj) + (y(nj)-y(nj-1));
    

for i=1:ni
for j=1:nj
for k=1:nk
    
    u3_grad_y_3d_2n(i,j,k)=u3_grad_y(i,j,k);

end
end
end

for i=1:ni
for j=nj+1
for k=1:nk
     u3_grad_y_3d_2n(i,j,k)= u3_grad_y(i,j-2,k);
end
end
end


for i=2:ni-1
for j=2:nj
for k=2:nk-1
u3_grad_y_filter_2n(i,j,k)= u3_grad_y_filter_2n(i,j,k)+... 
(u3_grad_y_3d_2n(i,j,k)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u3_grad_y_3d_2n(i,j,k-1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u3_grad_y_3d_2n(i,j,k+1)*dx*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + ...
u3_grad_y_3d_2n(i+1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u3_grad_y_3d_2n(i+1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u3_grad_y_3d_2n(i+1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u3_grad_y_3d_2n(i-1,j,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz + u3_grad_y_3d_2n(i-1,j,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 + u3_grad_y_3d_2n(i-1,j,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j-1))/2)*dz/2 +...
u3_grad_y_3d_2n(i,j+1,k)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u3_grad_y_3d_2n(i,j+1,k-1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u3_grad_y_3d_2n(i,j+1,k+1)*(dx)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u3_grad_y_3d_2n(i-1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u3_grad_y_3d_2n(i-1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u3_grad_y_3d_2n(i-1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 +...
u3_grad_y_3d_2n(i+1,j+1,k)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz + u3_grad_y_3d_2n(i+1,j+1,k-1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + u3_grad_y_3d_2n(i+1,j+1,k+1)*(dx/2)*((y_new_2n(j+1)-y_new_2n(j))/2)*dz/2 + ...
u3_grad_y_3d_2n(i,j-1,k)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u3_grad_y_3d_2n(i,j-1,k-1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u3_grad_y_3d_2n(i,j-1,k+1)*(dx)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u3_grad_y_3d_2n(i-1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u3_grad_y_3d_2n(i-1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u3_grad_y_3d_2n(i-1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 +...
u3_grad_y_3d_2n(i+1,j-1,k)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz + u3_grad_y_3d_2n(i+1,j-1,k-1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2 + u3_grad_y_3d_2n(i+1,j-1,k+1)*(dx/2)*((y_new_2n(j)-y_new_2n(j-1))/2)*dz/2)...
/(4*dx*dz*(y_new_2n(j+1)-y_new_2n(j-1))) ;                                                                                                                                        
end
end
end


for i=1:ni
for j=1
for k=1:nk
    
    u3_grad_y_filter_2n(i,j,k)=u3_grad_y_3d_2n(i,j,k);

end
end
end

for i=1
for j=1:nj
for k=1:nk
    
    u3_grad_y_filter_2n(i,j,k)=u3_grad_y_3d_2n(i,j,k);

end
end
end

for i=ni
for j=1:nj
for k=1:nk
    
    u3_grad_y_filter_2n(i,j,k)=u3_grad_y_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=1
    
    u3_grad_y_filter_2n(i,j,k)=u3_grad_y_3d_2n(i,j,k);

end
end
end

for i=1:ni
for j=1:nj
for k=nk
    
    u3_grad_y_filter_2n(i,j,k)=u3_grad_y_3d_2n(i,j,k);

end
end
end



for i=1:ni
for j=1:nj
for k=1:nk
    
    u_grad_y_filter_2n(i,j,k)=u3_grad_y_3d_2n(i,j,k);

end
end
end
