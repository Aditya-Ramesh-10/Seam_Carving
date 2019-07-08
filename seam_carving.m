function o_im = seam_carving(im, scale_on, scale_factor)

im = im2double(im);
if scale_on == 'r'
    im = permute(im, [2,1,3]);
end
sz = size(im);

iters = round(sz(2)*(1-scale_factor));
o_im = im;
for i=1:iters
    % Create energy map
    e_map = create_energy_map(o_im);

    % Find minimum energy seam
    [M , idx_M] = min_energy_vert_seam(e_map);

    % carve out the seam
    o_im = carve_vert_seam(o_im, M, idx_M);
end

if scale_on == 'r'
    o_im = permute(o_im, [2,1,3]);
end

end

