function [M , idx_M] = min_energy_vert_seam(e_map)

sz = size(e_map);
M = e_map;
idx_M = zeros(sz);

for i=2:sz(1)
    for j = 1:sz(2)
        if j == 1
            [min_val, prev_idx] = min(M(i-1,j:j+1));
            idx_M(i,j) = j + (prev_idx-1);        
        elseif j == sz(2)            
            [min_val, prev_idx] = min(M(i-1,j-1:j));
            idx_M(i,j) = j + (prev_idx-2);               
        else            
            [min_val, prev_idx] = min(M(i-1,j-1:j+1));
            idx_M(i,j) = j + (prev_idx-2);                 
        end
        
        
        M(i,j) = M(i,j) + min_val;
    end
    
   
end
end

