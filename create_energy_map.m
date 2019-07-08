function e_map = create_energy_map(im)
% Compute energy map
[g_x, g_y] = imgradientxy(rgb2gray(im), 'prewitt');
e_map = abs(g_x) + abs(g_y);
end

