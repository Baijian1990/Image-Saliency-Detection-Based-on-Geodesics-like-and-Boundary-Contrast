function idxImg = SLIC_Split(noFrameImg, spnumber_input)
    % super-pixels Segment using SLIC algorithm:

    % R.Achanta, A.Shaji, K.Smith, A.Lucchi, P.Fua, and S.Susstrunk. 
    % Slic superpixels compared to state-of-the-art superpixel meth-
    % ods. IEEE Transactions on Pattern Analysis and Machine Intell-
    % igence, 2012.
    compactness = 20; 
    [idxImg, spNum] = SLIC_mex(noFrameImg, spnumber_input, compactness);

end
