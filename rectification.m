clear all 
close all

img_cell = cell(1,10);

frame = 'building.jpg';
img = imread(frame);

%% these p11 p21 give one line in the same way p31 and p41 one more line such way that both are parallel
%% intersection of the paraller lines (p11 and p21) , line (p31 ,p41) gives point a infinity in the image plane
%% same applies for the lines formed by the (p51,p61) and (p71,p81)
p11 = [194, 311, 1]';
p21 = [677,353, 1]';

p31 = [163,496, 1]';
p41 = [702,485, 1]';

p51 = [688,302, 1]';
p61 = [703,484, 1]';

p71 = [194,267, 1]';
p81 = [194,480, 1]';

l1 = cross(p11, p21); %%  line L1
l2 = cross(p31, p41); %%  line 2 
l3 = cross(p51, p61); %%  Line 3
l4 = cross(p71, p81); %%  Line 4
s = size(img);

%%%%%%%%%%%%%%%%

p_inf1 = cross(l1,l2); %% intersection of line 1 and line 2
p_inf2 = cross(l3,l4); %% intersection of line 3 and line 4

l_inf = cross(p_inf1, p_inf2); %% Line at infinity
l_inf = l_inf / norm(l_inf);
l_inf = l_inf / l_inf(3);

H = [1, 0, 0; 0, 1, 0; -(l_inf(1)/l_inf(3)) , -(l_inf(2)/l_inf(3)) , (1/l_inf(3));];
H = inv(H);
boundaries = [1, s(2), s(2), 1; 1, 1, s(1), s(1),; 1, 1, 1, 1];
tl=H*boundaries(:,1);
tl=tl/tl(3);
tr=H*boundaries(:,2);
tr=tr/tr(3);
br=H*boundaries(:,3);
br=br/br(3);
bl=H*boundaries(:,4);
bl=bl/bl(3);
point_boundaries = [tl';tr';br';bl'];
new_boundaries = ceil([max(point_boundaries(:,1)), max(point_boundaries(:,2))]);

    figure;
    imshow(img);
    hold on;
    plot([p11(1),p21(1)],[p11(2),p21(2)],'Color','r','LineWidth',2)
    plot([p31(1),p41(1)],[p31(2),p41(2)],'Color','r','LineWidth',2)
    plot([p51(1),p61(1)],[p51(2),p61(2)],'Color','r','LineWidth',2)
    plot([p71(1),p81(1)],[p71(2),p81(2)],'Color','r','LineWidth',2)

final_img = uint8(zeros(new_boundaries(2), new_boundaries(1), 3));

for x=1: new_boundaries(1)
    for y=1: new_boundaries(2)
        xy = [x, y, 1]';
        original_point = H\xy;
        original_point = round(original_point/original_point(3));
        
        if (original_point(1) < s(2) && original_point(2) < s(1))
            if (original_point(1) > 0 && original_point(2) > 0)
                final_img(y, x, :) = img(original_point(2), original_point(1),:);
            end
        end
    end
end



    figure;
    imshow(final_img);
    hold on;
    
  