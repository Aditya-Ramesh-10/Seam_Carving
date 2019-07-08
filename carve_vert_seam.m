function op_im = carve_vert_seam(im_2, M, idx_M)

sz = size(M);
mask = zeros(sz);
mask = (mask == 1);

[~,j] = min(M(sz(1),:));

for i = sz(1):-1:1
    mask(i,j)= 1;
    j = idx_M(i,j);
end

% reconstruct
op_im = zeros(sz(1),sz(2)-1,3);
for i =1:sz(1)
   cx = find(mask(i,:)); 
   op_im(i,1:cx-1,:) = im_2(i,1:cx-1,:);
   op_im(i,cx:end,:) = im_2(i,cx+1:end,:);
end

end

