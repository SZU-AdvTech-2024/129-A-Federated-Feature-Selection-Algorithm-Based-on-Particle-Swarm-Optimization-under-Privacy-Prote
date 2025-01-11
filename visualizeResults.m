function visualizeResults(features, accuracy)
    figure;
    subplot(1, 2, 1);
    bar(features);
    title('Selected Features');
    xlabel('Feature Index');
    ylabel('Selection (0 or 1)');

    subplot(1, 2, 2);
    text(0.5, 0.5, sprintf('Accuracy: %.4f', accuracy), ...
         'HorizontalAlignment', 'center', 'FontSize', 14);
    title('Classification Accuracy');
    axis off;
end
