# Image-Rectification-up-to-similarity
This is Implementation of image Reification up to similarity from the Multiview-Geometry 

Implemntation is as follows

1. Point out 2 pairs of parallel lines
2. compute the Ideal points for each of pair of parallel lines
3. Compute the vanishing line from the Ideal Points
4. Compute the Homography Matrix as follows

      1      0      0
      0      1       0
     -L1/L3 -L2/L3 1/L3   where L is the Vanishing Line

5. Wrap the Image By Inverse projective Transfom
     HX  = x
