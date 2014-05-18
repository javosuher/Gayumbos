function senal_recortada = inicio_fin (senv)

    M = magnitud(senv);
    Z = cruces_por_cero(senv);
    
    Ms = M(1 : 10);
    Zs = Z(1 : 10);
    
    Msm = mean(Ms);
    Msd = std(Ms);
    Zsm = mean(Zs);
    Zsd = std(Zs);
    UmbSupEnrg = 0.5 * max(M);
    UmbInfEnrg = Msm + 2 * Msd;
    UmbCruCero = Zsm + 2 * Zsd;
    
    ln=find(M(11:end)>UmbSupEnrg,1) + 10;
    
    le = find(M(1 : ln)<UmbInfEnrg,1,'last');
    
    if le>36
        el=le-25;
    else
        el=11;
    end
    count=0;
    lz=le;
    for i = le : -1 : el
        if Z(i) > UmbCruCero
            count=count+1;
        else
            count=0;
        end
        if count ==3
            lz=i;
        end
    end
    
    ln=find(M(lz:end)>UmbSupEnrg,1,'last') + lz-1;
    
    le = find(M(ln:end)<UmbInfEnrg,1) + ln-1;
    
    if le<length(M) - 26;
        el=le+25;
    else
        el=length(M);
    end
    count=0;
    
    lo=le;
    for i = le : el
        if Z(i) > UmbCruCero
            count=count+1;
        else
            count=0;
        end
        if count==3
            lo=i;
        end
    end
    senal_recortada = senal(lz*(num_muestras-despl) : lo*(num_muestras-despl));
end
