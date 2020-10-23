% Diversidad.- Es El Grado De Dispersi�n De Las Particulas
% 1 Distancia Euclidiana Entre La Mejor Part Y Las Dem�s
% 2 Distancia Euclidiana Entre Una Part Promedio Y Las Dem�s

function Diver = Diversidad(swarm,Postbest)
    % Tama�o De La Swarm
    [nArm,~] = size(swarm);
    TipoDiver = 2;
    if TipoDiver == 1
        % Selecciona La Mejor Part�cula Dada Su Posici�n
        Best = swarm(Postbest,:);
        % Elimina La Mejor Part�cula De La Swarm
        swarm(Postbest,:) = [];
        % Para Guardar Las Distancias
        D1 = zeros(nArm-1,1);
        for i=1:nArm-1
            % Distancia Euclidiana
            D1(i) = sqrt(sum((swarm(i,:)-Best).^2));
        end
        % Formula De Ratnaweera Para La Diversidad
        dis = (1/nArm)*sum(D1);
        Diver = (dis-min(D1))/(max(D1)-min(D1)); % Normalizar
    else
        % Otra Medida Para La Diversidad
        D2=zeros(nArm,1);
        % Xj Es Una Part�cula Promedio
        Xj=sum(swarm)/nArm;
        for i=1:nArm
            D2(i)=sqrt(sum((swarm(i,:)-Xj).^2));
        end
        Div = (1/nArm)*sum(D2);
        % Si Todas Las Part�culas Tienen La Misma Diversidad
        if min(D2)==max(D2)
            % Establecer La Diversidad En 0 Para Que Exploren y Se Separen
            Diver = 0;
        else
            Diver = (Div-min(D2))/(max(D2)-min(D2)); % Normalizar
        end
    end
end
