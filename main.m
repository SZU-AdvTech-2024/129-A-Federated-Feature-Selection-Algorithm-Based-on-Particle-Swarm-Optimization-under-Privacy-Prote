function main()
    % ��������ʵ����������Ⱥ�Ż�����ѡ���㷨 (FPSO-FS)
    
    % �������ݼ�
    load('data.mat'); % �������ݼ�Ϊ data.mat������ data �� labels
                      % data: ������������labels: ������ǩ
    
    % ��������
    numParticipants = 5;       % ������뷽����
    numParticles = 20;         % ÿ�����뷽����������
    maxGlobalIter = 10;        % ȫ�ֵ�������
    maxLocalIter = 50;         % ÿ�����뷽�ı��ص�������
    
    % ���� FPSO-FS �㷨
    fprintf('Starting FPSO-FS...\n');
    [globalBestFeatures, globalBestAccuracy] = FPSO_FS(data, labels, ...
                                                       numParticipants, ...
                                                       numParticles, ...
                                                       maxGlobalIter, ...
                                                       maxLocalIter);
    
    % ������
    fprintf('Global Best Features Selected: \n');
    disp(find(globalBestFeatures)); % ��ʾѡ�е���������
    fprintf('Global Best Classification Accuracy: %.4f\n', globalBestAccuracy);
    
    % ���ӻ������ѡ�����������׼ȷ�ʣ�
    visualizeResults(globalBestFeatures, globalBestAccuracy);
end

