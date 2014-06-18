function comb_AnimSeq = stl_utl_addWreckageToExplosionBkg(Explo_AnimSeq, WreckageImage)

comb_AnimSeq = Explo_AnimSeq;

for i = 1:length(Explo_AnimSeq)
    
    ExploImage = Explo_AnimSeq{i};
    sizeExploImage = size(ExploImage(:,:,1));
    sizeWreckageImage = size(WreckageImage(:,:,1));
    
    sizeFinalImage = max(sizeExploImage, sizeWreckageImage);
    
    
    FinalImage = zeros([sizeFinalImage, 4]);    % The final combined image;
    FinalMaskImage = FinalImage;    % The mask Image
    FinalMask = false([sizeFinalImage 4]);
    
    LeftTopPos = floor((sizeFinalImage - sizeWreckageImage)./2) + 1;
    
    FinalImage(LeftTopPos(1):(LeftTopPos(1)+sizeWreckageImage(1)-1), ...
        LeftTopPos(2):(LeftTopPos(2)+sizeWreckageImage(2)-1), ...
        :) = WreckageImage;
    
    LeftTopPos = floor((sizeFinalImage - sizeExploImage)./2) + 1;
    
    FinalMask(LeftTopPos(1):(LeftTopPos(1)+sizeExploImage(1)-1), ...
        LeftTopPos(2):(LeftTopPos(2)+sizeExploImage(2)-1),:) ...
        = logical(ExploImage(:,:,[4 4 4 4]));
    
    FinalMaskImage(LeftTopPos(1):(LeftTopPos(1)+sizeExploImage(1)-1), ...
        LeftTopPos(2):(LeftTopPos(2)+sizeExploImage(2)-1), :)...
        = ExploImage;
    
    
    FinalImage(FinalMask) = FinalMaskImage(FinalMask);
    
    comb_AnimSeq{i} = FinalImage;
end