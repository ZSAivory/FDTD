%calculate_ material_component_ values.m
disp ('filling material components arrays'); 
% creating temporary 1D arrays for storing
% parameter values of material types 
for ind= 1 :size (material_types, 2) 
    t_eps_r (ind)= material_types (ind) .eps_r; 
    t_mu_r (ind) =material_types (ind) .mu_r; 
    t_sigma_e(ind)=material_types (ind) .sigrna_e; 
    t_sigma_m(ind) = material_types (ind) .sigma_m;    
end

% assign neg且gibly small values to t_mu_r and t_sigma_m where they are
% zero in order to prevent division by zero error 
t_mu_r(find (t_mu_ r= = 0))= le- 20; 
t_sigma_m(find(t_sigma_m= = 0)) = le- 20; 
disp('Calculating eps_r_x');
% eps_r_x(i,j,k) is average of four cells 
% (i,j,k),(i,j- 1,k), (i,j,k一1), (i, j一1,k- 1) 
eps_r_x(l:nx,2:ny,2:nz) = ... 
   0.25 * (t_eps_r(materia1_3d_space(l:nx,2:ny,2:nz)) ...
  + t_eps_r(material_3d_space(l:nx,l:ny-1,2:nz))...
  + t_eps_r(material_3d_space(l:nx,2:ny-1,1:nz-1))...
  + t_eps_r(material_3d_space(l:nx,1:ny- 1,1:nz-1)));

disp ('Calculating eps_r_y');
% eps_r_y(i, j_, kl is average of four cells 
% (i,j,k),(i- 1,j,k), (i,j,k- 1), (i- 1,j,k- 1)
eps_r_y(2:nx, l :ny,2:nz) = ... 
    0.25 * (t_eps_r (material_3d_space (2:nx, 1:ny, 2:nz))...
    + t_eps_r(material_3d_space(l:nx- 1,1:ny,2:nz))...
    + t_eps_r(material_3d_space(2:nx,1:ny,1:nz- 1))...
    + t_eps_r(materia1_3d_space(l:nx- 1,1:ny,1:nz- 1)));

disp('Calculating eps_r_z);
%eps_r_z(i,j,k) is average of four cells 
% (i,j,k),(i- 1,j,k), (i,j- 1,k), (i- 1,j- 1,k) 
eps_r_z(2:nx,2:ny,l:nz)=...
    0.25 * (t_eps_r(materia1_3d_space(2:nx,2:ny,l:nz)) ...
    + t_eps_r(material_3d_space(l:nx- 1,2:ny,l:nz))...
    + t_eps_r(material_3d_space (2 :nx, 1 :ny- 1, 1 :nz)) ...
    + t_eps_r (material_3d_space (1 :nx- 1,1:ny- 1,1:nz)));
    
disp ('Calculating sigma_e__x');
%sigma_e_x(i,j,k) is average of four cells 
% (i,j,k),(i,j- l,k), (i,j,k一1), (i,j- l,k- 1) 
 sigma_e_x(l:nx,2:ny,2:nz)= ...
     0.25 * (t_sigma_e(material_3d_space(l:nx,2:ny,2:nz)) ...
     +	t_sigma_e (material_3d_space (1 :rut, 1 :ny-1,2:nz)) ...
     +  t_sigma_e (material_3d_space (1 :nx, 2 :ny, l:nz- 1)) ...
     +  t_sigma_e(material_3d_space(l:nx,l:ny- 1,1:nz- l)));
 
 disp ('Calculating sigma_e_y'); 
% sigma_e_y(i,j,k) is average of four cells 
% (i,j,k),(i- 1,j,k), (i,j,k一1), (i- 1,j,k一1) 
sigma_e_y(2:nx, 1:ny,2:nz)=...
    0. 25 * (t_sigma_e (material_3d_space (2:nx, 1 :ny, 2 :nz))...
    +	t_sigma_e (material_3d_space (l:nx-1,l:ny,2:nz))...
    +	t_sigma_e(materia1_3d_space(2:nx,1:ny,1:nz- 1)) ...
    +	t_sigma_e(material_3d_space(l:nx- 1,1:ny,1:n-1)));

disp ('Calculating sigma_e_z'); 
% sigma_e_z(i, j, k) is average of four cells 
% (i,j,k), (i一l,j,k), (i,j一l,k), (i- l,j一1,k)
sigma_e_z (2:ruc,2:ny, 1 :nz) = ... 
    0.25 * (t_sigma_e(material_3d_space(2:nx,2:ny,l:nz)) ...
   + t_sigma_e(material_3d_space(l:nx- 1,2:ny,l:nz))...
   +	t_sigma_e(material_3d_space(2:nx,1:ny- 1,1:nz)) ...
   +	t_sigma_e (materia1_3d_space (1 :nx- l, 1 :ny- l, 1: nz)));

disp ('Calculating mu_r_x'); 
% mu_r_x(i,j,k) is average of two cells (i,j,k), (i- l,j,k)
mu_r_x(2 :nx, 1 :ny, 1 :nz) = ...
    2 * (t_mu_r (material_3d_space (2 :nx, 1 :ny, 1 :nz))... 
    .* t_mu_r(material_3d_space(1:nx-1,1:ny,1:nz))...
     . * t_mu__r (material_3d_space (1 :nx- 1, 1 :ny, 1 :nz))...
     + t_mu_r(material_3d_space(l:nx- 1,1:ny,l:nz)));
 
 disp ('Calculating mu_r_y'l; 
% mu_r_y(i,j,k) is average of two cells (i,j,k), (i,j- l,k)
mu_r_y(l:nx,2:ny,1 :nz) = ...
  2*(t_mu_r(material_3d_space(l:nx,2:ny,l:nz))...
  .*t_mu_r(material_3d_space(l:nx,l:ny- 1,1:nz))) ...
  ./(t_mu_r(material_3d_space(l:nx,2:ny,l:nz)) ...
  + t_mu_r(material_3d_space (l :nx, l:ny- l, l :nz)));

disp ('Calculating mu r z'); 
% mu_r_z(i,j,k) is average of two cells (i,j,k), (i,j,k一1)
mu_r_z(l:nx,l:ny,2:nz)= ... 
    2*(t_mu_r(material_3d_space(1:nx,1:ny,2:nz))...
    .*t_mu_r(material_3d_space(l:nx,l:ny,l:nz- 1))) ...
    ./(t_mu_r(material_3d_space(l:nx,l:ny,2:nz)))...
    + t_mu_r(mc1terial_3d_space(l:nx,1:ny,1:nz- l)));

disp ('Calculating sigma_m一天）；
%sigma_m_x(i,j,k) is average of two cells (i,j,kl, (i- l,j,k) 
sigma_m_x (2 :nx, 1 :ny, 1 :nz) =...
    2 * (t_sigma_m(materia1_3d_space (2 :nx, 1 :ny, 1 :nz))...
    .*t_sigma_m(materia1_3d_space(l:nx- 1,1:ny,l:nz))) ...
    ./(t_sigma_m(material_3d_space(2: nx, 1 :ny, 1 :nz)) ...
    + t_sigma_m(material_3d_space (1 :nx- 1, 1 :ny, 1 :nz)));

disp('Calculating sigma_m_y'); 
% sigma_m_y(i,j,k) is average of two cells (i,j,k), (i,j- l.k)
sigma_m_y(l:nx,2:ny,l:nz) = ...
    2 *(t_sigma_m(materia1_3d_space (1 :nx, 2 :ny, 1 :nz))...
    .* t_sigma_m(materia1_3d_space (1 :nx, 1 :ny- 1, 1 :nz))) ...
     ./(t_sigma_m(materia1_3d_space(l:nx,2:ny,1:nz)) ... 
     + t_sigma_m(material_3d_space(l:nx, 1:ny- 1,1:nz)));
 
 disp ('Calculating sigma_rn_z'); 
% sigrna_rn_z(i,j,k) is average of two cells (i,j,k), (i,j,k一1)
sigma_m_z(l:nx,l:ny,2:nz)=...
  2 * (t_sigma_m(material_3d_space(l:nx,l:ny,2:nz)) ...
  .* t_sigma_m(materia1_3d_space(1 :nx, 1:ny, 1 :nz- l)))...
  ./(t_sigma_m(materia1_3d_space (1 :nx, 1 :ny, 2 :nz)) ...
  + t_sigma_m(materia1_3d_s_pace (1 :nx, l:ny, 1 :nz- 1)));
  


    
    
































