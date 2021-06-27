# Image-Rectification-up-to-similarity
This is Implementation of image Reification up to similarity from the Multiview-Geometry 

Implemntation is as follows

Affine Rectification

1. Point out 2 pairs of parallel lines
2. compute the Ideal points for each of pair of parallel lines
3. Compute the vanishing line from the Ideal Points
4. Compute the Homography Matrix as follows

      1      0      0
      0      1       0
     -L1/L3 -L2/L3 1/L3   where L is the Vanishing Line

5. Wrap the Image By Inverse projective Transfom
     HX  = x


Metric rectification
1. we need to find the pair of orthogonal lines say L1,M1 and L2,M2
2. create the system of liner equations are follows
        [l11*m11, l11*m12 + l12*m11, l12*m12];
        [l21*m21, l21*m22 + l22*m21, l22*m22];

3. The null vector of the above equation gives the matrix say S
4. By cholesky decompostion we can kind Affine Matrix A  = K 0
							   0' 1
             where s= kk'
5. then using A we can rectify the image up to similarity
