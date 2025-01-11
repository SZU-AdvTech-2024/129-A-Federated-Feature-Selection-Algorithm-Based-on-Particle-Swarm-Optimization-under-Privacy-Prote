function main()
    % 主函数：实现联邦粒子群优化特征选择算法 (FPSO-FS)
    
    % 加载数据集
    load('data.mat'); % 假设数据集为 data.mat，包含 data 和 labels
                      % data: 样本特征矩阵，labels: 样本标签
    
    % 参数设置
    numParticipants = 5;       % 联邦参与方数量
    numParticles = 20;         % 每个参与方的粒子数量
    maxGlobalIter = 10;        % 全局迭代次数
    maxLocalIter = 50;         % 每个参与方的本地迭代次数
    
    % 调用 FPSO-FS 算法
    fprintf('Starting FPSO-FS...\n');
    [globalBestFeatures, globalBestAccuracy] = FPSO_FS(data, labels, ...
                                                       numParticipants, ...
                                                       numParticles, ...
                                                       maxGlobalIter, ...
                                                       maxLocalIter);
    
    % 输出结果
    fprintf('Global Best Features Selected: \n');
    disp(find(globalBestFeatures)); % 显示选中的特征索引
    fprintf('Global Best Classification Accuracy: %.4f\n', globalBestAccuracy);
    
    % 可视化结果（选中特征与分类准确率）
    visualizeResults(globalBestFeatures, globalBestAccuracy);
end

