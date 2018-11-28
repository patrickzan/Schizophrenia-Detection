% In this step, I use k-nearest-neighbor(knn) classifier to classify tone
% responses in single feature, and combine the results of different
% features by bayesian. The result is in '../result/result.txt'.

clear all
root = '/Users/pzan/Documents/study_research/cssl/projects/meg_pattern';
feature = load(fullfile(root, 'feature', 'feature.mat'));
trainset = [feature.train_younger_feature; feature.train_older_feature];
testset = [feature.test_younger_feature; feature.test_older_feature];
pos_train_num = size(feature.train_younger_feature, 1);
neg_train_num = size(feature.train_older_feature, 1);
pos_test_num = size(feature.test_younger_feature, 1);
neg_test_num = size(feature.test_older_feature, 1);
test_num = size(testset, 1);

% the k in k-nearest-neighbor(knn) classifier
if pos_train_num + neg_train_num > 200
    k = 500;
else
    k = 4; % this parameter only used in the toy dataset, which is really small.
end

% feature 1: M50 timing feature
timing50_train_feature = trainset(:, 1);
timing50_test_feature = testset(:, 1);
% calculate the distance between two trials by using timing50 feature 
timing50_train_feature_mat = repmat(timing50_train_feature, 1, pos_test_num + neg_test_num);
timing50_test_feature_mat = repmat(timing50_test_feature', pos_train_num + neg_train_num,1);
timing50_distance = timing50_train_feature_mat - timing50_test_feature_mat;
timing50_distance = timing50_distance.^2;
%after calculating the distance, use k-nearest-neighbor(knn) classifier
%to classify trials
[timing50_disMat,timing50_Index] = sort(timing50_distance);
timing50_test_pos = sum(timing50_Index(1:k,:)<pos_train_num + 1);
timing50_test_neg = sum(timing50_Index(1:k,:)>pos_train_num);
timing50_test_pos = timing50_test_pos./k;
timing50_test_neg = timing50_test_neg./k;
% I use 9/17 as the threshold
timing50_precision = (sum(timing50_test_pos(1:pos_test_num)>9/17) + sum(timing50_test_pos(pos_test_num + 1:test_num)<9/17))/test_num;

% feature 2: M100 timing feature
timing100_train_feature = trainset(:, 2);
timing100_test_feature = testset(:, 2);
% calculate the distance between two trials by using timing100 feature 
timing100_train_feature_mat = repmat(timing100_train_feature, 1,pos_test_num + neg_test_num);
timing100_test_feature_mat = repmat(timing100_test_feature', pos_train_num + neg_train_num,1);
timing100_distance = timing100_train_feature_mat - timing100_test_feature_mat;
timing100_distance = timing100_distance.^2;
%after calculating the distance, use k-nearest-neighbor(knn) classifier
%to classify trials
[timing100_disMat,timing100_Index] = sort(timing100_distance);
timing100_test_pos = sum(timing100_Index(1:k,:)<pos_train_num + 1);
timing100_test_neg = sum(timing100_Index(1:k,:)>pos_train_num);
timing100_test_pos = timing100_test_pos./k;
timing100_test_neg = timing100_test_neg./k;
% I use 0.5 as the threshold
timing100_precision = (sum(timing100_test_pos(1:pos_test_num)>9/17) + sum(timing100_test_pos(pos_test_num + 1:test_num)<9/17))/test_num;

% feature 3: M200 timing feature
timing200_train_feature = trainset(:, 3);
timing200_test_feature = testset(:, 3);
% calculate the distance between two trials by using timing200 feature 
timing200_train_feature_mat = repmat(timing200_train_feature, 1,pos_test_num + neg_test_num);
timing200_test_feature_mat = repmat(timing200_test_feature', pos_train_num + neg_train_num,1);
timing200_distance = timing200_train_feature_mat - timing200_test_feature_mat;
timing200_distance = timing200_distance.^2;
%after calculating the distance, use k-nearest-neighbor(knn) classifier
%to classify trials
[timing200_disMat,timing200_Index] = sort(timing200_distance);
timing200_test_pos = sum(timing200_Index(1:k,:)<pos_train_num + 1);
timing200_test_neg = sum(timing200_Index(1:k,:)>pos_train_num);
timing200_test_pos = timing200_test_pos./k;
timing200_test_neg = timing200_test_neg./k;
% I use 0.5 as the threshold
timing200_precision = (sum(timing200_test_pos(1:pos_test_num)>9/17) + sum(timing200_test_pos(pos_test_num + 1:test_num)<9/17))/test_num;

% feature 4: M50 significance
significance50_train_feature = trainset(:, 4);
significance50_test_feature = testset(:, 4);
% calculate the distance between two trials by using significance50 feature 
significance50_train_feature_mat = repmat(significance50_train_feature, 1,pos_test_num + neg_test_num);
significance50_test_feature_mat = repmat(significance50_test_feature', pos_train_num + neg_train_num,1);
significance50_distance = significance50_train_feature_mat - significance50_test_feature_mat;
significance50_distance = significance50_distance.^2;
%after calculating the distance, use k-nearest-neighbor(knn) classifier
%to classify trials
[significance50_disMat,significance50_Index] = sort(significance50_distance);
significance50_test_pos = sum(significance50_Index(1:k,:)<pos_train_num + 1);
significance50_test_neg = sum(significance50_Index(1:k,:)>pos_train_num);
significance50_test_pos = significance50_test_pos./k;
significance50_test_neg = significance50_test_neg./k;
% I use 0.5 as the threshold
significance50_precision = (sum(significance50_test_pos(1:pos_test_num)>9/17) + sum(significance50_test_pos(pos_test_num + 1:test_num)<9/17))/test_num;

% feature 5: M100 significance feature
significance100_train_feature = trainset(:, 5);
significance100_test_feature = testset(:, 5);
% calculate the distance between two trials by using significance100 feature 
significance100_train_feature_mat = repmat(significance100_train_feature, 1,pos_test_num + neg_test_num);
significance100_test_feature_mat = repmat(significance100_test_feature', pos_train_num + neg_train_num,1);
significance100_distance = significance100_train_feature_mat - significance100_test_feature_mat;
significance100_distance = significance100_distance.^2;
%after calculating the distance, use k-nearest-neighbor(knn) classifier
%to classify trials
[significance100_disMat,significance100_Index] = sort(significance100_distance);
significance100_test_pos = sum(significance100_Index(1:k,:)<pos_train_num + 1);
significance100_test_neg = sum(significance100_Index(1:k,:)>pos_train_num);
significance100_test_pos = significance100_test_pos./k;
significance100_test_neg = significance100_test_neg./k;
% I use 0.5 as the threshold
significance100_precision = (sum(significance100_test_pos(1:pos_test_num)>9/17) + sum(significance100_test_pos(pos_test_num + 1:test_num)<9/17))/test_num;

% feature 6: M200 significance feature
significance200_train_feature = trainset(:, 6);
significance200_test_feature = testset(:, 6);
% calculate the distance between two trials by using significance200 feature 
significance200_train_feature_mat = repmat(significance200_train_feature, 1,pos_test_num + neg_test_num);
significance200_test_feature_mat = repmat(significance200_test_feature', pos_train_num + neg_train_num,1);
significance200_distance = significance200_train_feature_mat - significance200_test_feature_mat;
significance200_distance = significance200_distance.^2;
%after calculating the distance, use k-nearest-neighbor(knn) classifier
%to classify trials
[significance200_disMat,significance200_Index] = sort(significance200_distance);
significance200_test_pos = sum(significance200_Index(1:k,:)<pos_train_num + 1);
significance200_test_neg = sum(significance200_Index(1:k,:)>pos_train_num);
significance200_test_pos = significance200_test_pos./k;
significance200_test_neg = significance200_test_neg./k;
% I use 0.5 as the threshold
significance200_precision = (sum(significance200_test_pos(1:pos_test_num)>9/17) + sum(significance200_test_pos(pos_test_num + 1:test_num)<9/17))/test_num;



% Combine all scores of different features by bayesian. 
a = (timing50_test_pos.*timing100_test_pos.*timing200_test_pos.*significance50_test_pos.*significance100_test_pos.*significance200_test_pos);
b = (timing50_test_neg.*timing100_test_neg.*timing200_test_neg.*significance50_test_neg.*significance100_test_neg.*significance200_test_neg);
bayesian_test = zeros(1,test_num);
for j = 1:test_num
    bayesian_test(j) = a(j)/b(j);
end
precision = (sum(bayesian_test(1:pos_test_num)>1)+sum(bayesian_test(pos_test_num+1:test_num)<1))/test_num;
precision_pos = sum(bayesian_test(1:pos_test_num)>1)/pos_test_num;
precision_neg = sum(bayesian_test(pos_test_num+1:test_num)<1)/neg_test_num;
max_precision = max(precision);
fprintf('The overall precision is %2.2f%%.\n', precision*100);
save(fullfile(root, 'result', 'result.mat'),  'timing50_precision', 'timing100_precision', 'timing200_precision', ...
    'significance50_precision', 'significance100_precision', 'significance200_precision', ...
    'bayesian_test', 'precision', 'max_precision', 'precision_pos', 'precision_neg')

%output the result
%please DO NOT modify the following code!!!
output = fopen(fullfile(root, 'result', 'result.txt'),'w+');
for i = 1:test_num
    fprintf(output, '%d %f\r\n', i, bayesian_test(i));
end
fclose(output);










